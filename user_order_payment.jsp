<%@ page import="java.sql.*" %> <%@ include file="dbcon.jsp"%> <% String orderid
= request.getParameter("orderid"); String amount =
request.getParameter("amount"); 
String cid = (String) session.getAttribute("cid"); %>

<!DOCTYPE html>
<html>
  <head>
    <title>Payment</title>

    <style>
      body {
        font-family: "Segoe UI";
        background: #f1f5f9;
      }

      .topbar {
        width: 420px;
        margin: 60px auto 20px auto;
        padding: 18px 25px;
        border-radius: 12px;

        background: linear-gradient(135deg, #22c55e, #16a34a);
        color: white;

        display: flex;
        align-items: center;
        gap: 15px;
        margin-bottom: 5px;

        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
      }
      .container {
        width: 400px;
        margin: 80px auto;
        background: white;
        padding: 25px;
        border-radius: 10px;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        margin-top: 10px;
      }

      input,
      select {
        width: 100%;
        padding: 10px;
        margin: 10px 0;
        border-radius: 5px;
        border: 1px solid #ccc;
        box-sizing: border-box;
      }

      button {
        width: 100%;
        box-sizing: border-box;
        padding: 10px;
        background: #2563eb;
        color: white;
        border: none;
        border-radius: 20px;
      }
    </style>
  </head>

  <body>
    <div class="topbar">
      <i class="fas fa-check-circle" style="font-size: 28px"></i>
      <div>
        <h3 style="margin: 0">Order Placed Successfully!</h3>
        <p style="margin: 2px 0 0 0; font-size: 14px">
          Proceed to complete your payment
        </p>
      </div>
    </div>
    <div class="container">
      <h2>Payment</h2>

      <form
        action="user_order_payment_action.jsp"
        method="post"
        onsubmit="return validateForm();"
      >
        <input type="hidden" name="orderid" value="<%= orderid %>" />
        <input type="hidden" name="amount" value="<%= amount %>" />

        <!-- Payment Type -->
        <label>Payment Type</label>
        <select name="ptype" id="ptype" onchange="toggleFields()" required>
          <option value="">Select</option>
          <option value="Credit Card">Credit Card</option>
          <option value="Debit Card">Debit Card</option>
          <option value="Cash">Cash</option>
        </select>

        <!-- Amount -->
        <label>Amount</label>
        <input type="text" value="<%= amount %>" readonly />

        <!-- 🔽 Hidden Fields -->
        <div id="cardFields" style="display: none">
          <label>Bank Name</label>
          <input type="text" id="bname" name="bname" />

          <label>Card Number</label>
          <input type="text" id="cardno" name="cardno" />

          <label>Account Number</label>
          <input type="text" id="acno" name="acno" />
        </div>

        <button type="submit">Pay Now</button>
      </form>
    </div>

    <script>
function toggleFields() {
    let type = document.getElementById("ptype").value;
    let cardSection = document.getElementById("cardFields");

    if (type === "Credit Card" || type === "Debit Card") {
        cardSection.style.display = "block";
    } else {
        cardSection.style.display = "none";
    }
}

function validateForm() {

    let type = document.getElementById("ptype").value;

    // ✅ Payment type validation
    if (type === "") {
        alert("Please select a payment type!");
        return false;
    }

    // ✅ Card validation only if needed
    if (type === "Credit Card" || type === "Debit Card") {

        let bname = document.getElementById("bname").value.trim();
        let cardno = document.getElementById("cardno").value.trim();
        let acno = document.getElementById("acno").value.trim();

        // Required fields
        if (bname === "") {
            alert("Please enter Bank Name!");
            return false;
        }

        if (cardno === "") {
            alert("Please enter Card Number!");
            return false;
        }

        if (acno === "") {
            alert("Please enter Account Number!");
            return false;
        }

        // Card number validation (13–16 digits)
        if (!/^\d{13,16}$/.test(cardno)) {
            alert("Card number must be 13 to 16 digits!");
            return false;
        }

        // Account number validation (9–18 digits)
        if (!/^\d{9,18}$/.test(acno)) {
            alert("Account number must be 9 to 18 digits!");
            return false;
        }

        // Bank name validation (letters only)
        if (!/^[A-Za-z ]+$/.test(bname)) {
            alert("Bank name should contain only letters!");
            return false;
        }
    }

    // ✅ If everything is valid
    return true;
}
</script>
</body>
</html>
