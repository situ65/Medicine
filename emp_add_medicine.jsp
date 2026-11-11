<%@ page import="java.sql.*" %>
<%@ include file="dbcon.jsp"%>

<%
    String msg = "";

    if(request.getMethod().equalsIgnoreCase("POST")){

        String name = request.getParameter("name");
        String company = request.getParameter("company");
        String medType = request.getParameter("medType");
        String category = request.getParameter("category");
        String desc = request.getParameter("desc");
        String packSize = request.getParameter("packSize");
        String pricePerPack = request.getParameter("pricePerPack");
        String stock = request.getParameter("stock");
        String exp = request.getParameter("exp");

        try {
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO medicines(medicinename, companyname, medType, category, description, packSize, pricePerPack, stock, expirydate) VALUES (?,?,?,?,?,?,?,?, ?)", 
                Statement.RETURN_GENERATED_KEYS);

            ps.setString(1, name);
            ps.setString(2, company);
            ps.setString(3, medType);
            ps.setString(4, category);
            ps.setString(5, desc);
            ps.setString(6, packSize);
            ps.setString(7, pricePerPack);
            ps.setString(8, stock);
            ps.setString(9, exp);

            int i = ps.executeUpdate();
            
            if(i > 0){
                ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    int generatedId = rs.getInt(1);
                    session.removeAttribute("mid");
                    session.setAttribute("mid",generatedId);
                }
%>
<script>
    alert("Medicine Added Successfully");
    window.location="emp_add_medicine_photo.jsp";
</script>
<%
            } else {
                msg = "Insertion Failed!";
            }

        } catch(Exception e){
            out.print(e);
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Add Medicine</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
body {
    margin: 0;
    font-family: 'Segoe UI', sans-serif;
    background: #f1f5f9;
}

/* Layout */
.container {
    display: flex;
}

/* Main */
.main {
    margin-left: 240px;
    margin-top: 70px;
    padding: 20px;
    width: calc(100% - 240px);
}

/* Card */
.card {
    background: white;
    padding: 25px;
    border-radius: 12px;
    box-shadow: 0 8px 20px rgba(0,0,0,0.1);
}

/* Table */
table {
    width: 100%;
}

td {
    padding: 10px;
}

td:first-child {
    font-weight: bold;
    width: 30%;
}

/* Inputs */
input, select, textarea {
    width: 100%;
    padding: 10px;
    border-radius: 6px;
    border: 1px solid #ccc;
}

/* Button */
.btn {
    padding: 10px 20px;
    background: #2563eb;
    color: white;
    border: none;
    border-radius: 8px;
    cursor: pointer;
}

.btn:hover {
    background: #1e40af;
}
</style>

</head>

<body>

<!-- Navbar & Sidebar -->
<jsp:include page="navbar.jsp"/>
<jsp:include page="employeemenus.jsp"/>

<div class="container">

<div class="main">

    <div class="card">

        <h2><i class="fas fa-pills" style="color: #1e40af;"></i> Add Medicine</h2>

        <form method="post" onsubmit="return validateMedicineForm()">

            <table>

                <tr>
                    <td>Medicine Name</td>
                    <td><input type="text" name="name" required></td>
                </tr>

                <tr>
                    <td>Company</td>
                    <td><input type="text" name="company"></td>
                </tr>

                <tr>
                    <td>Medicine Type</td>
                    <td>
                        <select name="medType">
                            <option value="pill">Pill</option>
                            <option value="syrup">Syrup</option>
                            <option value="injection">Injection</option>
                            <option value="powder">Powder</option>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td>Category</td>
                    <td><input type="text" name="category"></td>
                </tr>

                <tr>
                    <td>Description</td>
                    <td><textarea name="desc"></textarea></td>
                </tr>

                <tr>
                    <td>No. of Medicines per Pack</td>
                    <td><input type="number" step="1" name="packSize" required></td>
                </tr>

                <tr>
                    <td>Price/Pack</td>
                    <td><input type="number" step="0.01" name="pricePerPack" required></td>
                </tr>

                <tr>
                    <td>Stock</td>
                    <td><input type="number" name="stock" required></td>
                </tr>

                <tr>
                    <td>Expiry Date</td>
                    <td><input type="date" name="exp"></td>
                </tr>

                <tr>
                    <td colspan="2" align="center">
                        <button class="btn">
                            <i class="fas fa-plus"></i> Add Medicine
                        </button>
                    </td>
                </tr>

            </table>

        </form>

    </div>

</div>

</div>

<!-- Footer -->
<jsp:include page="footer.jsp"/>

<script>
function validateMedicineForm(){

    let name = document.getElementsByName("name")[0].value.trim();
    let company = document.getElementsByName("company")[0].value.trim();
    let category = document.getElementsByName("category")[0].value.trim();
    let desc = document.getElementsByName("desc")[0].value.trim();
    let packSize = document.getElementsByName("packSize")[0].value;
    let price = document.getElementsByName("pricePerPack")[0].value;
    let stock = document.getElementsByName("stock")[0].value;
    let exp = document.getElementsByName("exp")[0].value;

    // MEDICINE NAME
    if(name.length < 2){
        alert("Medicine name must be at least 2 characters");
        return false;
    }

    // COMPANY (optional but validate if filled)
    if(company !== "" && company.length < 2){
        alert("Company name must be at least 2 characters");
        return false;
    }

    // CATEGORY
    if(category !== "" && category.length < 3){
        alert("Category must be at least 3 characters");
        return false;
    }

    // DESCRIPTION
    if(desc !== "" && desc.length < 5){
        alert("Description must be at least 5 characters");
        return false;
    }

    // PACK SIZE
    if(packSize <= 0){
        alert("Pack size must be greater than 0");
        return false;
    }

    // PRICE
    if(price <= 0){
        alert("Price must be greater than 0");
        return false;
    }

    // STOCK
    if(stock < 0){
        alert("Stock cannot be negative");
        return false;
    }

    // EXPIRY DATE (optional but must be future)
    if(exp !== ""){
        let today = new Date().toISOString().split("T")[0];
        if(exp <= today){
            alert("Expiry date must be a future date");
            return false;
        }
    }

    return true;
}
</script>

</body>
</html>