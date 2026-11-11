<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Dashboard</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
body {
    margin: 0;
    font-family: 'Segoe UI', sans-serif;
    background: linear-gradient(135deg, #e0e7ff, #f1f5f9);
}

/* Layout */
.container {
    display: flex;
}

/* Main */
.main {
    margin-left: 240px;
    width: 100%;
    padding: 30px;
}

/* Topbar */
.topbar {
    background: white;
    padding: 25px;
    border-radius: 15px;
    box-shadow: 0 10px 25px rgba(0,0,0,0.1);
    text-align: center;
}

/* Username */
.username {
    color: #2563eb;
    font-weight: bold;
}

/* Message */
.logout-msg {
    margin-top: 15px;
    font-size: 16px;
    color: #555;
}

/* Buttons */
.btn-group {
    margin-top: 20px;
}

.btn {
    display: inline-block;
    padding: 10px 20px;
    margin: 5px;
    border-radius: 8px;
    text-decoration: none;
    font-size: 14px;
    transition: 0.3s;
}

/* Yes Button */
.btn-yes {
    background: #ef4444;
    color: white;
}

.btn-yes:hover {
    background: #dc2626;
}

/* No Button */
.btn-no {
    background: #22c55e;
    color: white;
}

.btn-no:hover {
    background: #16a34a;
}

/* Icon */
.icon {
    font-size: 40px;
    color: #2563eb;
    margin-bottom: 10px;
}
</style>

</head>

<body>

<!-- Navbar & Sidebar -->
<jsp:include page="navbar.jsp"/>
<jsp:include page="adminmenu.jsp"/>

<div class="container">

<div class="main">

    <!-- Topbar -->
    <div class="topbar">

        <div class="icon">
            <i class="fas fa-user-shield"></i>
        </div>

        <h2>
            Hii, 
            <span class="username">
                <%
                    String username = (String) session.getAttribute("name");
                    if (username != null) {
                        out.print(username);
                    } else {
                        out.print("Admin");
                    }
                %> 
            </span>
        </h2>

        <div class="logout-msg">
            Are you sure you want to logout?
        </div>

        <div class="btn-group">
            <a href="index.jsp" class="btn btn-yes">
                <i class="fas fa-sign-out-alt"></i> Yes, Logout
            </a>

            <a href="adminhome.jsp" class="btn btn-no">
                <i class="fas fa-arrow-left"></i> Stay Here
            </a>
        </div>

    </div>

</div>

</div>

<!-- Footer -->
<jsp:include page="footer.jsp"/>

</body>
</html>