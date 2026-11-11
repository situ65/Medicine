<%@ page import="java.sql.*" %>
<%@ include file="dbcon.jsp" %>

<%
    // Get form data
    String eid = request.getParameter("eid");
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

    int status = 0;

    try {
        String sql = "UPDATE employee SET "
                   + "name=?, fname=?, dob=?, doj=?, gender=?, "
                   + "mstatus=?, phone=?, mail=?, cadd=?, padd=?, qual=? "
                   + "WHERE eid=?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, name);
        ps.setString(2, fname);
        ps.setString(3, dob);
        ps.setString(4, doj);
        ps.setString(5, gender);
        ps.setString(6, mstatus);
        ps.setString(7, phone);
        ps.setString(8, mail);
        ps.setString(9, cadd);
        ps.setString(10, padd);
        ps.setString(11, qual);
        ps.setString(12, eid);

        status = ps.executeUpdate();

        if(status > 0) {
%>

<script>
    alert("Employee Updated Successfully!");
    window.location = "view_employee.jsp";
</script>

<%
        } else {
%>

<script>
    alert("Update Failed! Employee not found.");
    window.history.back();
</script>

<%
        }

    } catch(Exception e) {
%>

<script>
    alert("Error: <%= e.getMessage() %>");
    window.history.back();
</script>

<%
    }
%>