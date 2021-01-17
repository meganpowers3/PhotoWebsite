// UserController.logOut(req, resp, next):

const errorPrint = require('../helpers/debug/debughelpers').errorPrint;
const successPrint = require('../helpers/debug/debughelpers').successPrint;
const UserError = require('../helpers/errors/UserError.js');
const UserModel = require('../model/users');
const bcrypt = require('bcrypt');


const UserController = {
    createUser: function(request, response, next){
        let username = request.body.username;
        let email = request.body.email;
        let password = request.body.password;
      
        UserModel.usernameExists(username)
        .then((usernameDoesNotExist) => {
          if(usernameDoesNotExist){
            return UserModel.emailExists(email);
          }else{
            throw new UserError(
              "Failed Registration, username already exists",
              "/",
              200
            );
          }
        })
        .then((emailDoesNotExist) =>{ 
          if(emailDoesNotExist){
            return bcrypt.hash(password, 10);
          }else{
            throw new UserError(
              "Failed Registration, email already exists",
              "/",
              200
            );
          }
        })
        .then((hashedPassword) =>{
          return UserModel.create(username, hashedPassword, email);
        })
        .then((userWasCreated) =>{
          if(userWasCreated){
            successPrint("Registration success!");
            response.redirect("/login");
          }else{
            throw new UserError(
              "Failed Registration, user not created",
              "/s",
              500
            );
          }
        })
          .catch((err) =>{
            if(err instanceof UserError){
              errorPrint(err.getMessage());
              response.status(err.getStatus());
              response.redirect(err.getRedirectURL());
            }
            next(err);
          });
    },
    logIn: function(request, response, next){
        let username = request.body.username;
        let password = request.body.password;
        let userID;
      
        UserModel.authenticate(username, password)
        .then((UserData) => {
          if(UserData){
            successPrint('successful login');
            request.session.username = UserData.user;
            request.session.userID = UserData.uid; 
            response.redirect('/index');
          }else{
            throw new UserError('username or password is incorrect', 
            '/login', 
            200);
          }
        })
        .catch((err) =>{
          if(err instanceof UserError){
            errorPrint(err.getMessage);
            response.status(err.getStatus());
            response.redirect(err.getRedirectURL());
          }else{
            next(err); 
          }
        })
    },
    logOut: function(request, response, next){
        request.session.destroy((err) =>{
            if(err){
              errorPrint('Failed to destroy session');
              next(err);
            }else{
              successPrint('session destroy');
              response.clearCookie('csid');
              response.redirect('/login');
            }
          })
    },
}

module.exports = UserController;