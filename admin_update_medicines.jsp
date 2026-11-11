<%@ page import="java.sql.*" %>
<%@ include file="dbcon.jsp"%>

<%
    String id = request.getParameter("id");

    String name="", company="", medType="", category="", desc="", packSize="", pricePerPack="", stock="", exp="";

    try {
        PreparedStatement ps = con.prepareStatement("SELECT * FROM medicines WHERE medicineid=?");
        ps.setString(1, id);

        ResultSet rs = ps.executeQuery();

        if(rs.next()){
            name = rs.getString("medicinename");
            company = rs.getString("companyname");
            category = rs.getString("category");
            desc = rs.getString("description");
            medType = rs.getString("medType");
            packSize = rs.getString("packSize");
            pricePerPack = rs.getString("pricePerPack");
            stock = rs.getString("stock");
            exp = rs.getString("expirydate");
        }
    } catch(Exception e){
        out.print(e);
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Update Medicine</title>

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
input, select, textarea {
    width: 100%;
    padding: 10px;
    border-radius: 6px;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

input:focus, select:focus, textarea:focus {
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
<jsp:include page="adminmenu.jsp"/>

<div class="container">

<div class="main">

    <!-- Topbar -->
    <div class="topbar">
        <h2>
            Update Medicine - 
            <span class="username">
                <%= session.getAttribute("name") != null ? session.getAttribute("name") : "Admin" %>
            </span>
        </h2>
    </div>

    <!-- Form Card -->
    <div class="profile-card">

        <form action="admin_update_medicines1.jsp" method="post">

            <input type="hidden" name="id" value="<%= id %>">

            <table>
                <tr><th colspan="2">Update Medicine Details</th></tr>

                <tr>
                    <td>Medicine Name</td>
                    <td><input type="text" name="name" value="<%= name %>"></td>
                </tr>

                <tr>
                    <td>Company</td>
                    <td><input type="text" name="company" value="<%= company %>"></td>
                </tr>

                <tr>
    <td>Medicine Type</td>
    <td>
        <select name="medType">
            <option value="pill" <%= "pill".equals(medType) ? "selected" : "" %>>Pill</option>
<option value="syrup" <%= "syrup".equals(medType) ? "selected" : "" %>>Syrup</option>
<option value="injection" <%= "injection".equals(medType) ? "selected" : "" %>>Injection</option>
<option value="powder" <%= "powder".equals(medType) ? "selected" : "" %>>Powder</option>
        </select>
    </td>
</tr>

                <tr>
                    <td>Category</td>
                    <td><input type="text" name="category" value="<%= category %>"></td>
                </tr>

                <tr>
                    <td>Description</td>
                    <td><textarea name="desc"><%= desc %></textarea></td>
                </tr>

                <tr>
                    <td>No. of Medicines in One Pack</td>
                    <td><input type="number" step="1" name="packSize" value="<%= packSize %>"></td>
                </tr>

                <tr>
                    <td>Price/Pack &#8377;</td>
                    <td><input type="number" step="0.01" name="pricePerPack" value="<%= pricePerPack %>"></td>
                </tr>

                <tr>
                    <td>Stock</td>
                    <td><input type="number" name="stock" value="<%= stock %>"></td>
                </tr>

                <tr>
                    <td>Expiry Date</td>
                    <td><input type="date" name="exp" value="<%= exp %>"></td>
                </tr>

                <tr>
                    <td colspan="2" style="text-align:center;">
                        <button class="btn">
                            <i class="fas fa-save"></i> Update
                        </button>
                    </td>
                </tr>

            </table>

        </form>

    </div>

</div>

</div>

<!-- Footer -->
<jsp:include page="footer.jsp"/>

</body>
</html>