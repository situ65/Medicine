<%@ page import="java.sql.*" %>
<%@ include file="dbcon.jsp"%>

<%
String mid = request.getParameter("mid");
String price = request.getParameter("price");
String packSize = request.getParameter("packSize");
String uid = (String) session.getAttribute("cid");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Place Order</title>

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
    min-height: calc(100vh - 80px);
    width: 1000px;
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

/* Form Card */
.form-card {
    margin-top: 20px;
    background: white;
    padding: 25px;
    border-radius: 12px;
    box-shadow: 0 8px 20px rgba(0,0,0,0.1);
    width: 900px;
}

/* Form Elements */
input, textarea {
    width: 100%;
    padding: 10px;
    margin: 10px 0;
    border-radius: 6px;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

button {
    width: 100%;
    padding: 10px;
    background: #2563eb;
    color: white;
    border: none;
    border-radius: 20px;
    cursor: pointer;
}

button:hover {
    background: #1e40af;
}
</style>

<script>
function calculate(){
    let qty = document.getElementById("qty").value;
    let price = document.getElementById("price").value;

    if(qty === "" || qty <= 0){
        document.getElementById("total").value = "";
        return;
    }

    let total = qty * price;
    document.getElementById("total").value = total.toFixed(2);
}
</script>

</head>

<body>

<!-- Navbar & Sidebar -->
<jsp:include page="navbar.jsp"/>
<jsp:include page="usermenu.jsp"/>

<div class="container">

<div class="main">

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
                        out.print("Customer");
                    }
                %>
            </span> 
            <span> - Place Order</span>
        </h2>
    </div>

    <!-- Order Form -->
    <div class="form-card">

        <h3><i style="color:#1e40af;" class="fas fa-cart-plus"></i> Order Details</h3>

        <form action="user_order_action.jsp" method="post" onsubmit="return validateOrderForm()">

            <input type="hidden" name="mid" value="<%= mid %>">
            <input type="hidden" name="price" id="price" value="<%= price %>">

            <label>Quantity <span style="color: #1e40af;">(No of Medicines/pack : <%= packSize %>)</span></label>
            <input type="number" name="qty" id="qty" min="1" onkeyup="calculate()" required>

            <label>Total Amount</label>
            <input type="text" name="total" id="total" readonly>

            <label>Delivery Address</label>
            <textarea name="address" rows="4" required></textarea>

            <button type="submit">
                <i class="fas fa-check-circle"></i> Confirm Order
            </button>

        </form>

    </div>

</div>

</div>

<!-- Footer -->
<jsp:include page="footer.jsp"/>

<script>
function validateOrderForm(){

    let qty = document.getElementById("qty").value;
    let price = document.getElementById("price").value;
    let total = document.getElementById("total").value;
    let address = document.getElementsByName("address")[0].value.trim();

    // QUANTITY VALIDATION
    if(qty === "" || qty <= 0){
        alert("Please enter valid quantity");
        return false;
    }

    // LIMIT CHECK (optional but recommended)
    if(qty > 100){
        alert("You cannot order more than 100 units at once");
        return false;
    }

    // TOTAL CHECK
    if(total === "" || total <= 0){
        alert("Total amount is invalid");
        return false;
    }

    // ADDRESS VALIDATION
    if(address.length < 10){
        alert("Please enter full delivery address (minimum 10 characters)");
        return false;
    }

    // SPECIAL CHARACTER CHECK (optional)
    let addressPattern = /^[a-zA-Z0-9\s,.-]+$/;
    if(!addressPattern.test(address)){
        alert("Address contains invalid characters");
        return false;
    }

    return true;
}
</script>
</body>
</html>