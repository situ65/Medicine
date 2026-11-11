<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>My Cart</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
body {
    margin: 0;
    font-family: 'Segoe UI';
    background: #f1f5f9;
}

.container { display:flex; }

.main {
    margin-left:240px;
    padding:20px;
    width:1000px;
}

/* Card */
.card {
    background:white;
    padding:20px;
    border-radius:12px;
    box-shadow:0 8px 20px rgba(0,0,0,0.1);
}

/* Table */
table {
    width:100%;
    border-collapse:collapse;
    margin-top:15px;
}

th, td {
    padding:10px;
    border-bottom:1px solid #eee;
    border:1px solid #ddd;  
    text-align:center;
}

th {
    background:#2563eb;
    color:white;
}

/* Button */
.btn {
    padding:6px 10px;
    border:none;
    border-radius:6px;
    cursor:pointer;
    color:white;
}

.remove { background:#ef4444; }
.checkout { background:#16a34a; margin-top:15px; }

.empty {
    text-align:center;
    font-size:18px;
    color:gray;
}
</style>
</head>

<body>

<jsp:include page="navbar.jsp"/>
<jsp:include page="usermenu.jsp"/>

<div class="container">
<div class="main">

<div class="card">

<h2><i class="fas fa-shopping-cart" style="color:#2563eb;"></i> My Cart</h2>

<%
ArrayList cart = (ArrayList) session.getAttribute("purch");

if(cart != null && cart.size() > 0){
%>

<table>
<tr>
    <th>Sl No</th>
    <th>Medicine Name</th>
    <th>Price</th>
    <th>Action</th>
</tr>

<%
double total = 0.0;

for(int i=0; i<cart.size(); i++){
    HashMap item = (HashMap) cart.get(i);

    String name = (String) item.get("name");
    String price = (String) item.get("price");

    total += Double.parseDouble(price);
%>

<tr>
    <td><%= i+1 %></td>
    <td><%= name %></td>
    <td>&#8377; <%= price %></td>
    <td>
        <a href="remove_cart.jsp?index=<%= i %>"style="background-color: #ea0f0f;" class="btn remove">
            <i class="fas fa-trash" ></i>
        </a>
    </td>
</tr>

<%
}
%>

<tr>
    <td colspan="2"><b>Total</b></td>
    <td colspan="2"><b>&#8377; <%= total %></b></td>
</tr>

</table>

<form action="user_buy_cart.jsp" method="get" onsubmit="return checkUser()">
    <label for="">Enter Delivery Address</label>
    <textarea name="delivery" id="delivery"></textarea>
    <button class="btn checkout" style="margin-top:30px;">
        <i class="fas fa-check"></i> Checkout
    </button>
</form>
 <script>
      function checkUser() {
        let delivery = document.getElementById("delivery").value.trim();
        if(delivery.length < 15){
            alert("Please Fill Up Delivery Address.");
            return false;
        }
        return true;
      }
</script>    
<%
} else {
%>

<p class="empty">  Your cart is empty</p>

<%
}
%>

</div>

</div>
</div>

<jsp:include page="footer.jsp"/>

</body>
</html>