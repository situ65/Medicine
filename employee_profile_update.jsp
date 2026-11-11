<%@ page import="java.sql.*" %>
<%@ include file="dbcon.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Update Employee Profile</title>

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

/* Card */
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

td:first-child {
    font-weight: bold;
    width: 30%;
}

/* Inputs */
input, select {
    width: 100%;
    padding: 10px;
    border-radius: 6px;
    border: 1px solid #ccc;
}

input:focus, select:focus {
    border-color: #2563eb;
    box-shadow: 0 0 5px rgba(37,99,235,0.3);
}

/* Button */
.btn {
    padding: 10px 20px;
    background: #2563eb;
    color: white;
    border: none;
    border-radius: 8px;
    cursor: pointer;
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
        <h2>
            Update Profile - 
            <span class="username">
                <%
                    String username = (String) session.getAttribute("name");
                    out.print(username != null ? username : "Employee");
                %>
            </span>
        </h2>
    </div>

    <!-- Form Card -->
    <div class="profile-card">

        <form action="employee_profile_update1.jsp" method="post">

<%
    String eid = (String) session.getAttribute("cid");

    PreparedStatement ps = con.prepareStatement("SELECT * FROM employee WHERE eid=?");
    ps.setString(1, eid);

    ResultSet rs = ps.executeQuery();

    if(rs.next()){
%>

<table>
    <tr><th colspan="2">Update Details</th></tr>

    <tr>
        <td>Name</td>
        <td><input type="text" name="name" value="<%= rs.getString("name") %>"></td>
    </tr>

    <tr>
        <td>Father Name</td>
        <td><input type="text" name="fname" value="<%= rs.getString("fname") %>"></td>
    </tr>

    <tr>
        <td>Date of Birth</td>
        <td>
            <input type="date" name="dob" value="<%= rs.getString("dob") %>">
        </td>
    </tr>

    <tr>
        <td>Gender</td>
        <td>
            <select name="gender">
                <option <%= rs.getString("gender").equals("Male")?"selected":"" %>>Male</option>
                <option <%= rs.getString("gender").equals("Female")?"selected":"" %>>Female</option>
            </select>
        </td>
    </tr>

    <tr>
        <td>Marital Status</td>
        <td>
            <select name="mstatus">
                <option <%= rs.getString("mstatus").equals("Single")?"selected":"" %>>Single</option>
                <option <%= rs.getString("mstatus").equals("Married")?"selected":"" %>>Married</option>
            </select>
        </td>
    </tr>

    <tr>
        <td>Phone</td>
        <td><input type="text" name="phone" value="<%= rs.getString("phone") %>"></td>
    </tr>

    <tr>
        <td>Email</td>
        <td><input type="email" name="mail" value="<%= rs.getString("mail") %>"></td>
    </tr>

    <tr>
        <td>Current Address</td>
        <td><input type="text" name="cadd" value="<%= rs.getString("cadd") %>"></td>
    </tr>

    <tr>
        <td>Permanent Address</td>
        <td><input type="text" name="padd" value="<%= rs.getString("padd") %>"></td>
    </tr>

    <tr>
        <td>Qualification</td>
        <td><input type="text" name="qual" value="<%= rs.getString("qual") %>"></td>
    </tr>

    <!-- IMPORTANT: pass eid -->
    <input type="hidden" name="eid" value="<%= eid %>">

    <tr>
        <td colspan="2" style="text-align:center;">
            <button class="btn">
                <i class="fas fa-save"></i> Update
            </button>
        </td>
    </tr>

</table>

<%
    } else {
%>
    <h3>No Data Found</h3>
<%
    }
%>

        </form>

    </div>

</div>

</div>

<!-- Footer -->
<jsp:include page="footer.jsp"/>

</body>
</html>