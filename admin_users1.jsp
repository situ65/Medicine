<%@ page import="java.sql.*" %>
<%@ include file="dbcon.jsp"%>

<%
String cid = request.getParameter("cid");

ResultSet rs = null;

try {
    PreparedStatement ps = con.prepareStatement("SELECT * FROM customer WHERE cid=?");
    ps.setString(1, cid);
    rs = ps.executeQuery();
    rs.next();
} catch(Exception e){
    out.print(e);
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Users</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
body { margin:0; font-family:'Segoe UI'; background:#f1f5f9; }

.container { display:flex; }

.main {
    margin-left:240px;
    padding:20px;
    width: 1000px;
}

.topbar {
    background:white;
    padding:15px;
    border-radius:10px;
    box-shadow:0 5px 15px rgba(0,0,0,0.1);
    margin-bottom:20px;
}

table {
    width:100%;
    border-collapse:collapse;
    background:white;
    border-radius:10px;
    overflow:hidden;
}

th, td {
    padding:12px;
    text-align:left;
}

th {
    background:#2563eb;
    color:white;
}

tr:nth-child(even) {
    background:#f9fafb;
}

.view-btn {
    padding:6px 12px;
    background:#10b981;
    color:white;
    border:none;
    border-radius:5px;
    cursor:pointer;
}
</style>
</head>

<body>

<jsp:include page="navbar.jsp"/>
<jsp:include page="adminmenu.jsp"/>

<div class="container">
<div class="main">

<div class="topbar">
<h2><i class="fas fa-user-circle"></i>  Users Detail</h2>
</div>
 
<table>
    <tr><td><b>Name</b></td><td><%= rs.getString("name") %></td></tr>
    <tr><td><b>Phone</b></td><td><%= rs.getString("phone") %></td></tr>
    <tr><td><b>DOB</b></td><td><%= rs.getString("dob") %></td></tr>
    <tr><td><b>Gender</b></td><td><%= rs.getString("gender") %></td></tr>
    <tr><td><b>Status</b></td><td><%= rs.getString("mstatus") %></td></tr>
</table> 

</div>
</div>

<jsp:include page="footer.jsp"/>
</body>
</html>