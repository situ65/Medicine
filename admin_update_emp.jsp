<%@ page import="java.sql.*" %>
<%@ include file="dbcon.jsp"%>

<%
    String id = request.getParameter("id");

    String name="", fname="", dob="", doj="", gender="", mstatus="",
           phone="", mail="", cadd="", padd="", qual="";

    try {
        PreparedStatement ps = con.prepareStatement(
            "SELECT * FROM employee WHERE eid=?"
        );
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

<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
body {
    margin: 0;
    font-family: 'Segoe UI', sans-serif;
    background: linear-gradient(135deg, #eef2ff, #f8fafc);
}

/* Layout */
.container {
    display: flex;
}

/* Main */
.main {
    margin-left: 240px;
    padding: 25px;
    width: 100%;
}

/* Topbar */
.topbar {
    background: white;
    padding: 18px 22px;
    border-radius: 14px;
    box-shadow: 0 8px 20px rgba(0,0,0,0.08);
    display: flex;
    align-items: center;
    gap: 10px;
    font-size: 18px;
    font-weight: 600;
}

/* Card */
.card {
    background: white;
    margin-top: 25px;
    padding: 30px;
    border-radius: 16px;
    box-shadow: 0 10px 25px rgba(0,0,0,0.08);
}

/* Table */
table {
    width: 100%;
    border-collapse: separate;
    border-spacing: 0 12px;
}

th {
    background: #1e3a8a;
    color: white;
    padding: 14px;
    border-radius: 10px;
    text-align: left;
}

td {
    padding: 8px;
    color: #374151;
    font-weight: 500;
}

td:first-child {
    width: 30%;
    font-weight: 600;
}

/* Inputs */
input, select, textarea {
    width: 95%;
    padding: 10px 12px;
    border: 1px solid #d1d5db;
    border-radius: 10px;
    outline: none;
    transition: 0.3s;
    font-size: 14px;
}

input:focus, select:focus, textarea:focus {
    border-color: #2563eb;
    box-shadow: 0 0 0 3px rgba(37,99,235,0.15);
}

textarea {
    resize: none;
    height: 70px;
}

/* Buttons */
.btn {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    margin-top: 18px;
    padding: 10px 16px;
    border-radius: 10px;
    font-weight: 600;
    cursor: pointer;
    border: none;
    transition: 0.3s;
}

.btn-update {
    background: #2563eb;
    color: white;
}

.btn-update:hover {
    background: #1e40af;
}

.btn-back {
    background: #6b7280;
    color: white;
    text-decoration: none;
}

.btn-back:hover {
    background: #4b5563;
}
</style>

</head>

<body>

<jsp:include page="navbar.jsp"/>
<jsp:include page="adminmenu.jsp"/>

<div class="container">

<div class="main">

    <div class="topbar">
        <i class="fas fa-user"></i> Update Employee Details
    </div>

    <div class="card">

    <form action="admin_update_emp1.jsp" method="post">

        <table>
            <tr>
                <th colspan="2"><i class="fas fa-id-card"></i> Full Information</th>
            </tr>

            <tr>
                <td>Name</td>
                <td><input type="text" name="name" value="<%= name %>"></td>
            </tr>

            <tr>
                <td>Father Name</td>
                <td><input type="text" name="fname" value="<%= fname %>"></td>
            </tr>

            <tr>
                <td>Date of Birth</td>
                <td><input type="date" name="dob" value="<%= dob %>"></td>
            </tr>

            <tr>
                <td>Date of Joining</td>
                <td><input type="date" name="doj" value="<%= doj %>"></td>
            </tr>

            <tr>
                <td>Gender</td>
                <td>
                    <select name="gender">
                        <option value="male" <%= "male".equals(gender) ? "selected" : "" %>>Male</option>
                        <option value="female" <%= "female".equals(gender) ? "selected" : "" %>>Female</option>
                        <option value="others" <%= "others".equals(gender) ? "selected" : "" %>>Others</option>
                    </select>
                </td>
            </tr>

            <tr>
                <td>Marital Status</td>
                <td>
                    <select name="mstatus">
                        <option value="single" <%= "single".equals(mstatus) ? "selected" : "" %>>Single</option>
                        <option value="married" <%= "married".equals(mstatus) ? "selected" : "" %>>Married</option>
                    </select>
                </td>
            </tr>

            <tr>
                <td>Phone</td>
                <td><input type="tel" name="phone" value="<%= phone %>"></td>
            </tr>

            <tr>
                <td>Email</td>
                <td><input type="email" name="mail" value="<%= mail %>"></td>
            </tr>

            <tr>
                <td>Current Address</td>
                <td><textarea name="cadd"><%= cadd %></textarea></td>
            </tr>

            <tr>
                <td>Permanent Address</td>
                <td><textarea name="padd"><%= padd %></textarea></td>
            </tr>

            <tr>
                <td>Qualification</td>
                <td><input type="text" name="qual" value="<%= qual %>"></td>
            </tr>

        </table>

        <!-- FIXED hidden field -->
        <input type="hidden" name="eid" value="<%= id %>">

        <button type="submit" class="btn btn-update">
            <i class="fas fa-save"></i> Update
        </button>

        <a href="view_employee.jsp" style="background: #6b7280;
    color: white;
    text-decoration: none;" class="btn btn-back">
            <i class="fas fa-arrow-left"></i> Back
        </a>

    </form>

    </div>

</div>

</div>

<jsp:include page="footer.jsp"/>

</body>
</html>