<%@ page import="java.sql.*" %>
<%@ include file="dbcon.jsp"%>

<%
String search = request.getParameter("search");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>View Medicines</title>

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
    margin-top: 70px;
    padding: 20px;
    width: calc(100% - 240px);
}

/* Topbar */
.topbar {
    background: white;
    padding: 15px 20px;
    border-radius: 10px;
    box-shadow: 0 5px 15px rgba(0,0,0,0.1);
}

/* Cards Grid */
.cards {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 20px;
    margin-top: 20px;
}

/* Card */
.card {
    background: white;
    padding: 18px;
    border-radius: 12px;
    box-shadow: 0 8px 20px rgba(0,0,0,0.1);
    transition: 0.3s;
}

.card:hover {
    transform: translateY(-8px);
}

/* Title */
.card h3 {
    margin: 10px 0;
    color: #1e3a8a;
}

/* Text */
.card p {
    margin: 5px 0;
    font-size: 14px;
    color: #555;
}

/* Price */
.price {
    font-weight: bold;
    color: green;
}

/* Stock */
.stock {
    color: #2563eb;
}

/* Button */
.btn {
    display: inline-block;
    margin-top: 10px;
    padding: 8px 12px;
    background: #2563eb;
    color: white;
    border-radius: 6px;
    text-decoration: none;
    font-size: 14px;
    font-weight: bold;
}
.rupee {
    color: green;
    font-weight: bold;
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
        <h2>Available Medicines</h2>
    </div>

    <div style="margin-top:15px; background:white; padding:15px; border-radius:10px; box-shadow:0 5px 15px rgba(0,0,0,0.1);">

<form method="get" style="display:flex; gap:10px;">

    <input type="text" name="search" placeholder="Search medicine..."
           value="<%= request.getParameter("search") != null ? request.getParameter("search") : "" %>"
           style="flex:1; padding:10px; border-radius:20px; box-sizing: border-box; border:1px solid #ccc;">

    <button type="submit" class="btn" style="padding: 10px; ">Search</button>

</form>

</div>

    <!-- Cards -->
    <div class="cards">

<%
    try {
        PreparedStatement ps;

        if(search != null && !search.trim().equals("")){
            ps = con.prepareStatement(
                "SELECT * FROM medicines WHERE medicinename LIKE ? OR companyname LIKE ? OR category LIKE ? OR description LIKE ?"
            );

            String keyword = "%" + search + "%";

            ps.setString(1, keyword);
            ps.setString(2, keyword);
            ps.setString(3, keyword);
            ps.setString(4, keyword);

        } else {
            ps = con.prepareStatement("SELECT * FROM medicines");
        }

        ResultSet rs = ps.executeQuery();

        boolean hasData = false;

        while(rs.next()){
            hasData = true;
%>

        <div class="card">
            <h3><%= rs.getString("medicinename") %></h3>

            <p><b>Company:</b> <%= rs.getString("companyname") %></p>
            <p><b>Type:</b> <%= rs.getString("medType") %></p>
            <p><b>Category:</b> <%= rs.getString("category") %></p>
            <p><%= rs.getString("description") %></p>
            <p><b>Pack Size:</b> <%= rs.getInt("packSize") %></p>

            <p class="price">
                <span class="rupee">&#8377;</span> 
                <%= rs.getDouble("pricePerPack") %> / pack
            </p>

            <p class="stock">Stock: <%= rs.getInt("stock") %></p>
            <p><b>Expiry Date:</b> <%= rs.getString("expirydate") %></p>
        </div>

<%
        }

        if(!hasData){
%>
        <p style="color:red; font-weight:bold; margin-top:20px;">
            No medicines found!
        </p>
<%
        }

    } catch(Exception e){
        out.print(e);
    }
%>

    </div>

</div>

</div>

<!-- Footer -->
<jsp:include page="footer.jsp"/>

</body>
</html>