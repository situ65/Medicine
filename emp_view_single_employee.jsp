<%@ page import="java.sql.*" %>
<%@ include file="dbcon.jsp"%>

<%
    String id = request.getParameter("eid");

    String name="", fname="", dob="", doj="", gender="", mstatus="", phone="", mail="", cadd="", padd="", qual="";

    try {
        PreparedStatement ps = con.prepareStatement("SELECT * FROM employee WHERE eid=?");
        ps.setString(1, id);

        ResultSet rs = ps.executeQuery();

        if(rs.next()){
            name = rs.getString("name");
            fname = rs.getString("fname");
            dob = rs.getString("dob");
            doj = rs.getString("doj");
            gender = rs.getString("gender");
            mstatus = rs.getString("mstatus");
            phone = rs.getString("phone");
            mail = rs.getString("mail");
            cadd = rs.getString("cadd");
            padd = rs.getString("padd");
            qual = rs.getString("qual");
        }
    } catch(Exception e){
        out.print(e);
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Employee Details</title>

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
    padding: 15px;
    border-radius: 10px;
    box-shadow: 0 5px 15px rgba(0,0,0,0.1);
}

/* Card */
.card {
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
    background: #1e3a8a;
    color: white;
    padding: 12px;
    text-align: left;
}

td {
    padding: 10px;
    border-bottom: 1px solid #ddd;
}

td:first-child {
    font-weight: bold;
    width: 30%;
}

/* Buttons */
.btn {
    display: inline-block;
    margin-top: 15px;
    padding: 10px 18px;
    background: #2563eb;
    color: white;
    border-radius: 8px;
    text-decoration: none;
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
<jsp:include page="employeemenus.jsp"/>

<div class="container">

<div class="main">

    <!-- Topbar -->
    <div class="topbar">
        <h2><i class="fas fa-user"></i> Employee Details</h2>
    </div>

    <!-- Card -->
    <div class="card">

        <table>
            <tr><th colspan="2">Full Information</th></tr>

            <tr><td>Name</td><td><%= name %></td></tr>
            <tr><td>Father Name</td><td><%= fname %></td></tr>
            <tr><td>Date of Birth</td><td><%= dob %></td></tr>
            <tr><td>Date of Joining</td><td><%= doj %></td></tr>
            <tr><td>Gender</td><td><%= gender %></td></tr>
            <tr><td>Marital Status</td><td><%= mstatus %></td></tr>
            <tr><td>Phone</td><td><%= phone %></td></tr>
            <tr><td>Email</td><td><%= mail %></td></tr>
            <tr><td>Current Address</td><td><%= cadd %></td></tr>
            <tr><td>Permanent Address</td><td><%= padd %></td></tr>
            <tr><td>Qualification</td><td><%= qual %></td></tr>
        </table>

        <!-- Buttons -->
        <a href="admin_update_emp.jsp?id=<%= id %>" class="btn">
            <i class="fas fa-edit"></i> Update
        </a>

        <a href="view_employee.jsp" class="btn" style="background:#6b7280;">
            <i class="fas fa-arrow-left"></i> Back
        </a>

    </div>

</div>

</div>

<!-- Footer -->
<jsp:include page="footer.jsp"/>

</body>
</html>