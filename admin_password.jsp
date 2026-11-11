<%@ page import="java.sql.*" %>
<%@ include file="dbcon.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Profile</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
body {
    margin: 0;
    font-family: 'Segoe UI', sans-serif;
    background: #f1f5f9;
}

/* Layout */
.container {
    display: flex;
}

/* Main */
.main {
    margin-left: 240px;
    padding: 20px;
    width: 100%;
}

/* Topbar */
.topbar {
    background: white;
    padding: 15px 20px;
    border-radius: 10px;
    box-shadow: 0 5px 15px rgba(0,0,0,0.1);
}

.username {
    color: #2563eb;
    font-weight: bold;
}

/* Profile Card */
.profile-card {
    background: white;
    margin-top: 20px;
    padding: 25px;
    border-radius: 12px;
    box-shadow: 0 8px 20px rgba(0,0,0,0.1);
}

/* Table */
table {
    width: 100%;
    border-collapse: collapse;
}

th {
    background: #1E3A8A;
    color: white;
    padding: 12px;
    text-align: left;
}

td {
    padding: 10px;
    border-bottom: 1px solid #ddd;
}

/* Button */
.btn {
    display: inline-block;
    padding: 10px 18px;
    background: #2563eb;
    color: white;
    text-decoration: none;
    border-radius: 8px;
    margin-top: 15px;
    transition: 0.3s;
}

.btn:hover {
    background: #1e40af;
}

</style>

</head>

<body>

<!-- Navbar & Sidebar -->
<jsp:include page="navbar.jsp"/>
<jsp:include page="adminmenu.jsp"/>

<div class="container">

<!-- Main Content -->
<div class="main">

    <!-- Topbar -->
    <div class="topbar">
        <h2>
            Admin Profile - 
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
    </div>

    <!-- Profile Section -->
    <div class="profile-card">

<%
try{
    // Get logged-in admin id from session
    String eid = (String) session.getAttribute("cid");
    String pwd= request.getParameter("pwd");
    PreparedStatement ps = con.prepareStatement("update login set pwd=? where cid=?" );
    ps.setString(1, pwd);
    ps.setString(2, eid);
    int z = ps.executeUpdate();
    if(z>0){      
%>
<script>
    alert("Password Updated Successfully");
</script>        
<%
    }
}catch(Exception e){  }
%>

<form onsubmit="return validateMedicineForm()"  method="post">
<table>
    <tr><th colspan="2">Admin Details</th></tr>
    <tr><td>Password</td><td><input type="password" id="pwd" name="pwd"></td></tr>
    <tr><td>Confirm Password</td><td><input type="password" id="pwd1" name="pwd1"></td></tr>
    <tr><td colspan="2" style="text-align:center;">
        <button class="btn"> <i class="fas fa-plus"></i> Update Password </button>
    </td></tr>
</table>
</form> 
    
</div>

</div>

</div>


<script>
function validateMedicineForm(){

    let pwd = document.getElementsByName("pwd")[0].value.trim();
    let pwd1 = document.getElementsByName("pwd1")[0].value.trim();

    // MEDICINE NAME
    if(pwd.length < 6){
        alert("Password is less than 6 character");
        return false;
    }
    if(pwd1.length < 6){
        alert("Confirm Password characters");
        return false;
    }

    // COMPANY (optional but validate if filled)
    if( pwd !== pwd1){
        alert("Password & Confirm Password Does Not Match");
        return false;
    }

    return true;
}
</script>


<!-- Footer -->
<jsp:include page="footer.jsp"/>

</body>
</html>