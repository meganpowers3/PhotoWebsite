function logoutClick(){
    var fetchOptions = {
        method: "POST", 
        body: '',
        headers: {
            'Content-Type': 'application/json'
        }
    }
    let fetchURL = 'http://localhost:3000/users/logout';
    fetch(fetchURL, fetchOptions)
    .then((data) =>{
        console.log(data);
        let logButton = document.getElementById('login-button');
        logButton.innerHTML = "Log In"; 
        logButton.setAttribute('href', '/login');
        logButton.onclick = null;
    }).catch((err) => location.reload()); 
}

if(document.cookie.includes('csid')) {
    console.log('user is logged in');
    let logButton = document.getElementById('login-button');
    logButton.innerHTML = "Log Out"; 
    logButton.removeAttribute('href');
    logButton.onclick = logoutClick;

    let profileButton = document.getElementById('profile-button');
    profileButton.innerHTML = "Profile"; 
    profileButton.setAttribute('href', '/profile');

    let uploadButton = document.getElementById('upload-button');
    uploadButton.innerHTML = "Upload"; 
    uploadButton.setAttribute('href', '/postimage');

}else{
    let logButton = document.getElementById('login-button');
    logButton.innerHTML = "Log In"; 
    logButton.setAttribute('href', '/login');

    let profileButton = document.getElementById('profile-button');
    profileButton.innerHTML = ""; 
    profileButton.removeAttribute('href', '/profile');

    let uploadButton = document.getElementById('upload-button');
    uploadButton.innerHTML = ""; 
    uploadButton.removeAttribute('href', '/postimage');
}
