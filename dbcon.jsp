 <%@ page import="java.sql.*" %>

 <%!
     Connection con = null;
     Statement st = null;
 %>

 <%
 try {
     String dbUrl = System.getenv("MEDICINE_DB_URL");
     String dbUser = System.getenv("MEDICINE_DB_USER");
     String dbPassword = System.getenv("MEDICINE_DB_PASSWORD");

     Class.forName("com.mysql.cj.jdbc.Driver");

     con = DriverManager.getConnection(
         dbUrl,
         dbUser,
         dbPassword
     );

     st = con.createStatement(
         ResultSet.TYPE_SCROLL_SENSITIVE,
         ResultSet.CONCUR_UPDATABLE
     );

 } catch(Exception e) {
     application.log("Database connection failed", e);
     out.print("Database connection failed.");
 }
 %>