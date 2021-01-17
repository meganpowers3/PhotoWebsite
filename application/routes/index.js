var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.sendFile('index.html',{root:"public"});
});

/* GET login page. */
router.get('/login', function(req, res, next) {
  res.sendFile('login.html',{root:"public"});
});

/* GET about page. */
router.get('/about', function(req, res, next) {
  res.sendFile('about.html',{root:"public"});
});

/* GET homepage. */
router.get('/homepage', function(req, res, next) {
  res.sendFile('homepage.html',{root:"public"});
});

/* GET image. */
router.get('/image', function(req, res, next) {
  res.sendFile('image.html',{root:"public"});
});

/* GET index. */
router.get('/index', function(req, res, next) {
  res.sendFile('index.html',{root:"public"});
});

/* GET postimage. */
router.get('/postimage', function(req, res, next) {
  res.sendFile('postimage.html',{root:"public"});
});

/* GET postimage. */
router.get('/profile', function(req, res, next) {
  res.sendFile('profile.html',{root:"public"});
});

/* GET postimage. */
router.get('/registration', function(req, res, next) {
  res.sendFile('registration.html',{root:"public"});
});

/* GET postimage. */
router.get('/searchresults', function(req, res, next) {
  res.sendFile('searchresults.html',{root:"public"});
});


module.exports = router;
