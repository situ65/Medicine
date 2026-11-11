<%@ page import="java.sql.*" %>
<%@ include file="dbcon.jsp"%>

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
<jsp:include page="employeemenus.jsp"/>

<div class="container">
<div class="main">

<div class="topbar">
<h2><i class="fas fa-user-circle"></i>  Users List</h2>
</div>

<table>
<tr>
    <th>Name</th>
    <th>Phone</th>
    <th>Gender</th>
    <th>Action</th>
</tr>

<%
try {
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM customer");

    while(rs.next()){
%>
<tr>
    <td><%= rs.getString("name") %></td>
    <td><%= rs.getString("phone") %></td>
    <td><%= rs.getString("gender") %></td>
    <td>
        <form action="emp_view_user.jsp" method="get">
            <input type="hidden" name="cid" value="<%= rs.getString("cid") %>">
            <button class="view-btn">View</button>
        </form>
    </td>
</tr>
<%
    }
} catch(Exception e){
    out.print(e);
}
%>

</table>

</div>
</div>

<jsp:include page="footer.jsp"/>
</body>
</html>