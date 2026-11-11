<!-- navbar.html -->

<!DOCTYPE html>

<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title>Navbar</title>

    <style>
      body {
        margin: 0;
        font-family: "Segoe UI", sans-serif;
      }

      /* Navbar container */
      .navbar {
        display: flex;
        justify-content: space-between;
        align-items: center;
        background: #1e3a8a;
        padding: 12px 40px;
    position: sticky;
    top: 0;
    z-index: 1000;
      }

      /* Logo */
      .logo {
        color: #fff;
        font-size: 22px;
        font-weight: bold;
      }

      /* Menu */
      .nav-links {
        list-style: none;
        display: flex;
        margin: 0;
      }

      .nav-links li {
        margin-left: 25px;
      }

      .nav-links a {
        text-decoration: none;
        color: #fff;
        font-size: 15px;
        transition: 0.3s;
        padding: 6px 10px;
        border-radius: 6px;
      }

      /* Hover effect */
      .nav-links a:hover {
        background: #3b82f6;
      }

      /* Buttons style for login/signup */
      .btn {
        background: #3b82f6;
      }

      .btn:hover {
        background: #2563eb;
      }

      /* Mobile Responsive */
      @media (max-width: 768px) {
        .navbar {
          flex-direction: column;
          align-items: flex-start;
        }

        .nav-links {
          flex-direction: column;
          width: 100%;
        }

        .nav-links li {
          margin: 10px 0;
        }
      }
    </style>
  </head>

  <body>
    <nav class="navbar">
      <div class="logo">MediCare</div>

      <ul class="nav-links">
        <li><a href="index.jsp">Home</a></li>
        <li><a href="about.jsp">About</a></li>
        <li><a href="contact.jsp">Contact</a></li>
        <li><a href="medicines.jsp">Medicines</a></li>
        <li><a href="login.jsp" class="btn">Login</a></li>
        <li><a href="signup.jsp" class="btn">Signup</a></li>
      </ul>
    </nav>

    <script>
      function preventBack(){
      window.history.forward();
    }
    setTimeout("preventBack()",0);
    window.onunload = function(){null};
    </script>
  </body>
</html>
