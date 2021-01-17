var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
global["isLoggedIn"] = false;
var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');
var session = require('express-session');
var app = express();

var fileUpload = require('express-fileupload');

var session = require("express-session");
var mysqlStore = require("express-mysql-session")(session);
app.use(logger('dev'));
app.use(express.json());
mysql2 = require('mysql2');

var sessionStore = new mysqlStore({/*using default options */}, require('./conf/database'));

var sessionOptions = {
    key: "csid",
    secret: "this is a secret for csc317",
    store: sessionStore,
    cookie: {secure: false, httpOnly: false, maxAge:900000}, 
    resave: false,
    saveUninitialized: false
}

app.use(session(sessionOptions));

app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use("/public",express.static(path.join(__dirname, 'public')));
app.use('/', indexRouter);
app.use('/users', usersRouter);


module.exports = app;

































