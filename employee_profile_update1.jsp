<%@ page import="java.sql.*" %>
<%@ include file="dbcon.jsp"%>

<%
    // Logged-in employee ID
    String eid = (String) session.getAttribute("cid");

    String name = request.getParameter("name");
    String fname = request.getParameter("fname");
    String dob = request.getParameter("dob");
    String doj = request.getParameter("doj");
    String gender = request.getParameter("gender");
    String mstatus = request.getParameter("mstatus");
    String phone = request.getParameter("phone");
    String mail = request.getParameter("mail");
    String cadd = request.getParameter("cadd");
    String padd = request.getParameter("padd");
    String qual = request.getParameter("qual");

    try {
        PreparedStatement ps = con.prepareStatement(
            "UPDATE employee SET name=?, fname=?, dob=?,  gender=?, mstatus=?, phone=?, mail=?, cadd=?, padd=?, qual=? WHERE eid=?"
        );

        ps.setString(1, name);
        ps.setString(2, fname);
        ps.setString(3, dob); 
        ps.setString(4, gender);
        ps.setString(5, mstatus);
        ps.setString(6, phone);
        ps.setString(7, mail);
        ps.setString(8, cadd);
        ps.setString(9, padd);
        ps.setString(10, qual);
        ps.setString(11, eid);

        int i = ps.executeUpdate();

        if(i > 0){
%>
            <script>
                alert("Profile Updated Successfully");
                window.location="employee_profile_view.jsp";
            </script>
<%
        } else {
%>
            <script>
                alert("Update Failed");
  //              history.back();
            </script>
<%
        }

    } catch(Exception e) {
        out.print("<h3 style='color:red;'>Error: " + e + "</h3>");
    }
%>