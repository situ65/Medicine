<%@ page import="java.util.*" %>

<%
String mid = request.getParameter("mid");
String name = request.getParameter("name");
String price = request.getParameter("price");
int pack = Integer.parseInt(request.getParameter("pack"));

// Get session cart
ArrayList cart = (ArrayList) session.getAttribute("purch");

if(cart == null){
    cart = new ArrayList();
}

// Create item (you can also use a custom class later)
HashMap item = new HashMap();
item.put("mid", mid);
item.put("name", name);
item.put("price", price);
item.put("pack", pack);

// Add to cart
cart.add(item);

// Save back to session
session.setAttribute("purch", cart);

// Update count
int count = cart.size();
session.setAttribute("nums", count);

// Update total price
double total = 0.0;
for(int i=0; i<cart.size(); i++){
    HashMap m = (HashMap) cart.get(i);
    total += Double.parseDouble((String)m.get("price"));
}
session.setAttribute("price", total);

// Redirect back
//response.sendRedirect("cost_view_medicines.jsp");
response.sendRedirect("user_cart_view.jsp");

%>