<%@ page import="java.sql.*" %>
<%@ include file="dbcon.jsp"%>
<!DOCTYPE html>

<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Dashboard</title>

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
    width: 1000px;
    padding: 20px;
    min-height: calc(100vh - 80px); /* prevents overlap */
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

/* Cards */
.cards {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 20px;
    margin-top: 20px;
}

.card {
    background: white;
    padding: 20px;
    border-radius: 12px;
    text-align: center;
    box-shadow: 0 8px 20px rgba(0,0,0,0.1);
    transition: 0.3s;
}

.card i {
    font-size: 30px;
    color: #2563eb;
    margin-bottom: 10px;
}

.card:hover {
    transform: translateY(-8px);
}
</style>

</head>
<body>

<!-- Navbar -->

<jsp:include page="navbar.jsp"/>
<jsp:include page="adminmenu.jsp"/>

<div class="container">


<!-- Main Content -->
<div class="main">
<%
int totalOrders = 0;
int pendingOrders = 0;
double revenue = 0.0;
try {
    Statement st = con.createStatement();
    // Total Orders
    ResultSet rs1 = st.executeQuery("SELECT COUNT(*) FROM orders");
    if(rs1.next()){
        totalOrders = rs1.getInt(1);
    }

    // Pending Orders
    ResultSet rs2 = st.executeQuery("SELECT COUNT(*) FROM orders WHERE status!='DELIVERED'");
    if(rs2.next()){
        pendingOrders = rs2.getInt(1);
    }

    // Revenue
    ResultSet rs3 = st.executeQuery("SELECT SUM(totalamount) FROM orders");
    if(rs3.next()){
    revenue = rs3.getDouble(1);
    if(rs3.wasNull()){
        revenue = 0.0;
    }
}

} catch(Exception e){
    out.print(e);
}
%>

    <!-- Topbar -->
    <div class="topbar">
        <h2>
            Welcome, 
            <span class="username">
                <%
                    String username = (String) session.getAttribute("name");
                    if (username != null) {
                        out.print(username);
                    } else {
                        out.print("Admin");
                    }
                %> 
            </span> <span>to admin dashboard</span>
        </h2>

    </div>

    <!-- Cards -->
    <div class="cards">

        <div class="card">
            <i class="fas fa-shopping-cart"></i>
            <h3>Orders</h3>
            <p><%= totalOrders %></p>
        </div>

        <div class="card">
            <i class="fas fa-pills"></i>
            <h3>Pending Orders</h3>
            <p><%= pendingOrders %></p>
        </div>

        <div class="card">
            <i class="fas fa-user-plus"></i>
            <h3>Total Collection</h3>
            <p><%= revenue %></p>
        </div>
    </div>
    
    <h1><%  if(pendingOrders>0){        %>
        Pending Order Delivery,  Assign Employee <a href="admin_user_orders1.jsp"> To Deliver Order</a>
    <%      }     %></h1>
 </div>
</div>

<!-- Footer -->

<jsp:include page="footer.jsp"/>

</body>
</html>
