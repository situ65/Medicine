<%@ page import="java.sql.*" %>
<%@ include file="dbcon.jsp"%>

<!DOCTYPE html>
<html>
<head>
<title>Employees</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
body { font-family:'Segoe UI'; background:#f1f5f9; }

.container { display:flex; }

.main {
    margin-left:240px;
    padding:20px;
    width:100%;
}

.card {
    background:white;
    padding:20px;
    border-radius:10px;
    box-shadow:0 5px 15px rgba(0,0,0,0.1);
}

table {
    width:100%;
    border-collapse:collapse;
}

th {
    background:#1E3A8A;
    color:white;
    padding:12px;
}

td {
    padding:10px;
    border-bottom:1px solid #ddd;
}
.add-btn {
    padding:12px;
    border-radius:5px;
    color:white;
    text-decoration:none;
    font-size:17px;
    background:#0d825b;
    font-weight: bold;
}

.btn {
    padding:6px 10px;
    border-radius:5px;
    color:white;
    text-decoration:none;
    font-size:12px;
}

.view { background:#10b981; }
.update { background:#2563eb; }
.delete { background:#ef4444; }

.actions { display:flex; gap:5px; }
</style>

</head>

<body>

<jsp:include page="navbar.jsp"/>
<jsp:include page="employeemenus.jsp"/>

<div class="container">
<div class="main">

<div class="card">

<div class="topbar" style="display:flex; justify-content:space-between; align-items:center;">
    <h2><i class="fas fa-users"></i> Employee List</h2>
</div> 
<table>

<tr>
    <th>Name</th>
    <th>Phone</th>
    <th>Email</th>
    <th>Qualification</th>
    <th>Actions</th>
</tr>

<%
PreparedStatement ps = con.prepareStatement(
    "SELECT e.* FROM employee e " +
    "JOIN login l ON e.eid = l.cid " +
    "WHERE l.status = 'Y'"
);
ResultSet rs = ps.executeQuery();

while(rs.next()){
%>

<tr>
<td><%= rs.getString("name") %></td>
<td><%= rs.getString("phone") %></td>
<td><%= rs.getString("mail") %></td>
<td><%= rs.getString("qual") %></td>

<td class="actions">

<a href="emp_view_single_employee.jsp?eid=<%= rs.getString("eid") %>" style="background:#10b981;" class="btn view">
<i class="fas fa-eye"></i> View
</a>
</td>

</tr>

<%
}
%>

</table>

</div>
</div>
</div>
<jsp:include page="footer.jsp"/>

</body>
</html>