<%@ page import="java.sql.*" %>
<%@ include file="dbcon.jsp"%>

<%
    String eid = (String) session.getAttribute("cid"); // logged-in admin ID

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
    out.print(name);
    try {
        PreparedStatement ps = con.prepareStatement(
"UPDATE admin SET name=?, fname=?, dob=?, doj=?, gender=?, mstatus=?, phone=?, mail=?, cadd=?, padd=?, qual=? WHERE eid=?"
        );

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

        int i = ps.executeUpdate();

        ps = con.prepareStatement(
"UPDATE employee SET name=?, fname=?, dob=?, doj=?, gender=?, mstatus=?, phone=?, mail=?, cadd=?, padd=?, qual=? WHERE eid=?"
        );

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

        i = ps.executeUpdate();

        if(i > 0){
%>
            <script>
                alert("Profile Updated Successfully");
                window.location="admin_profile_view.jsp";
            </script>
<%
        } else {
%>
            <script>
                alert("Update Failed");
//                history.back();
            </script>
<%
        }

    } catch(Exception e) {
        out.print(e);
    }
%>