<%@ page import="java.sql.*" %>
<%@ include file="dbcon.jsp"%>


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
</div>



<%
String cid = request.getParameter("cid");
int oid = Integer.parseInt(request.getParameter("oid"));
String eid= request.getParameter("emp");
java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
String today = sdf.format(new java.util.Date());
%>

<%

if(oid  != 0){
    try{
        PreparedStatement psUpdate = con.prepareStatement(
            "UPDATE orders SET status='DELIVERED' WHERE orderid=?"
        );
        psUpdate.setInt(1, oid);
        psUpdate.executeUpdate();

        Statement st = con.createStatement();
        String qrys="insert into deliverydet(orderid, cid,eid,status,dlvdate) values("+oid+", '"+cid+"', '"+eid+"', 'ASSIGNED', '"+today+"')";
        st.executeUpdate(qrys);
       // out.print(qrys);    
        out.println("<h3>EMPLOYEE is ASSIGNED</h3>");
    }catch(Exception e){
        out.print(e);
    }
}
%>



</div>
</div>

<jsp:include page="footer.jsp"/>

</body>
</html>