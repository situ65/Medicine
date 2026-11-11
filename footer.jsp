<!-- footer.html -->

<!DOCTYPE html>

<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title>Footer</title>

    <style>
      body {
        margin: 0;
        font-family: "Segoe UI", sans-serif;
      }

      /* Footer */
      .footer {
        margin-left: 240px;
        width: calc(100% - 240px);
        background: linear-gradient(135deg, #4f46e5, #4338ca);
        color: #ffffff;
        padding: 25px 40px 10px; 
      }

      /* Container */
      .footer-container {
        display: flex;
        justify-content: space-between;
        flex-wrap: wrap;
      }

      /* Sections */
      .footer-section {
        flex: 1;
        min-width: 250px;
        margin-bottom: 20px;
      }

      /* Headings */
      .footer-section h2 {
        margin-bottom: 8px;   
      }

      /* Links */
      .footer-section a {
        display: block;
        color: #e0e7ff;
        text-decoration: none;
        margin-bottom: 5px;
        transition: 0.3s;
      }

      .footer-section a:hover {
        color: #ffffff;
      }

      /* Divider */
      .footer-divider {
        border-top: 1px solid rgba(255, 255, 255, 0.2);
        margin: 30px 0;
      }

      /* Bottom text */
      .footer-bottom {
        text-align: center;
        font-size: 15px;
      }

      /* Responsive */
      @media (max-width: 768px) {
        .footer {
          padding: 40px 20px;
        }
        .footer-container {
          flex-direction: column;
        }
      }
    </style>
  </head>

  <body>
    <footer class="footer">
      <div class="footer-container">
        <!-- Left -->
        <div class="footer-section">
          <h2>MediCare</h2>
          <p>
            Your trusted platform for ordering medicines, booking lab tests, and
            healthcare services.
          </p>
        </div>

        <!-- Middle -->
        <div class="footer-section">
          <h2>Quick Links</h2>
          <a href="index.jsp">Home</a>
          <a href="about.jsp">About</a>
          <a href="contact.jsp">Contact</a>
        </div>

        <!-- Right -->
        <div class="footer-section">
          <h2>Contact</h2>
          <p>Email: support@medicare.com</p>
          <p>Phone: +91 9876543210</p>
          <p>Location: India</p>
        </div>
      </div>

      <div class="footer-divider"></div>

      <div class="footer-bottom">
        &copy; 2026 MediCare | Medicine Ordering System
      </div>
    </footer>
  </body>
</html>
