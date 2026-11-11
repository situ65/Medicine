<%@ page import="java.sql.*" %>
<%@ include file="dbcon.jsp"%>

<%
String pid = "";
String cid = (String) session.getAttribute("cid");
String orderid = request.getParameter("orderid");

String ptype = request.getParameter("ptype");
String bname = request.getParameter("bname");
String cardno = request.getParameter("cardno");
String acno = request.getParameter("acno");
double amount = Double.parseDouble(request.getParameter("amount"));

try {

    // 🔥 Generate PID
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT MAX(CAST(SUBSTRING(pid,2) AS UNSIGNED)) FROM payment");

    int cnt = 0;
    if(rs.next()){
        cnt = rs.getInt(1);
    }

    cnt++;
    pid = String.format("P%05d", cnt);

    // 📅 Current Date
    java.sql.Date pdate = new java.sql.Date(System.currentTimeMillis());

    // ✅ Insert Payment
    PreparedStatement ps = con.prepareStatement(
        "INSERT INTO payment VALUES(?,?,?,?,?,?,?,?,?)"
    );

    ps.setString(1, pid);
    ps.setString(2, cid);
    ps.setString(3, orderid);
    ps.setString(4, ptype);
    ps.setString(5, bname);
    ps.setDate(6, pdate);
    ps.setString(7, cardno);
    ps.setString(8, acno);
    ps.setDouble(9, amount);

    ps.executeUpdate();

    // ✅ Update Order Status
    PreparedStatement ps2 = con.prepareStatement(
        "UPDATE orders SET paymentstatus='PAID', status='CONFIRMED' WHERE orderid=?"
    );

    ps2.setInt(1, Integer.parseInt(orderid));
    ps2.executeUpdate();

%>

<script>
alert("Payment Successful!");
window.location="customerhome.jsp";
</script>

<%
} catch(Exception e){
    out.print(e);
}
%>