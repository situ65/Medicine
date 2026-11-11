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

        <h2><i class="fas fa-pills" style="color: #1e40af;"></i>Medicine Photo Uploaded Successfully</h2>



    </div>

</div>

</div>

<!-- Footer -->
<jsp:include page="footer.jsp"/>


</body>
</html>