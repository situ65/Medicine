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
<jsp:include page="usermenu.jsp"/>

<div class="container">

<!-- Main Content -->
<div class="main">

    <!-- Topbar -->
    <div class="topbar">
        <h2>
            Customer Profile - 
            <span class="username">
                <%
                    String username = (String) session.getAttribute("name");
                    if (username != null) {
                        out.print(username);
                    } else {
                        out.print("Customer");
                    }
                %>
            </span>
        </h2>
    </div>

    <!-- Profile Section -->
    <div class="profile-card">

        <%

    // Get logged-in admin id from session
    String cid = (String) session.getAttribute("cid");

    PreparedStatement ps = con.prepareStatement(
        "SELECT * FROM customer WHERE cid=?"
    );

    ps.setString(1, cid);

    ResultSet rs = ps.executeQuery();

    if(rs.next()){
%>

<table>
    <tr><th colspan="2">Cutomer Details</th></tr>

    <tr><td>Name</td><td><%= rs.getString("name") %></td></tr>
    <tr><td>Date of Birth</td><td><%= rs.getString("dob") %></td></tr>
    <tr><td>Gender</td><td><%= rs.getString("gender") %></td></tr>
    <tr><td>Marital Status</td><td><%= rs.getString("mstatus") %></td></tr>
    <tr><td>Phone</td><td><%= rs.getString("phone") %></td></tr>
    <tr>
    <td colspan="2" style="text-align:center;">
        <a href="cost_profile_update.jsp" class="btn">
            <i class="fas fa-edit"></i> Update Profile
        </a>
    </td>
</tr>
</table>

<%
    } else {
%>
    <h3>No Profile Data Found</h3>
<%
    }
%>
    </div>

</div>

</div>

<!-- Footer -->
<jsp:include page="footer.jsp"/>

</body>
</html>