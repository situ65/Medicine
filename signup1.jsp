 <%@ page import="java.sql.*" %>
 <%@ include file="dbcon.jsp"%>

 <%
 String name = request.getParameter("name");
 String phone = request.getParameter("phone");
 String dob = request.getParameter("dob");
 String gender = request.getParameter("gender");
 String mstatus = request.getParameter("mstatus");

 String logname = request.getParameter("logname");
 String pwd = request.getParameter("password");
 String type= "Customer";
 String status= "Y";
 String secques = request.getParameter("security_question");
 String secans = request.getParameter("security_answer");

 String cid = "";

 try {
     String maxQuery = "SELECT MAX(SUBSTRING(cid, 2)) FROM customer";
     Statement st = con.createStatement();
     ResultSet rsMax = st.executeQuery(maxQuery);

     int cnt = 0;
     if (rsMax.next()) {
         cnt = rsMax.getInt(1);
     }

     cnt++;

     cid = String.format("C%05d", cnt); // cleaner formatting

     rsMax.close();
     st.close();

 PreparedStatement ps = con.prepareStatement(
         "INSERT INTO customer VALUES(?,?,?,?,?,?)"
     );

     ps.setString(1, cid);
     ps.setString(2, name);
     ps.setString(3, phone);
     ps.setString(4, dob);
     ps.setString(5, gender);
     ps.setString(6, mstatus);

     int i1 = ps.executeUpdate();

     PreparedStatement ps1 = con.prepareStatement(
         "INSERT INTO login VALUES(?,?,?,?,?,?,?)"
     );

     ps1.setString(1, cid);
     ps1.setString(2, logname);
     ps1.setString(3, pwd);
     ps1.setString(4, type);
     ps1.setString(5, status);
     ps1.setString(6, secques);
     ps1.setString(7, secans);

     int i2 = ps1.executeUpdate();

     if(i1 > 0 && i2 >0){
 %>
 <script>
 alert("Registered Successfully");
 window.location="login.jsp";
 </script>
 <%
     } else {
 %>
 <script>
 alert("Failed to Add Employee");
 history.back();
 </script>
 <%
     }

 } catch(Exception e){
     out.print(e);
 }
 %>


 correct code