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
<html>
<head>
<title>User Details</title>

<style>
body { font-family:'Segoe UI'; background:#f1f5f9; }

.container {
    margin-left:240px;
    padding:20px;
}

.tabs {
    display:flex;
    gap:10px;
    margin-bottom:20px;
}

.tab {
    padding:10px 20px;
    background:#e5e7eb;
    cursor:pointer;
    border-radius:5px;
}

.tab.active {
    background:green;
    color:white;
}

.content {
    background:white;
    padding:20px;
    border-radius:10px;
}

.hidden { display:none; }
</style>

<script>
function showTab(tabName){
    document.getElementById("personal").classList.add("hidden");
    document.getElementById("orders").classList.add("hidden");
    document.getElementById("payments").classList.add("hidden");

    document.getElementById(tabName).classList.remove("hidden");
}
</script>

</head>

<body>

<jsp:include page="navbar.jsp"/>
<jsp:include page="adminmenu.jsp"/>

<div class="container">

<h2>User Details</h2>

<div class="tabs">
    <div class="tab active" onclick="showTab('personal')">Personal Details</div>
    <div class="tab" onclick="showTab('orders')">Order Details</div>
    <div class="tab" onclick="showTab('payments')">Payment Details</div>
</div>

<div class="content">

<!-- PERSONAL -->
<div id="personal">
    <p><b>Name:</b> <%= rs.getString("name") %></p>
    <p><b>Date of Birth:</b> <%= rs.getString("dob") %></p>
    <p><b>Gender:</b> <%= rs.getString("gender") %></p>
    <p><b>Phone:</b> <%= rs.getString("phone") %></p>
    <p><b>Mareital Status:</b> <%= rs.getString("mstatus") %></p>
</div>

<!-- ORDERS -->
<div id="orders" class="hidden">
    <h3>Order Details</h3>
    <p>No orders yet (connect your orders table here)</p>
</div>

<!-- PAYMENTS -->
<div id="payments" class="hidden">
    <h3>Payment Details</h3>
    <p>No payments yet (connect your payment table here)</p>
</div>

</div>

</div>

</body>
</html>