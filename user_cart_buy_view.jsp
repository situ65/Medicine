<%@ page import="java.sql.*" %>
<%@ include file="dbcon.jsp"%>

<%
String orderid = request.getParameter("orderid");
%>

<!DOCTYPE html>
<html>
<head>
<title>Order Summary</title>

<style>
.container{
    width:800px;
    margin:40px auto;
    background:white;
    padding:20px;
    border-radius:10px;
    box-shadow:0 5px 15px rgba(0,0,0,0.1);
}
table{
    width:100%;
    border-collapse:collapse;
}
th, td{
    padding:10px;
    border:1px solid #ddd;
}
th{
    background:#2563eb;
    color:white;
}
.btn{
    display:inline-block;
    padding:10px 15px;
    background:#2563eb;
    color:white;
    text-decoration:none;
    border-radius:6px;
}
</style>
</head>

<body>

<div class="container">

<h2>Order Summary</h2>

<%
PreparedStatement ps = con.prepareStatement(
    "SELECT * FROM orders WHERE orderid=?"
);
ps.setString(1, orderid);

ResultSet rs = ps.executeQuery();

if(rs.next()){
%>

<p><b>Order ID:</b> <%= orderid %></p>
<p><b>Date:</b> <%= rs.getString("orderdate") %></p>
<p><b>Status:</b> <%= rs.getString("status") %></p>
<p><b>Total:</b> Rs. <%= rs.getDouble("totalamount") %></p>

<table>
<tr>
    <th>Medicine</th>
    <th>Qty</th>
    <th>Price</th>
    <th>Subtotal</th>
</tr>

<%
PreparedStatement ps2 = con.prepareStatement(
    "SELECT oi.*, m.medicinename FROM orderitems oi JOIN medicines m ON oi.medicineid=m.medicineid WHERE oi.orderid=?"
);
ps2.setString(1, orderid);

ResultSet rs2 = ps2.executeQuery();

while(rs2.next()){
%>

<tr>
    <td><%= rs2.getString("medicinename") %></td>
    <td><%= rs2.getInt("quantity") %></td>
    <td>Rs <%= rs2.getDouble("unitprice") %></td>
    <td>Rs <%= rs2.getDouble("subtotal") %></td>
</tr>

<%
}
%>

</table>

<br>

<a href="user_order_payment.jsp?orderid=<%=orderid%>&amount=<%=rs.getDouble("totalamount")%>" class="btn">
    Make Payment
</a>

<%
}
%>

</div>

</body>
</html>