<!DOCTYPE html>

<html>
<head>
<title>Cart</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
body { margin:0; font-family:'Segoe UI'; background:#f1f5f9; }
.container { display:flex; }
.main { margin-left:240px; padding:20px; min-height:calc(100vh - 80px); }
.topbar {
    background:white; padding:15px; border-radius:10px;
    box-shadow:0 5px 15px rgba(0,0,0,0.1);
}
.username { color:#2563eb; font-weight:bold; }
</style>

</head>
<body>

<jsp:include page="navbar.jsp"/>
<jsp:include page="usermenu.jsp"/>

<div class="container">
    <div class="main">
        <div class="topbar">
            <h2>
                Welcome, 
                <span class="username">
                    <%= session.getAttribute("name") != null ? session.getAttribute("name") : "User" %>
                </span>
                to Cart Page
            </h2>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"/>

</body>
</html>
