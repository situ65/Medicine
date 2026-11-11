<%@ page import="java.util.*" %>

<%
int index = Integer.parseInt(request.getParameter("index"));

ArrayList cart = (ArrayList) session.getAttribute("purch");

if(cart != null && cart.size() > index){
    cart.remove(index);
}

// Update count
session.setAttribute("nums", cart.size());

// Redirect back
response.sendRedirect("user_cart_view.jsp");
%>