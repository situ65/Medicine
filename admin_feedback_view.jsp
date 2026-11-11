<%@ page import="java.sql.*" %>
<%@ include file="dbcon.jsp"%>

<%
String selectedCustomer = request.getParameter("name");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Feedback List</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
body { margin:0; font-family:'Segoe UI'; background:#f1f5f9; }

.container { display:flex; }

.main {
    margin-left:240px;
    padding:20px;
    width:1000px;
}

.topbar {
    background:white;
    padding:15px;
    border-radius:10px;
    box-shadow:0 5px 15px rgba(0,0,0,0.1);
    margin-bottom:20px;
}

table {
    width:100%;
    border-collapse:collapse;
    background:white;
    border-radius:10px;
}

th, td { padding:12px; }

th { background:#2563eb; color:white; }

tr:nth-child(even) { background:#f9fafb; }

/* Filter */
.filter-box {
    margin-bottom: 15px;
}

select, button {
    padding: 8px;
    border-radius: 5px;
    border: 1px solid #ccc;
}

button {
    background:#2563eb;
    color:white;
    cursor:pointer;
}
</style>
</head>

<body>

<jsp:include page="navbar.jsp"/>
<jsp:include page="adminmenu.jsp"/>

<div class="container">
<div class="main">

<div class="topbar">
    <h2><i class="fas fa-comment-dots" style="color: #2563eb;"></i> User Feedback</h2>
</div>

<!-- 🔽 FILTER SECTION -->
<div class="filter-box">
<form method="get">

    <label><b>Select Customer:</b></label>

    <select name="name">
        <option value="">-- All Customers --</option>

        <%
        try {
            Statement st1 = con.createStatement();
            ResultSet rs1 = st1.executeQuery("SELECT name FROM customer");

            while(rs1.next()){
                String n = rs1.getString("name");
        %>
        <option value="<%= n %>" <%= n.equals(selectedCustomer) ? "selected" : "" %>>
            <%= n %>
        </option>
        <%
            }
        } catch(Exception e){
            out.print(e);
        }
        %>

    </select>

    <button type="submit">View</button>

</form>
</div>

<!-- 🔽 TABLE -->
<table>
<tr>
    <th>Name</th>
    <th>Email</th>
    <th>Subject</th>
    <th>Date</th>
    <th>Feedback</th>
</tr>

<%
try {
    PreparedStatement ps;

    if(selectedCustomer != null && !selectedCustomer.equals("")){
        ps = con.prepareStatement("SELECT * FROM feedback WHERE name=? ORDER BY dof DESC");
        ps.setString(1, selectedCustomer);
    } else {
        ps = con.prepareStatement("SELECT * FROM feedback ORDER BY dof DESC");
    }

    ResultSet rs = ps.executeQuery();

    boolean hasData = false;   // ✅ flag

    while(rs.next()){
        hasData = true;
%>
<tr>
    <td><%= rs.getString("name") %></td>
    <td><%= rs.getString("mail") %></td>
    <td><%= rs.getString("subj") %></td>
    <td><%= rs.getString("dof") %></td>
    <td><%= rs.getString("mesg") %></td>
</tr>
<%
    }

    // ✅ If no data found
    if(!hasData){
%>
<tr>
    <td colspan="5" style="text-align:center; color:rgb(108, 104, 104); font-weight:bold;">
        No feedback given
    </td>
</tr>
<%
    }

} catch(Exception e){
    out.print(e);
}
%>
</table>

</div>
</div>

<jsp:include page="footer.jsp"/>

</body>
</html>