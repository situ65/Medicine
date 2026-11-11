<%@ page import="java.sql.*" %>
<%@ include file="dbcon.jsp"%>

<%
    String id = request.getParameter("id");

    String name = request.getParameter("name");
    String company = request.getParameter("company");
    String medType = request.getParameter("medType");
    String category = request.getParameter("category");
    String desc = request.getParameter("desc");
    String packSize = request.getParameter("packSize");
    String pricePerPack = request.getParameter("pricePerPack");
    String stock = request.getParameter("stock");
    String pres = request.getParameter("pres");
    String exp = request.getParameter("exp");

    try {
        PreparedStatement ps = con.prepareStatement(
            "UPDATE medicines SET medicinename=?, companyname=?, medType=?, category=?, description=?, packSize=?, pricePerPack=?, stock=?, expirydate=? WHERE medicineid=?"
        );

        ps.setString(1, name);
        ps.setString(2, company);
        ps.setString(3, medType);
        ps.setString(4, category);
        ps.setString(5, desc);
        ps.setString(6, packSize);
        ps.setString(7, pricePerPack);
        ps.setString(8, stock);
        ps.setString(9, exp);
        ps.setString(10, id);

        int i = ps.executeUpdate();

        if(i > 0){
            session.removeAttribute("mid");
            session.setAttribute("mid", Integer.parseInt(id));
%>
<script>
    alert("Medicine Updated Successfully");
    window.location="admin_update_medicines_photo.jsp";
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

    } catch(Exception e){
        out.print(e);
    }
%>