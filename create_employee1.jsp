<%@ page import="java.sql.*" %>
<%@ include file="dbcon.jsp"%>

<%
String name = request.getParameter("name");
String fname = request.getParameter("fname");
String dob = request.getParameter("dob");

java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
String doj = sdf.format(new java.util.Date());

String gender = request.getParameter("gender");
String mstatus = request.getParameter("mstatus");
String phone = request.getParameter("phone");
String mail = request.getParameter("mail");
String cadd = request.getParameter("cadd");
String padd = request.getParameter("padd");
String qual = request.getParameter("qual");

String pwd = request.getParameter("pwd");
String secques = request.getParameter("security_question");
String secans = request.getParameter("secans");
String type= "Employee";
String status= "Y";

String cid = "";

try {
    String maxQuery = "SELECT MAX(CAST(SUBSTRING(eid, 2) AS UNSIGNED)) FROM employee";
    Statement st = con.createStatement();
    ResultSet rsMax = st.executeQuery(maxQuery);

    int cnt = 0;
    if (rsMax.next()) {
        cnt = rsMax.getInt(1);
    }

    cnt++;

    cid = String.format("E%05d", cnt); // cleaner formatting

    rsMax.close();
    st.close();

PreparedStatement ps = con.prepareStatement(
        "INSERT INTO employee VALUES(?,?,?,?,?,?,?,?,?,?,?,?)"
    );

    ps.setString(1, cid);
    ps.setString(2, name);
    ps.setString(3, fname);
    ps.setString(4, dob);
    ps.setString(5, doj);
    ps.setString(6, gender);
    ps.setString(7, mstatus);
    ps.setString(8, phone);
    ps.setString(9, mail);
    ps.setString(10, cadd);
    ps.setString(11, padd);
    ps.setString(12, qual);

    int i1 = ps.executeUpdate();

    PreparedStatement ps1 = con.prepareStatement(
        "INSERT INTO login VALUES(?,?,?,?,?,?,?)"
    );

    ps1.setString(1, cid);
    ps1.setString(2, mail);
    ps1.setString(3, pwd);
    ps1.setString(4, type);
    ps1.setString(5, status);
    ps1.setString(6, secques);
    ps1.setString(7, secans);

    int i2 = ps1.executeUpdate();

    if(i1 > 0 && i2 >0){
%>
<script>
alert("Employee Added Successfully");
window.location="adminhome.jsp";
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