<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MediCare Login</title>

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI',sans-serif;
}

/* Background */
body{
    min-height:100vh;
    background: linear-gradient(135deg,#e9e9f6);
    display:flex;
    flex-direction:column;
}

/* Center container */
.login-container{
    flex:1;
    display:flex;
    justify-content:center;
    align-items:center;
    padding:20px;
}

/* Glass Card */
.login-card{
    width:100%;
    max-width:500px;
    padding:35px;
    border-radius:18px;
    background: linear-gradient(135deg,#667eea,#764ba2);
    backdrop-filter:blur(15px);
    box-shadow:0 10px 40px rgba(0,0,0,0.3);
    color:white;
    animation:fadeIn 0.8s ease;
}

/* Animation */
@keyframes fadeIn{
    from{opacity:0; transform:translateY(30px);}
    to{opacity:1; transform:translateY(0);}
}

/* Title */
.login-card h2{
    text-align:center;
    margin-bottom:25px;
    font-size:28px;
    letter-spacing:1px;
}

/* Input Group */
.input-group{
    margin-bottom:18px;
}

.input-group label{
    font-size:14px;
    margin-bottom:5px;
    display:block;
}

.input-group input{
    width:100%;
    padding:12px;
    border-radius:10px;
    border:none;
    outline:none;
    font-size:14px;
    background:rgba(255,255,255,0.9);
    transition:0.3s;
}

.input-group input:focus{
    box-shadow:0 0 10px rgba(255,255,255,0.6);
}

/* Show password */
.show-pass{
    display:flex;
    align-items:center;
    gap:6px;
    font-size:13px;
    margin-bottom:15px;
}

/* Button */
.btn{
    width:100%;
    padding:12px;
    border:none;
    border-radius:10px;
    background:linear-gradient(45deg,#00c6ff,#0072ff);
    color:white;
    font-size:16px;
    font-weight:600;
    cursor:pointer;
    transition:0.3s;
}

.btn:hover{
    transform:translateY(-2px);
    box-shadow:0 8px 20px rgba(0,114,255,0.5);
}

/* Messages */
.success{
    color:#00ffae;
    text-align:center;
    margin-bottom:10px;
}

.error{
    color:#ff6b6b;
    text-align:center;
    margin-top:10px;
}

/* Links */
.links{
    text-align:center;
    margin-top:18px;
    font-size:14px;
}

.links a{
    color:#fff;
    font-weight:bolder;
    text-decoration:none;
}

.links a:hover{
    text-decoration:underline;
}
</style>

</head>

<body>

<!-- Navbar -->
<jsp:include page="navbar.jsp" />

<div class="login-container">

    <div class="login-card">

        <!-- Success -->
        <%
        try{
            String s = request.getParameter("a2");
            if("Success".equalsIgnoreCase(s)){
        %>
            <div class="success">Password Updated Successfully</div>
        <%
            }
        }catch(Exception e){}
        %>

        <h2>MediCare Login</h2>

        <form action="signin.jsp" method="post">

            <div class="input-group">
                <label>Username</label>
                <input type="text" name="t1" placeholder="Enter username" required>
            </div>

            <div class="input-group">
                <label>Password</label>
                <input type="password" name="p1" id="password" placeholder="Enter password" required>
            </div>

            <div class="show-pass">
                <input type="checkbox" id="showPassword">
                <label for="showPassword">Show Password</label>
            </div>

            <button type="submit" class="btn">Sign In</button>

            <!-- Error -->
            <%
            try{
                String err = request.getParameter("a1");
                if("error".equalsIgnoreCase(err)){
            %>
                <div class="error">Invalid Username or Password</div>
            <%
                }
            }catch(Exception e){}
            %>

        </form>

        <div class="links">
            <p>Don't have an account? 
                <a href="signup.jsp">Register</a>
            </p>
            <p>
                <a href="forgot_password.jsp">Forgot Password?</a>
            </p>
        </div>

    </div>

</div>

<!-- Footer -->
<jsp:include page="ofooter.jsp" />

<script>
document.getElementById("showPassword").addEventListener("change", function(){
    let pass = document.getElementById("password");
    pass.type = this.checked ? "text" : "password";
});
</script>

</body>
</html>