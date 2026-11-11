<!DOCTYPE html>
<html>
<head>
<title>Logout Confirmation</title>

<style>
body {
    font-family: Arial;
    background: #f4f6f9;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

.box {
    background: white;
    padding: 40px;
    border-radius: 10px;
    text-align: center;
    box-shadow: 0 5px 20px rgba(0,0,0,0.2);
}

button {
    padding: 10px 20px;
    margin: 10px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

.yes {
    background: #dc3545;
    color: white;
}

.no {
    background: #28a745;
    color: white;
}
</style>

</head>

<body>

<div class="box">
    <h2>Are you sure you want to logout?</h2>

    <form action="employee_logout_action.jsp" method="post" style="display:inline;">
        <button class="yes">Yes</button>
    </form>

    <a href="employee_dashboard.jsp">
        <button class="no">No</button>
    </a>
</div>

</body>
</html>