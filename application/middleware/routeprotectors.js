const routeProtectors = {};

routeProtectors.userIsLoggedIn = function(req, resp, next){
    if(req.session.username){
        next();
    }else{
        resp.direct('/login');
    }
}

module.exports = routeProtectors;