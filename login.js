function showSignup() {
    document.getElementById("loginForm").classList.add("hidden");
    document.getElementById("signupForm").classList.remove("hidden");
}

function showLogin() {
    document.getElementById("signupForm").classList.add("hidden");
    document.getElementById("loginForm").classList.remove("hidden");
}

document.getElementById("loginForm").addEventListener("submit", function(e){
    //e.preventDefault();
    //alert("Login Successful!");
    window.location.href = "signin.jsp";
});

document.getElementById("signupForm").addEventListener("submit", function(e){
//    e.preventDefault();
   // alert("Signup Successful! Please Login");
    window.location.href = "signup.jsp";
});