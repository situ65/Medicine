 <%@ page import="java.sql.*" %>
 <%@ include file="dbcon.jsp"%>

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

 <title>Users List</title>

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

 .container {
     display: flex;
 }

 .main {
     margin-left: 240px;
     margin-top: 70px;
     padding: 20px;
     width: calc(100% - 240px);
 }

 /* Header */

 .topbar {
     background: white;
     padding: 18px 20px;
     border-radius: 10px;
     box-shadow: 0 5px 15px rgba(0,0,0,0.08);
     margin-bottom: 20px;
 }

 .topbar h2 {
     margin: 0;
     color: #1e3a8a;
 }


 /* Search Box */

 .search-box {
     background: white;
     padding: 18px;
     border-radius: 10px;
     box-shadow: 0 5px 15px rgba(0,0,0,0.08);
     margin-bottom: 20px;
 }

 .search-form {
     display: flex;
     gap: 10px;
 }

 .search-input {
     flex: 1;
     padding: 12px 15px;
     border: 1px solid #d1d5db;
     border-radius: 7px;
     font-size: 15px;
     outline: none;
 }

 .search-input:focus {
     border-color: #2563eb;
     box-shadow: 0 0 5px rgba(37,99,235,0.2);
 }

 .search-btn {
     padding: 12px 20px;
     background: #2563eb;
     color: white;
     border: none;
     border-radius: 7px;
     cursor: pointer;
     font-size: 15px;
 }

 .search-btn:hover {
     background: #1e40af;
 }

 .clear-btn {
     padding: 12px 18px;
     background: #64748b;
     color: white;
     border-radius: 7px;
     text-decoration: none;
     display: inline-flex;
     align-items: center;
 }

 .clear-btn:hover {
     background: #475569;
 }

 .search-result {
     margin-top: 12px;
     color: #64748b;
     font-size: 14px;
 }


 /* Table */

 .table-container {
     background: white;
     padding: 20px;
     border-radius: 10px;
     box-shadow: 0 5px 15px rgba(0,0,0,0.08);
     overflow-x: auto;
 }

 table {
     width: 100%;
     border-collapse: collapse;
 }

 th,
 td {
     padding: 13px 15px;
     text-align: left;
     border-bottom: 1px solid #e5e7eb;
 }

 th {
     background: #2563eb;
     color: white;
     font-weight: 600;
 }

 tbody tr:nth-child(even) {
     background: #f8fafc;
 }

 tbody tr:hover {
     background: #eff6ff;
 }

 .serial {
     width: 70px;
     text-align: center;
 }

 .user-name {
     font-weight: 600;
     color: #1e3a8a;
 }

 .phone {
     color: #374151;
 }

 .no-users {
     text-align: center;
     padding: 30px;
     color: #64748b;
 }

 .error {
     padding: 15px;
     background: #fee2e2;
     color: #b91c1c;
     border-radius: 7px;
 }


 /* Responsive */

 @media (max-width: 800px) {

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
         justify-content: center;
         text-align: center;
     }

     table {
         min-width: 800px;
     }
 }

 </style>

 </head>


 <body>

 <jsp:include page="navbar.jsp"/>

 <jsp:include page="adminmenu.jsp"/>


 <div class="container">

 <div class="main">


 <!-- Page Header -->

 <div class="topbar">

     <h2>
         <i class="fas fa-users"></i>
         Users List
     </h2>

 </div>


 <!-- Search -->

 <div class="search-box">

     <form method="get"
           action="admin_users.jsp"
           class="search-form">

         <input
             type="text"
             name="search"
             class="search-input"
             placeholder="Search by name, phone, gender or marital status..."
             value="<%= search %>"
             autocomplete="off"
         >

         <button type="submit" class="search-btn">

             <i class="fas fa-search"></i>
             Search

         </button>


         <% if (!search.isEmpty()) { %>

             <a href="users.jsp" class="clear-btn">

                 <i class="fas fa-times"></i>
                 Clear

             </a>

         <% } %>

     </form>


     <% if (!search.isEmpty()) { %>

         <div class="search-result">

             Search results for:
             <strong><%= search %></strong>

         </div>

     <% } %>

 </div>


 <!-- Users Table -->

 <div class="table-container">

 <table>

 <thead>

 <tr>

     <th class="serial">S.No.</th>

     <th>Name</th>

     <th>Date of Birth</th>

     <th>Gender</th>

     <th>Phone</th>

     <th>Marital Status</th>

 </tr>

 </thead>


 <tbody>

 <%

 int count = 0;

 PreparedStatement ps = null;
 ResultSet rs = null;

 try {

     String sql;

     if (!search.isEmpty()) {

         sql =
             "SELECT name, dob, gender, phone, mstatus " +
             "FROM customer " +
             "WHERE name LIKE ? " +
             "OR phone LIKE ? " +
             "OR gender LIKE ? " +
             "OR mstatus LIKE ? " +
             "ORDER BY name";

         ps = con.prepareStatement(sql);

         String keyword = "%" + search + "%";

         ps.setString(1, keyword);
         ps.setString(2, keyword);
         ps.setString(3, keyword);
         ps.setString(4, keyword);

     } else {

         sql =
             "SELECT name, dob, gender, phone, mstatus " +
             "FROM customer " +
             "ORDER BY name";

         ps = con.prepareStatement(sql);
     }


     rs = ps.executeQuery();


     while (rs.next()) {

         count++;

 %>

 <tr>

     <td class="serial">
         <%= count %>
     </td>


     <td class="user-name">

         <i class="fas fa-user"></i>

         <%= rs.getString("name") %>

     </td>


     <td>
         <%= rs.getString("dob") %>
     </td>


     <td>
         <%= rs.getString("gender") %>
     </td>


     <td class="phone">

         <i class="fas fa-phone"></i>

         <%= rs.getString("phone") %>

     </td>


     <td>
         <%= rs.getString("mstatus") %>
     </td>

 </tr>


 <%

     }


     if (count == 0) {

 %>

 <tr>

     <td colspan="6" class="no-users">

         <i class="fas fa-user-slash"></i>

         <br><br>

         No users found.

         <% if (!search.isEmpty()) { %>

             for "<%= search %>"

         <% } %>

     </td>

 </tr>

 <%

     }

 } catch (Exception e) {

 %>

 <tr>

     <td colspan="6">

         <div class="error">

             <b>
                 <i class="fas fa-exclamation-triangle"></i>
                 Database Error:
             </b>

             <%= e.getMessage() %>

         </div>

     </td>

 </tr>

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

 </tbody>

 </table>

 </div>

 </div>

 </div>


 <jsp:include page="footer.jsp"/>

 </body>

 </html>