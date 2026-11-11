<%@ page import="java.sql.*" %>
<%@ include file="dbcon.jsp" %>

<%
    String eid = request.getParameter("eid");

    int status1 = 0;
    int status2 = 0;

    try {

        // 1. Disable employee login (soft delete)
        PreparedStatement ps1 = con.prepareStatement(
            "UPDATE login SET status='N' WHERE cid=?"
        );
        ps1.setString(1, eid);
        status1 = ps1.executeUpdate();

        // 2. OPTIONAL: You can also mark employee inactive logically (if needed later)
        // Example: add column "active" in employee table (not required now)

        if(status1 > 0) {
%>

<script>
    alert("Employee Deleted Successfully (Deactivated)!");
    window.location = "view_employee.jsp";
</script>

<%
        } else {
%>

<script>
    alert("Employee not found or already inactive!");
    window.location = "view_employee.jsp";
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