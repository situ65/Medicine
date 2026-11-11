<!DOCTYPE html>

<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin Dashboard</title>

    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
    />

    <style>
      /* Sidebar */
      .sidebar {
    width: 240px;
    min-height: 100vh;
    background: linear-gradient(180deg, #0f172a, #1e293b); /* DARKER */
    color: white;
    padding-top: 20px;
    position: fixed;
}

      .sidebar h2 {
        text-align: center;
        margin-bottom: 30px;
      }

      .sidebar ul {
        list-style: none;
        padding: 0;
      }

      .sidebar ul li {
        margin: 10px 0;
      }

      .sidebar ul li a {
        display: flex;
        align-items: center;
        padding: 12px 20px;
        color: #e0e7ff;
        text-decoration: none;
        border-radius: 8px;
        transition: 0.3s;
      }

      .sidebar ul li a i {
        margin-right: 10px;
      }

      .sidebar ul li a:hover {
        background: rgba(255, 255, 255, 0.2);
        transform: translateX(5px);
      }

      .sidebar ul li a.active {
        background: white;
        color: #1e3a8a;
        font-weight: bold;
        margin-left: 10px;
        width: 180px;
      }

      .logout a {
        color: #fecaca !important;
      }
    </style>
  </head>
  <body>
    <!-- Sidebar -->
    <div class="sidebar">
      <h2>Admin Panel</h2>

      <ul>
        <li><a href="adminhome.jsp"><i class="fas fa-home"></i> Dashboard</a></li>
<li><a href="admin_user_orders.jsp"><i class="fas fa-shopping-cart"></i> Orders</a></li>
<li><a href="admin_view_medicines.jsp"><i class="fas fa-pills"></i> Medicines</a></li>
<li><a href="create_employee.jsp"><i class="fas fa-user-plus"></i> Employee</a></li>
<li><a href="admin_users.jsp"><i class="fas fa-users"></i> Users</a></li>
<li>
    <a href="admin_feedback_view.jsp">
        <i class="fas fa-comment-dots"></i> Feedback
    </a>
</li>
<li><a href="admin_profile_view.jsp"><i class="fas fa-user-circle"></i> Profile</a></li>
<li><a href="admin_password.jsp"><i class="fas fa-user-circle"></i> Password</a></li>
<li class="logout"><a href="admin_logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
      </ul>
    </div>

    <script>function preventBack(){
      window.history.forward();
    }
    setTimeout("preventBack()",0);
    window.onunload = function(){null};</script>
  </body>
</html>
