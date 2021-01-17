var express = require('express');
var router = express.Router();
var db      = require('../conf/database');

router.get('/getAllUsers', (req, res, next) =>{
    db.query('SELECT * from users;', (err, results, fields) => 
    {
            console.log(results);
            res.send(results);
    })
});

module.exports = router;
