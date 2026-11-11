 <%@ page import="java.sql.*" %>
 <%@ include file="dbcon.jsp" %>

 <%
 String typ = null;
 String id = null;

 String username = request.getParameter("t1");
 String password = request.getParameter("p1");

 try {

     // Check username and password
     PreparedStatement ps = con.prepareStatement(
         "SELECT cid, type FROM login " +
         "WHERE logname = ? AND pwd = ? AND status = 'Y'"
     );

     ps.setString(1, username);
     ps.setString(2, password);

     ResultSet rs = ps.executeQuery();

     if (rs.next()) {

         // Get customer/employee/admin ID and type
         id = rs.getString("cid");
         typ = rs.getString("type");

         // Remove old session values
         session.removeAttribute("cid");
         session.removeAttribute("name");
         session.removeAttribute("type");

         // Store new session values
         session.setAttribute("cid", id);
         session.setAttribute("name", username);

         if (typ != null) {
             typ = typ.trim().toLowerCase();
             session.setAttribute("type", typ);
         }

         rs.close();
         ps.close();

         // Redirect according to user type
         if ("admin".equalsIgnoreCase(typ)) {

             response.sendRedirect("adminhome.jsp");

         }
         else if ("customer".equalsIgnoreCase(typ)) {

             response.sendRedirect("customerhome.jsp");

         }
         else if ("employee".equalsIgnoreCase(typ)) {

             response.sendRedirect("employee_dashboard.jsp");

         }
         else {

             response.sendRedirect("login.jsp?a1=invalidtype");

         }

     }
     else {

         rs.close();
         ps.close();

         // Username/password doesn't exist
         response.sendRedirect("login.jsp?a1=error");

     }

 } catch (Exception e) {

     e.printStackTrace();

     out.println("<h3>Login Error: " + e.getMessage() + "</h3>");

 }
 %>