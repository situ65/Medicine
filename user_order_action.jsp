<%@ page import="java.sql.*" %>
<%@ include file="dbcon.jsp"%>

<%
String uid = (String) session.getAttribute("cid");

// Get parameters safely
String midStr = request.getParameter("mid");
String qtyStr = request.getParameter("qty");
String priceStr = request.getParameter("price");
String totalStr = request.getParameter("total");
String address = request.getParameter("address");

// Debug (VERY IMPORTANT)
out.println("uid=" + uid + "<br>");
out.println("mid=" + midStr + "<br>");
out.println("qty=" + qtyStr + "<br>");
out.println("price=" + priceStr + "<br>");
out.println("total=" + totalStr + "<br>");

// Validate
if(midStr == null || qtyStr == null || priceStr == null || totalStr == null){
    out.print("<h3 style='color:red'>Error: Missing form data!</h3>");
    return;
}

// Convert safely
int mid = Integer.parseInt(midStr);
int qty = Integer.parseInt(qtyStr);
double price = Double.parseDouble(priceStr);
double total = Double.parseDouble(totalStr);

try {

    // ✅ Insert into orders
    PreparedStatement ps1 = con.prepareStatement(
        "INSERT INTO orders(cid, status, totalamount, deliveryaddress, paymentstatus) VALUES(?,?,?,?,?)",
        Statement.RETURN_GENERATED_KEYS
    );

    ps1.setString(1, uid);
    ps1.setString(2, "PENDING");
    ps1.setDouble(3, total);
    ps1.setString(4, address);
    ps1.setString(5, "PENDING");

    ps1.executeUpdate();

    // 🔥 Get generated orderid
    ResultSet rs = ps1.getGeneratedKeys();
    int orderid = 0;

    if(rs.next()){
        orderid = rs.getInt(1);
    }

    // ✅ Insert into orderitems
PreparedStatement ps2 = con.prepareStatement(
    "INSERT INTO orderitems(orderid, medicineid, quantity, unitprice, subtotal) VALUES(?,?,?,?,?)"
);

ps2.setInt(1, orderid);
ps2.setInt(2, mid);
ps2.setInt(3, qty);
ps2.setDouble(4, price);
ps2.setDouble(5, total);

ps2.executeUpdate();


// ✅ 🔥 UPDATE STOCK HERE
PreparedStatement ps3 = con.prepareStatement(
    "UPDATE medicines SET stock = stock - ? WHERE medicineid=?"
);

ps3.setInt(1, qty);
ps3.setInt(2, mid);

ps3.executeUpdate();
%>

<script>
alert("Order Placed Successfully!");
window.location="user_order_payment.jsp?orderid=" + <%= orderid %> + "&amount=" + <%= total %>;
</script>

<%
} catch(Exception e){
    out.print(e);
}
%>