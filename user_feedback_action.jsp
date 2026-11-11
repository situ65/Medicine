<%@ page import="java.sql.*" %>
<%@ include file="dbcon.jsp"%>

<%
String feid = "";
String name = request.getParameter("name");
String mail = request.getParameter("mail");
String subj = request.getParameter("subj");
String mesg = request.getParameter("mesg");

try {

    // ✅ Generate FEEDBACK ID
    String query = "SELECT MAX(CAST(SUBSTRING(feid,2) AS UNSIGNED)) FROM feedback";
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery(query);

    int cnt = 0;
    if(rs.next()){
        cnt = rs.getInt(1);
    }

    cnt++;
    feid = String.format("F%05d", cnt);

    rs.close();
    st.close();

    // ✅ Today's Date
    java.sql.Date dof = new java.sql.Date(System.currentTimeMillis());

    // ✅ Insert Query
    PreparedStatement ps = con.prepareStatement(
        "INSERT INTO feedback VALUES(?,?,?,?,?,?)"
    );

    ps.setString(1, feid);
    ps.setString(2, name);
    ps.setString(3, mail);
    ps.setString(4, subj);
    ps.setString(5, mesg);
    ps.setDate(6, dof);

    int i = ps.executeUpdate();

    if(i > 0){
%>
<script>
alert("Feedback Submitted Successfully!");
window.location="user_feedback.jsp";
</script>
<%
    } else {
%>
<script>
alert("Failed to Submit Feedback");
history.back();
</script>
<%
    }

} catch(Exception e){
    out.print(e);
}
%>