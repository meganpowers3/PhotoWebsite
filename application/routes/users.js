var express = require("express");
var router = express.Router();
var db      = require('../conf/database');
const successPrint = require('../helpers/debug/debughelpers').successPrint;
var isLoggedIn = require('../middleware/routeprotectors.js').userIsLoggedIn;
const multer = require('multer');
const sharp = require('sharp');
const crypto = require('crypto');
const UserController = require('../controller/users');

var storage = multer.diskStorage({
  destination:function(req, file, cb){
    cb(null, "public/images/uploads");
  },
  filename: function(req, file, cb){
    let fileExt = file.mimetype.split("/")[1];
    let randomName = crypto.randomBytes(22).toString("hex");
    cb(null, `${randomName}.${fileExt}`);
  }
});

var uploader = multer({storage: storage});

router.get('/search/:searchTerm', (req, resp, next) =>{
  let searchTerm = req.params.searchTerm;
  let _sql =
    'SELECT p.id, p.title, p.description, p.thumbnail, u.username \
    FROM posts p \
    JOIN users u on p.fk_userid=u.id \
    WHERE title LIKE ?;';
    searchTerm = "%" + searchTerm + "%";
    db.query(_sql, [searchTerm])
    .then(([results, fields]) =>{
      resp.json(results);
    })
    .catch((err) => next(err));
})

router.get('/getRecentPosts', (req, resp, next) =>{
  let _sql =
    "SELECT p.id, p.title, p.description, p.thumbnail, u.username, p.created \
    FROM posts p \
    JOIN users u on p.fk_userid=u.id \
    ORDER BY p.created DESC\
    LIMIT 8";
    db.query(_sql,)
    .then(([results, fields]) =>{
      resp.json(results);
    })
    .catch((err) => next(err));
})

router.get('/getComments', (req, resp, next) =>{
  let _sql =
    "SELECT c.id, c.comment \
    FROM comments c";
    db.query(_sql,)
    .then(([results, fields]) =>{
      resp.json(results);
    })
    .catch((err) => next(err));
})

router.post('/registration', (request, response, next) => {
  UserController.createUser(request, response, next);
});

router.get('/profile', (request, response) =>{
  bucket.get(request.pid, (error, result) => {
    if(error) {
      return response.status(500).send(error);
    }
    response.send(result.value);
  });
});

router.post('/comment', (request, response) => {
  var userID = "0";
  var newComment = "comment";

  let baseSQ = `INSERT INTO comments (id, comment) VALUES (?, ?) ;`;
  db.execute(baseSQ, [userID, newComment]);
  response.redirect('/index');
});

router.post('/login', (request, response, next) => {
  UserController.logIn(request, response, next);
});

router.post('/logout', (request, response, next) =>{
  UserController.logOut(request, response, next);
})

router.use('/createPost', isLoggedIn);

router.post('/createPost', uploader.single('uploadImage'), (req, resp, next) => {
    let fileUploaded = req.file.path;
    let fileAsThumbnail = `thumbnail-${req.file.filename}`;
    let destOfThumbnail = req.file.destination+"/" + fileAsThumbnail;
    let title = req.body.title;
    let desc = req.body.description;
    let fk_userid = req.session.userID;

    sharp(fileUploaded)
      .resize(200, 400)
      .toFile(destOfThumbnail)
      .then(() =>{
        let baseSQ = `INSERT INTO posts(title, description, photopath, thumbnail, created, fk_userid) VALUE (?, ?, ?, ?, now(), ?);`
        return db.execute(baseSQ, [title, desc, fileUploaded, destOfThumbnail, fk_userid]);
      })
      .then(([results, fields]) =>{
        if(results && results.affectedRows){
          successPrint("new posts created");
          resp.redirect('/');
        }else{
          next(Error('post was not created'));
        }
      })
  })

router.get('/imagePost/:id', (req, resp, next) => {
  resp.sendFile("image.html", {root: "public/"});
});


router.get('/getPostsById/:id', (req, resp, next) =>{
  let _id = req.params.id;
  let _sql =
    "SELECT p.id, p.title, p.description, p.photopath, u.username, p.created \
    FROM posts p \
    JOIN users u on p.fk_userid =  u.id \
    WHERE p.id=?;";

    db.query(_sql, _id)
      .then(([results, fields]) => {
        resp.json(results[0]);
      })
      .catch((err) => next(err));
});


module.exports = router;