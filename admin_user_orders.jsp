<%@ page import="java.sql.*" %>
<%@ include file="dbcon.jsp"%>

<%
String selectedCid = request.getParameter("cid");
%>

<%
String deliverId = request.getParameter("deliverId");

if(deliverId != null){
    try{
        PreparedStatement psUpdate = con.prepareStatement(
            "UPDATE orders SET status='DELIVERED' WHERE orderid=?"
        );
        psUpdate.setInt(1, Integer.parseInt(deliverId));
        psUpdate.executeUpdate();

        out.println("<script>alert('Order marked as Delivered!'); window.location='admin_user_orders.jsp';</script>");
        return;

    }catch(Exception e){
        out.print(e);
    }
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Customer Orders</title>

<meta charset="UTF-8">

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

/* Topbar */
.topbar {
    background:white;
    padding:15px;
    border-radius:10px;
    box-shadow:0 5px 15px rgba(0,0,0,0.1);
    margin-bottom:20px;
}

/* Filter */
.filter-box {
    background:white;
    padding:15px;
    border-radius:10px;
    margin-bottom:20px;
}

/* Order Card */
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
}

.table-box{
     background: linear-gradient(135deg, #f0f9ff, #e0f2fe);
    padding:12px;
    border-radius:10px;
}

.status {
    padding:5px 10px;
    border-radius:5px;
    font-size:12px;
    color:white;
}

.confirmed { background:#22c55e; }
.pending { background:#f59e0b; }

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

.payment {
    margin-top:10px;
    padding:10px;
    background:#f9fafb;
    border-radius:8px;
}

select, button {
    padding:8px;
    border-radius:5px;
    border:1px solid #ccc;
}

button {
    background:#2563eb;
    color:white;
    cursor:pointer;
}
.paid { background:#22c55e; }        /* green */
.unpaid { background:#ef4444; }      /* red */

.payment-status {
    font-weight:bold;
    margin-top:10px;
}

.text-green { color:#22c55e; }
.text-red { color:#ef4444; }

button:hover {
    background:#16a34a;
}
</style>
</head>

<body>

<jsp:include page="navbar.jsp"/>
<jsp:include page="adminmenu.jsp"/>

<div class="container">
<div class="main">

<div class="topbar">
    <h2><i class="fas fa-shopping-bag" style="color: #2563eb;"></i> Customer Orders</h2>
</div>

<!-- 🔽 CUSTOMER SELECT -->
<div class="filter-box">
<form method="get">

<label><b>Select Customer:</b></label>

<select name="cid">
    <option value="">-- Select Customer --</option>

<%
try {
    Statement st = con.createStatement();
    ResultSet rsCust = st.executeQuery("SELECT a.cid, a.name FROM customer a, orders b where a.cid=b.cid and b.status='CONFIRMED'");

    while(rsCust.next()){
        String c = rsCust.getString("cid");
        String n = rsCust.getString("name");
%>

<option value="<%= c %>" <%= (c.equals(selectedCid) ? "selected" : "") %>>
    <%= n %>
</option>

<%
    }
} catch(Exception e){
    out.print(e);
}
%>

</select>

<button type="submit">Show</button>

</form>
</div>

<%
if(selectedCid != null && !selectedCid.equals("")){

    PreparedStatement ps = con.prepareStatement(
        "SELECT * FROM orders WHERE cid=? ORDER BY orderdate DESC"
    );
    ps.setString(1, selectedCid);

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

        <%
String paymentStatus = rs.getString("paymentstatus");
boolean isPaid = paymentStatus != null && paymentStatus.equalsIgnoreCase("PAID");
%>

<div class="status <%= isPaid ? "confirmed" : "unpaid" %>">
    <%= isPaid ? "CONFIRMED" : "PAYMENT PENDING" %>
</div>
    </div>

    <p><b>Delivery Address:</b> <%= rs.getString("deliveryaddress") %></p>

    <p><b>Total:</b> &#8377; <%= rs.getDouble("totalamount") %></p>

    <div class="table-box">
    <!-- ORDER ITEMS -->
    <table>
        <tr>
            <th>Sl. No.</th>
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
int i= 1;
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

    <!-- PAYMENT -->
<%
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
    <b>Amount:</b> &#8377; <%= rs3.getDouble("amount") %><br>
</div>

<%
}
%>
<div class="payment-status">
    Payment Status: 
    <span class="<%= isPaid ? "text-green" : "text-red" %>">
        <%= isPaid ? "PAID" : "PENDING" %>
    </span>
</div>

<%
String orderStatus = rs.getString("status");
boolean isDelivered = orderStatus.equalsIgnoreCase("DELIVERED");

if(isPaid && !isDelivered){
%>

<form method="get" style="margin-top:10px;">
    <input type="hidden" name="cid" value="<%= selectedCid %>">
    <input type="hidden" name="deliverId" value="<%= oid %>">
    <button type="submit" style="
        background:#22c55e;
        color:white;
        border:none;
        padding:8px 12px;
        border-radius:6px;
        cursor:pointer;
    ">
        Mark as Delivered
    </button>
</form>

<%
} else if(isDelivered){
%>
<p style="color:#22c55e; font-weight:bold; margin-top:10px;">
    Delivered
</p>
<%
}
%>

</div>

<%
    }

    if(!hasData){
%>
    <h3 style="text-align:center; color:gray;">No Orders Found</h3>
<%
    }
}
%>

</div>
</div>

<jsp:include page="footer.jsp"/>

</body>
</html>