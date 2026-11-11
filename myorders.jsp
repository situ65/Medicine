<%@ page import="java.sql.*" %>
<%@ include file="dbcon.jsp"%>

<%
String cid = (String) session.getAttribute("cid");
%>

<!DOCTYPE html>
<html>
<head>
<title>My Orders</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
body {
    margin:0;
    font-family:'Segoe UI';
    background:#f1f5f9;
}

.container { display:flex; }

.main {
    margin-left:240px;
    padding:20px;
    width:1000px;
}

.topbar {
    background:white;
    padding:15px;
    border-radius:10px;
    box-shadow:0 5px 15px rgba(0,0,0,0.1);
    margin-bottom:20px;
}

.order-card {
    background:white;
    padding:20px;
    border-radius:12px;
    margin-bottom:20px;
    box-shadow:0 8px 20px rgba(0,0,0,0.1);
}

.order-head {
    display:flex;
    justify-content:space-between;
    margin-bottom:10px;
}

.status {
    padding:5px 10px;
    border-radius:5px;
    font-size:12px;
    color:white;
}

.confirmed { background:#22c55e; }
.pending { background:#ef4444; }

table {
    width:100%;
    border-collapse:collapse;
    margin-top:10px;
}

th, td {
    padding:8px;
    border-bottom:1px solid #eee;
}

th {
    background:#2563eb;
    color:white;
}

.table-box{
    background: linear-gradient(135deg, #f0f9ff, #e0f2fe);
    padding:12px;
    border-radius:10px;
}

.payment {
    margin-top:10px;
    padding:10px;
    background:#f9fafb;
    border-radius:8px;
}

.payment-status {
    margin-top:10px;
    font-weight:bold;
}

.text-green { color:#22c55e; }
.text-red { color:#ef4444; }

.pay-btn {
    margin-top:10px;
    padding:8px 12px;
    background:#2563eb;
    color:white;
    border:none;
    border-radius:6px;
    cursor:pointer;
}

.pay-btn:hover {
    background:#1e40af;
}
</style>
</head>

<body>

<jsp:include page="navbar.jsp"/>
<jsp:include page="usermenu.jsp"/>

<div class="container">
<div class="main">

<div class="topbar">
    <h2><i class="fas fa-shopping-bag" style="color: #2563eb;"></i> My Orders</h2>
</div>

<%
try {

    PreparedStatement ps = con.prepareStatement(
        "SELECT * FROM orders WHERE cid=? ORDER BY orderdate DESC"
    );
    ps.setString(1, cid);

    ResultSet rs = ps.executeQuery();

    boolean hasData = false;

    while(rs.next()){
        hasData = true;
        int oid = rs.getInt("orderid");
%>

<!-- ORDER CARD -->
<div class="order-card">

    <div class="order-head">
        <div>
            <b>Date:</b> <%= rs.getString("orderdate") %>
        </div>

        <div class="status <%= rs.getString("status").equals("CONFIRMED") ? "confirmed" : "pending" %>">
            <%= rs.getString("status") %>
        </div>
    </div>

    <p><b>Delivery Address:</b> <%= rs.getString("deliveryaddress") %></p>

    <p><b>Total:</b> &#8377; <%= rs.getDouble("totalamount") %></p>

    <!-- ORDER ITEMS -->
    <div class="table-box">
    <table>
        <tr>
            <th>Sl. No. </th>
            <th>Medicine</th>
            <th>Qty</th>
            <th>Price</th>
            <th>Subtotal</th>
        </tr>

<%
    PreparedStatement ps2 = con.prepareStatement(
        "SELECT oi.*, m.medicinename FROM orderitems oi " +
        "JOIN medicines m ON oi.medicineid = m.medicineid " +
        "WHERE oi.orderid=?"
    );
    ps2.setInt(1, oid);

    ResultSet rs2 = ps2.executeQuery();
    int i=1;
    while(rs2.next()){
%>
        <tr>
            <td><%= i++ %></td>
            <td><%= rs2.getString("medicinename") %></td>
            <td><%= rs2.getInt("quantity") %></td>
            <td>&#8377; <%= rs2.getDouble("unitprice") %></td>
            <td>&#8377; <%= rs2.getDouble("subtotal") %></td>
        </tr>
<%
    }
%>
    </table>
    </div>

<%
    // PAYMENT DETAILS
    PreparedStatement ps3 = con.prepareStatement(
        "SELECT * FROM payment WHERE saleid=?"
    );
    ps3.setString(1, String.valueOf(oid));

    ResultSet rs3 = ps3.executeQuery();

    if(rs3.next()){
%>
    <div class="payment">
        <b>Mode:</b> <%= rs3.getString("ptype") %><br>
        <b>Date:</b> <%= rs3.getString("pdate") %><br>
        <b>Amount:</b> &#8377; <%= rs3.getDouble("amount") %>
    </div>
<%
    }

    // PAYMENT STATUS
    String payStatus = rs.getString("paymentstatus");
    boolean isPaid = payStatus != null && payStatus.equalsIgnoreCase("PAID");
%>

    <div class="payment-status">
        Payment Status:
        <span class="<%= isPaid ? "text-green" : "text-red" %>">
            <%= isPaid ? "PAID" : "PENDING" %>
        </span>
    </div>

<%
    if(!isPaid){
%>

    <form action="user_order_payment.jsp" method="get">
        <input type="hidden" name="orderid" value="<%= oid %>">
        <input type="hidden" name="amount" value="<%= rs.getDouble("totalamount") %>">

        <button type="submit" class="pay-btn">
            Make Payment
        </button>
    </form>

<%
    }
%>

</div> <!-- END ORDER CARD -->

<%
    } // END while

    if(!hasData){
%>
    <h3 style="text-align:center; color:gray;">No Orders Found</h3>
<%
    }

} catch(Exception e){
    out.print(e);
}
%>

</div>
</div>

<jsp:include page="footer.jsp"/>

</body>
</html>