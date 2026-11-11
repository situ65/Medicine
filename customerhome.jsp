 <%@ page import="java.sql.*" %>
 <%@ page import="java.util.*" %>

 <%@ include file="dbcon.jsp" %>

 <!DOCTYPE html>
 <html>
 <head>

     <meta charset="UTF-8">

     <title>Customer Home</title>

     <meta name="viewport" content="width=device-width, initial-scale=1.0">

     <!-- Font Awesome -->
     <link rel="stylesheet"
           href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

     <style>

         * {
             margin: 0;
             padding: 0;
             box-sizing: border-box;
             font-family: Arial, sans-serif;
         }

         body {
             background: #f5f7fb;
             color: #333;
         }

         /* NAVBAR */

         .navbar {
             width: 100%;
             height: 70px;
             background: #1b5e20;
             display: flex;
             align-items: center;
             justify-content: space-between;
             padding: 0 40px;
             color: white;
         }

         .logo {
             font-size: 25px;
             font-weight: bold;
         }

         .nav-right {
             display: flex;
             align-items: center;
             gap: 25px;
         }

         .nav-right a {
             color: white;
             text-decoration: none;
             font-size: 16px;
         }

         .nav-right a:hover {
             color: #c8e6c9;
         }

         .cart {
             position: relative;
         }

         .cart-count {
             position: absolute;
             top: -12px;
             right: -14px;
             background: red;
             color: white;
             border-radius: 50%;
             min-width: 20px;
             height: 20px;
             text-align: center;
             line-height: 20px;
             font-size: 11px;
         }

         /* HERO */

         .hero {
             min-height: 300px;
             background: linear-gradient(
                 rgba(27, 94, 32, 0.85),
                 rgba(46, 125, 50, 0.85)
             );

             display: flex;
             align-items: center;
             justify-content: center;
             text-align: center;
             color: white;
             padding: 40px 20px;
         }

         .hero-content h1 {
             font-size: 42px;
             margin-bottom: 15px;
         }

         .hero-content p {
             font-size: 18px;
             margin-bottom: 25px;
         }

         .hero-btn {
             display: inline-block;
             padding: 12px 25px;
             background: white;
             color: #1b5e20;
             text-decoration: none;
             border-radius: 5px;
             font-weight: bold;
         }

         .hero-btn:hover {
             background: #e8f5e9;
         }

         /* WELCOME */

         .welcome {
             padding: 35px 40px 15px;
             text-align: center;
         }

         .welcome h2 {
             font-size: 28px;
             color: #1b5e20;
             margin-bottom: 10px;
         }

         .welcome p {
             color: #666;
         }

         /* CARDS */

         .container {
             width: 90%;
             max-width: 1100px;
             margin: 30px auto 50px;
         }

         .cards {
             display: grid;
             grid-template-columns: repeat(3, 1fr);
             gap: 25px;
         }

         .card {
             background: white;
             border-radius: 10px;
             padding: 30px 20px;
             text-align: center;
             box-shadow: 0 4px 15px rgba(0,0,0,0.08);
             transition: 0.3s;
         }

         .card:hover {
             transform: translateY(-5px);
         }

         .card i {
             font-size: 40px;
             color: #2e7d32;
             margin-bottom: 15px;
         }

         .card h3 {
             margin-bottom: 10px;
             color: #333;
         }

         .card p {
             color: #777;
             line-height: 1.5;
             margin-bottom: 20px;
         }

         .card a {
             display: inline-block;
             padding: 10px 18px;
             background: #2e7d32;
             color: white;
             text-decoration: none;
             border-radius: 5px;
         }

         .card a:hover {
             background: #1b5e20;
         }

         /* STATISTICS */

         .stats {
             display: grid;
             grid-template-columns: repeat(3, 1fr);
             gap: 20px;
             margin-top: 35px;
         }

         .stat-box {
             background: white;
             padding: 25px;
             text-align: center;
             border-radius: 10px;
             box-shadow: 0 4px 12px rgba(0,0,0,0.07);
         }

         .stat-box h2 {
             color: #2e7d32;
             font-size: 30px;
             margin-bottom: 5px;
         }

         .stat-box p {
             color: #777;
         }

         /* FOOTER */

         footer {
             background: #1b5e20;
             color: white;
             text-align: center;
             padding: 20px;
         }

         /* MOBILE */

         @media(max-width: 768px) {

             .navbar {
                 padding: 0 15px;
             }

             .logo {
                 font-size: 20px;
             }

             .nav-right {
                 gap: 12px;
             }

             .nav-right a {
                 font-size: 13px;
             }

             .hero-content h1 {
                 font-size: 30px;
             }

             .cards,
             .stats {
                 grid-template-columns: 1fr;
             }

         }

     </style>

 </head>

 <body>

 <%

 /*
  * ============================================================
  * CUSTOMER SESSION
  * ============================================================
  */

 String uid = (String) session.getAttribute("cid");

 /*
  * If customer is not logged in, send them to login page.
  */
 if (uid == null || uid.trim().equals("")) {

     response.sendRedirect("index.jsp");
     return;
 }


 /*
  * ============================================================
  * IMPORTANT CART FIX
  * ============================================================
  *
  * DO NOT DO THIS:
  *
  * session.removeAttribute("purch");
  * session.removeAttribute("nums");
  * session.removeAttribute("price");
  *
  * Those statements were deleting the cart whenever
  * customerhome.jsp was opened.
  *
  * Instead, initialize the cart ONLY when it does not exist.
  */

 ArrayList cart =
         (ArrayList) session.getAttribute("purch");

 if (cart == null) {

     cart = new ArrayList();

     session.setAttribute("purch", cart);
 }


 /*
  * Calculate current cart count.
  */

 int cartCount = cart.size();

 session.setAttribute("nums", cartCount);


 /*
  * Calculate current cart total.
  */

 double cartTotal = 0.0;

 for (int i = 0; i < cart.size(); i++) {

     try {

         HashMap item =
                 (HashMap) cart.get(i);

         Object priceObject =
                 item.get("price");

         if (priceObject != null) {

             cartTotal +=
                     Double.parseDouble(
                             priceObject.toString()
                     );
         }

     } catch (Exception e) {

         // Ignore invalid cart item
     }
 }

 session.setAttribute("price", cartTotal);


 /*
  * ============================================================
  * CUSTOMER INFORMATION
  * ============================================================
  */

 String customerName = "Customer";

 try {

     PreparedStatement ps =
             con.prepareStatement(
                 "SELECT name FROM customer WHERE cid = ?"
             );

     ps.setString(1, uid);

     ResultSet customerRs =
             ps.executeQuery();

     if (customerRs.next()) {

         customerName =
                 customerRs.getString("name");
     }

     customerRs.close();
     ps.close();

 } catch (Exception e) {

     System.out.println(
         "Customer details error: " + e
     );
 }


 /*
  * ============================================================
  * ORDER COUNT
  * ============================================================
  */

 int orderCount = 0;

 try {

     PreparedStatement ps =
             con.prepareStatement(
                 "SELECT COUNT(*) FROM orders WHERE cid = ?"
             );

     ps.setString(1, uid);

     ResultSet rs =
             ps.executeQuery();

     if (rs.next()) {

         orderCount =
                 rs.getInt(1);
     }

     rs.close();
     ps.close();

 } catch (Exception e) {

     System.out.println(
         "Order count error: " + e
     );
 }


 /*
  * ============================================================
  * DELIVERY COUNT
  * ============================================================
  */

 int deliveryCount = 0;

 try {

     PreparedStatement ps =
             con.prepareStatement(
                 "SELECT COUNT(*) FROM deliverydet WHERE cid = ?"
             );

     ps.setString(1, uid);

     ResultSet rs =
             ps.executeQuery();

     if (rs.next()) {

         deliveryCount =
                 rs.getInt(1);
     }

     rs.close();
     ps.close();

 } catch (Exception e) {

     System.out.println(
         "Delivery count error: " + e
     );
 }

 %>


 <!-- ============================================================
      NAVBAR
      ============================================================ -->

 <div class="navbar">

     <div class="logo">
         <i class="fa-solid fa-house-medical"></i>
         MediCare
     </div>

     <div class="nav-right">

         <a href="customerhome.jsp">
             <i class="fa-solid fa-house"></i>
             Home
         </a>

         <a href="cost_view_medicines.jsp">
             <i class="fa-solid fa-capsules"></i>
             Medicines
         </a>

         <a href="user_cart_view.jsp" class="cart">

             <i class="fa-solid fa-cart-shopping"></i>
             Cart

             <span class="cart-count">
                 <%= cartCount %>
             </span>

         </a>

         <a href="myorders.jsp">
             <i class="fa-solid fa-box"></i>
             Orders
         </a>

         <a href="logout.jsp">
             <i class="fa-solid fa-right-from-bracket"></i>
             Logout
         </a>

     </div>

 </div>


 <!-- ============================================================
      HERO
      ============================================================ -->

 <section class="hero">

     <div class="hero-content">

         <h1>
             Welcome, <%= customerName %>
         </h1>

         <p>
             Welcome to your customer dashboard.
         </p>

         <a href="cost_view_medicines.jsp"
            class="hero-btn">

             Browse Medicines

         </a>

     </div>

 </section>


 <!-- ============================================================
      WELCOME
      ============================================================ -->

 <section class="welcome">

     <h2>
         Customer Dashboard
     </h2>

     <p>
         Manage your account and view your activity.
     </p>

 </section>


 <!-- ============================================================
      MAIN CARDS
      ============================================================ -->

 <div class="container">

     <div class="cards">


         <!-- MEDICINES -->

         <div class="card">

             <i class="fa-solid fa-pills"></i>

             <h3>
                 Medicines
             </h3>

             <p>
                 Browse the available catalogue.
             </p>

             <a href="cost_view_medicines.jsp">
                 View Medicines
             </a>

         </div>


         <!-- CART -->

         <div class="card">

             <i class="fa-solid fa-cart-shopping"></i>

             <h3>
                 My Cart
             </h3>

             <p>
                 Items currently in your session cart:
                 <strong><%= cartCount %></strong>
             </p>

             <a href="user_cart_view.jsp">
                 View Cart
             </a>

         </div>


         <!-- ORDERS -->

         <div class="card">

             <i class="fa-solid fa-box-open"></i>

             <h3>
                 My Orders
             </h3>

             <p>
                 Orders associated with your account:
                 <strong><%= orderCount %></strong>
             </p>

             <a href="user_cart_buy_view.jsp">
                 View Orders
             </a>

         </div>


     </div>


     <!-- ========================================================
          STATISTICS
          ======================================================== -->

     <div class="stats">


         <div class="stat-box">

             <h2>
                 <%= cartCount %>
             </h2>

             <p>
                 Cart Items
             </p>

         </div>


         <div class="stat-box">

             <h2>
                 <%= orderCount %>
             </h2>

             <p>
                 Orders
             </p>

         </div>


         <div class="stat-box">

             <h2>
                 <%= deliveryCount %>
             </h2>

             <p>
                 Delivery Records
             </p>

         </div>


     </div>

 </div>


 <!-- ============================================================
      FOOTER
      ============================================================ -->

 <footer>

     <p>
         © 2026 MediCare. All Rights Reserved.
     </p>

 </footer>


 </body>
 </html>

 <%

 /*
  * Close database connection.
  */

 try {

     if (con != null) {
         con.close();
     }

 } catch (Exception e) {

     System.out.println(
         "Connection close error: " + e
     );
 }

 %>