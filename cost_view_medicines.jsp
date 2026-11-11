 <%@ page import="java.sql.*" %>
 <%@ page import="java.util.*" %>
 <%@ include file="dbcon.jsp" %>

 <%
 String search = request.getParameter("search");

 if (search == null) {
     search = "";
 }

 search = search.trim();
 %>

 <!DOCTYPE html>
 <html lang="en">

 <head>

 <meta charset="UTF-8">

 <meta name="viewport" content="width=device-width, initial-scale=1.0">

 <title>View Medicines</title>

 <link rel="stylesheet"
       href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

 <style>

 * {
     box-sizing: border-box;
 }

 body {
     margin: 0;
     font-family: 'Segoe UI', Arial, sans-serif;
     background: #f1f5f9;
     color: #333;
 }

 /* Main Container */
 .container {
     display: flex;
 }

 /* Main Content */
 .main {
     margin-left: 240px;
     margin-top: 70px;
     padding: 20px;
     width: calc(100% - 240px);
 }

 /* Top Bar */
 .topbar {
     background: white;
     padding: 20px;
     border-radius: 10px;
     box-shadow: 0 5px 15px rgba(0,0,0,0.08);
 }

 .topbar h2 {
     margin: 0;
     color: #1e3a8a;
 }

 /* Search Box */
 .search-box {
     margin-top: 20px;
     background: white;
     padding: 18px;
     border-radius: 10px;
     box-shadow: 0 5px 15px rgba(0,0,0,0.08);
 }

 .search-form {
     display: flex;
     gap: 10px;
     width: 100%;
 }

 .search-input {
     flex: 1;
     padding: 12px 15px;
     border: 1px solid #ccc;
     border-radius: 7px;
     font-size: 15px;
     outline: none;
 }

 .search-input:focus {
     border-color: #2563eb;
     box-shadow: 0 0 5px rgba(37,99,235,0.2);
 }

 /* Search Button */
 .search-btn {
     padding: 12px 20px;
     border: none;
     background: #2563eb;
     color: white;
     border-radius: 7px;
     cursor: pointer;
     font-size: 15px;
 }

 .search-btn:hover {
     background: #1e40af;
 }

 /* Clear Button */
 .clear-btn {
     display: inline-block;
     padding: 12px 18px;
     background: #64748b;
     color: white;
     border-radius: 7px;
     text-decoration: none;
     font-size: 15px;
 }

 .clear-btn:hover {
     background: #475569;
 }

 /* Search Result Text */
 .result-text {
     margin-top: 15px;
     font-size: 15px;
     color: #555;
 }

 /* Medicine Cards */
 .cards {
     display: grid;
     grid-template-columns: repeat(auto-fit, minmax(270px, 1fr));
     gap: 20px;
     margin-top: 20px;
 }

 /* Card */
 .card {
     background: white;
     padding: 20px;
     border-radius: 12px;
     box-shadow: 0 8px 20px rgba(0,0,0,0.08);
     transition: 0.3s;
 }

 .card:hover {
     transform: translateY(-5px);
     box-shadow: 0 12px 25px rgba(0,0,0,0.12);
 }

 /* Medicine Name */
 .card h3 {
     margin: 0 0 15px 0;
     color: #1e3a8a;
     font-size: 20px;
 }

 /* Medicine Information */
 .card p {
     margin: 8px 0;
     font-size: 14px;
     color: #555;
     line-height: 1.5;
 }

 /* Price */
 .price {
     font-weight: bold;
     color: green;
 }

 /* Stock */
 .stock {
     color: #2563eb !important;
     font-weight: bold;
 }

 /* Rupee */
 .rupee {
     color: green;
     font-weight: bold;
 }

 /* Add Cart Button */
 .btn {
     display: inline-block;
     margin-top: 12px;
     padding: 10px 15px;
     background: #16a34a;
     color: white;
     border-radius: 7px;
     text-decoration: none;
     font-size: 14px;
     transition: 0.3s;
 }

 .btn:hover {
     background: #15803d;
 }

 /* No Result */
 .no-result {
     grid-column: 1 / -1;
     background: white;
     padding: 30px;
     text-align: center;
     border-radius: 10px;
     color: #dc2626;
     font-weight: bold;
     box-shadow: 0 5px 15px rgba(0,0,0,0.08);
 }

 /* Responsive */
 @media (max-width: 768px) {

     .main {
         margin-left: 0;
         width: 100%;
         padding: 15px;
     }

     .search-form {
         flex-direction: column;
     }

     .search-btn,
     .clear-btn {
         width: 100%;
         text-align: center;
     }

     .cards {
         grid-template-columns: 1fr;
     }
 }

 </style>

 </head>

 <body>

 <!-- Navbar -->
 <jsp:include page="navbar.jsp"/>

 <!-- User Menu -->
 <jsp:include page="usermenu.jsp"/>


 <div class="container">

     <div class="main">

         <!-- Page Heading -->
         <div class="topbar">

             <h2>
                 <i class="fas fa-pills"></i>
                 Available Medicines
             </h2>

         </div>


         <!-- Search Section -->
         <div class="search-box">

             <form method="get"
                   action="cost_view_medicines.jsp"
                   class="search-form">

                 <input
                     type="text"
                     name="search"
                     class="search-input"
                     placeholder="Search medicine, company, category..."
                     value="<%= search %>"
                     autocomplete="off"
                 >

                 <button type="submit" class="search-btn">

                     <i class="fas fa-search"></i>
                     Search

                 </button>

                 <% if (!search.isEmpty()) { %>

                     <a href="cost_view_medicines.jsp"
                        class="clear-btn">

                         <i class="fas fa-times"></i>
                         Clear

                     </a>

                 <% } %>

             </form>


             <% if (!search.isEmpty()) { %>

                 <div class="result-text">

                     Search results for:
                     <strong><%= search %></strong>

                 </div>

             <% } %>

         </div>


         <!-- Medicine Cards -->
         <div class="cards">

 <%

 PreparedStatement ps = null;
 ResultSet rs = null;

 boolean hasData = false;

 try {

     /*
      * SEARCH QUERY
      *
      * Search is performed directly on medicines table.
      * We are NOT joining the photo table here.
      *
      * This prevents a missing photo record from causing
      * the medicine to disappear from search results.
      */

     if (!search.isEmpty()) {

         String sql =
             "SELECT medicineid, medicinename, companyname, medType, " +
             "category, description, packSize, pricePerPack, stock, expirydate " +
             "FROM medicines " +
             "WHERE medicinename LIKE ? " +
             "OR companyname LIKE ? " +
             "OR category LIKE ? " +
             "OR description LIKE ? " +
             "ORDER BY medicinename";

         ps = con.prepareStatement(sql);

         String keyword = "%" + search + "%";

         ps.setString(1, keyword);
         ps.setString(2, keyword);
         ps.setString(3, keyword);
         ps.setString(4, keyword);

     }

     /*
      * SHOW ALL MEDICINES
      */
     else {

         String sql =
             "SELECT medicineid, medicinename, companyname, medType, " +
             "category, description, packSize, pricePerPack, stock, expirydate " +
             "FROM medicines " +
             "ORDER BY medicinename";

         ps = con.prepareStatement(sql);
     }


     rs = ps.executeQuery();


     while (rs.next()) {

         hasData = true;

         int medicineId = rs.getInt("medicineid");

         String medicineName = rs.getString("medicinename");

         String companyName = rs.getString("companyname");

         String medicineType = rs.getString("medType");

         String category = rs.getString("category");

         String description = rs.getString("description");

         int packSize = rs.getInt("packSize");

         double price = rs.getDouble("pricePerPack");

         int stock = rs.getInt("stock");

         String expiryDate = rs.getString("expirydate");

 %>


             <!-- Medicine Card -->
             <div class="card">

                 <h3>

                     <i class="fas fa-capsules"></i>

                     <%= medicineName %>

                 </h3>


                 <p>
                     <b>Company:</b>
                     <%= companyName != null ? companyName : "N/A" %>
                 </p>


                 <p>
                     <b>Type:</b>
                     <%= medicineType != null ? medicineType : "N/A" %>
                 </p>


                 <p>

                     <b>Category:</b>

                     <%= category != null ? category : "N/A" %>

                 </p>


                 <p>

                     <b>Description:</b>

                     <%= description != null ? description : "N/A" %>

                 </p>


                 <p>

                     <b>Pack Size:</b>

                     <%= packSize %>

                 </p>


                 <p class="price">

                     <b>Price:</b>

                     <span class="rupee">&#8377;</span>

                     <%= String.format("%.2f", price) %>

                     / pack

                 </p>


                 <p class="stock">

                     <b>Stock:</b>

                     <%= stock %>

                 </p>


                 <p>

                     <b>Expiry Date:</b>

                     <%= expiryDate != null ? expiryDate : "N/A" %>

                 </p>


                 <!-- Existing cart action -->
                 <a
                     href="user_cart.jsp?mid=<%= medicineId %>&name=<%= java.net.URLEncoder.encode(medicineName, "UTF-8") %>&price=<%= price %>&pack=<%= packSize %>"
                     class="btn"
                 >

                     <i class="fas fa-cart-plus"></i>

                     Add to Cart

                 </a>

             </div>


 <%

     }


     /*
      * NO RESULTS
      */

     if (!hasData) {

 %>

             <div class="no-result">

                 <i class="fas fa-search"></i>

                 <br><br>

                 No medicines found

                 <% if (!search.isEmpty()) { %>

                     for "<%= search %>"

                 <% } %>

             </div>

 <%

     }


 } catch (Exception e) {

 %>

             <div class="no-result">

                 <i class="fas fa-exclamation-triangle"></i>

                 <br><br>

                 Database Error

                 <br><br>

                 <small>
                     <%= e.getMessage() %>
                 </small>

             </div>

 <%

 } finally {

     try {
         if (rs != null) rs.close();
     } catch (Exception ignored) {}

     try {
         if (ps != null) ps.close();
     } catch (Exception ignored) {}

 }

 %>

         </div>

     </div>

 </div>


 <!-- Footer -->
 <jsp:include page="footer.jsp"/>


 </body>

 </html>