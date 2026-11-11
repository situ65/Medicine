<%@ page import="java.sql.*" %>
<%@ include file="dbcon.jsp"%>

<%
    String eid = (String) session.getAttribute("cid"); // logged-in admin ID

    String name = request.getParameter("name");
    String dob = request.getParameter("dob");
    String gender = request.getParameter("gender");
    String mstatus = request.getParameter("mstatus");
    String phone = request.getParameter("phone");

    try {
        PreparedStatement ps = con.prepareStatement(
            "UPDATE customer SET name=?, phone=?, dob=?, gender=?, mstatus=? WHERE cid=?"
        );

        ps.setString(1, name);
        ps.setString(2, phone);
        ps.setString(3, dob);
        ps.setString(4, gender);
        ps.setString(5, mstatus);
        ps.setString(6, eid);

        int i = ps.executeUpdate();

        if(i > 0){
%>
            <script>
                alert("Profile Updated Successfully");
                window.location="cost_profile_view.jsp";
            </script>
<%
        } else {
%>
            <script>
                alert("Update Failed");
                history.back();
            </script>
<%
        }

    } catch(Exception e) {
        out.print(e);
    }
%>