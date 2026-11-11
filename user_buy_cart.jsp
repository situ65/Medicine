<%@ page import="java.sql.*, java.util.*" %>
<%@ include file="dbcon.jsp"%>

<%
String cid = (String) session.getAttribute("cid");
String delivery= request.getParameter("delivery"); 

// Cart list
ArrayList cart = (ArrayList) session.getAttribute("purch");

if(cart == null || cart.size() == 0){
    response.sendRedirect("user_cart_view.jsp");
    return;
}

// Calculate total
double total = 0.0;
// Insert into orders
PreparedStatement ps = con.prepareStatement(
    "INSERT INTO orders(cid, orderdate, status, totalamount, deliveryaddress, paymentstatus) VALUES(?, NOW(), 'PENDING', ?, ?, 'PENDING')",
    Statement.RETURN_GENERATED_KEYS
);

for(int i=0; i<cart.size(); i++){
    HashMap item = (HashMap) cart.get(i);
    String name = (String) item.get("name");
    String price = (String) item.get("price");
    total += Double.parseDouble(price);
}
    ps.setString(1, cid);
    ps.setDouble(2, total);
    ps.setString(3, delivery); // you can change later

    int k = ps.executeUpdate();


// Get generated order id
ResultSet rs = ps.getGeneratedKeys();
int orderid = 0;

if(rs.next()){
    orderid = rs.getInt(1);
}


for(int j=0; j<cart.size(); j++){
    HashMap item = (HashMap) cart.get(j);

    int mid = Integer.parseInt((String) item.get("mid"));
    String name = (String) item.get("name"); 
    double price = Double.parseDouble((String) item.get("price"));
    int qty= (Integer) item.get("pack");
//    total += Double.parseDouble(price);

  //  String item = (String) cart.get(j);
  //  String data[] = item.split(",");

    //int mid = Integer.parseInt(data[0]);
    //int qty = Integer.parseInt(data[3]);

    double subtotal =  price*0.17 +price;

    
    // Insert into orderitems
    PreparedStatement ps2 = con.prepareStatement(
        "INSERT INTO orderitems(orderid, medicineid, quantity, unitprice, subtotal) VALUES(?,?,?,?,?)"
    );
    ps2.setInt(1, orderid);
    ps2.setInt(2, mid);
    ps2.setInt(3, qty);
    ps2.setDouble(4, price);
    ps2.setDouble(5, subtotal);
    ps2.executeUpdate();

    // update stock
    ps2 = con.prepareStatement(
        "update medicines set stock=stock-? where medicineid=?"
    );
    ps2.setInt(1, qty);
    ps2.setInt(2, mid);
    ps2.executeUpdate();

}

// Clear cart
session.removeAttribute("purch");
session.setAttribute("nums", 0);

// Redirect
response.sendRedirect("user_cart_buy_view.jsp?orderid=" + orderid);
%>  