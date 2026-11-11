<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Employee Menu</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
/* Sidebar */
.sidebar {
    width: 240px;
    min-height: 100vh;
    background: linear-gradient(180deg, #0f172a, #1e293b);
    color: white;
    padding-top: 20px;
    position: fixed;
}

/* Title */
.sidebar h2 {
    text-align: center;
    margin-bottom: 30px;
}

/* Menu */
.sidebar ul {
    list-style: none;
    padding: 0;
}

.sidebar ul li {
    margin: 10px 0;
}

/* Links */
.sidebar ul li a {
    display: flex;
    align-items: center;
    padding: 12px 20px;
    color: #e0e7ff;
    text-decoration: none;
    border-radius: 8px;
    transition: 0.3s;
}

/* Icons */
.sidebar ul li a i {
    margin-right: 10px;
}

/* Hover */
.sidebar ul li a:hover {
    background: rgba(255, 255, 255, 0.2);
    transform: translateX(5px);
}

/* Active */
.sidebar ul li a.active {
    background: white;
    color: #1e3a8a;
    font-weight: bold;
    margin-left: 10px;
    width: 180px;
}

/* Logout */
.logout a {
    color: #fecaca !important;
}
</style>

</head>

<body>

<!-- Sidebar -->
<div class="sidebar">

    <h2>Employee Panel</h2>

    <ul>
        <li>
            <a href="employee_dashboard.jsp">
                <i class="fas fa-home"></i> Dashboard
            </a>
        </li>

        <li>
            <a href="emp_user_orders.jsp">
                <i class="fas fa-shopping-cart"></i> Orders
            </a>
        </li>

        <li>
            <a href="emp_view_medicines.jsp">
                <i class="fas fa-pills"></i> View Medicines
            </a>
        </li>

        <li>
            <a href="emp_add_medicine.jsp">
                <i class="fas fa-plus-circle"></i> Add Medicine
            </a>
        </li>

        <li>
            <a href="emp_view_employee.jsp">
                <i class="fas fa-users"></i> Employees
            </a>
        </li>

        <li>
            <a href="employee_profile_view.jsp">
                <i class="fas fa-user-circle"></i> Profile
            </a>
        </li>

        <li class="logout">
            <a href="emp_logout.jsp">
                <i class="fas fa-sign-out-alt"></i> Logout
            </a>
        </li>
    </ul>

</div>
<script>

function preventBack(){
      window.history.forward();
    }
    setTimeout("preventBack()",0);
    window.onunload = function(){null};
</script>
</body>
</html>