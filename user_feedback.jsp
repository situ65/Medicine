<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Feedback</title>

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
    padding: 20px;
    min-height: calc(100vh - 80px);
    width: 1000px;
}

/* Topbar */
.topbar {
    background: white;
    padding: 15px 20px;
    border-radius: 10px;
    box-shadow: 0 5px 15px rgba(0,0,0,0.1);
}

.username {
    color: #2563eb;
    font-weight: bold;
}

/* Form Card */
.form-card {
    margin-top: 20px;
    background: white;
    padding: 25px;
    border-radius: 12px;
    box-shadow: 0 8px 20px rgba(0,0,0,0.1);
    width: 900px;
}

/* Form Elements */
input, textarea {
    width: 100%;
    padding: 10px;
    margin: 10px 0;
    border-radius: 6px;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

button {
    width: 100%;
    box-sizing: border-box;
    padding: 10px;
    background: #2563eb;
    color: white;
    border: none;
    border-radius: 20px;
    cursor: pointer;
}

button:hover {
    background: #1e40af;
}
</style>

</head>

<body>

<!-- Navbar & Sidebar -->
<jsp:include page="navbar.jsp"/>
<jsp:include page="usermenu.jsp"/>

<div class="container">

<!-- Main Content -->
<div class="main">

    <!-- Topbar -->
    <div class="topbar">
        <h2>
            Welcome, 
            <span class="username">
                <%
                    String username = (String) session.getAttribute("name");
                    if (username != null) {
                        out.print(username);
                    } else {
                        out.print("Customer");
                    }
                %>
            </span> 
            <span> - Feedback</span>
        </h2>
    </div>

    <!-- Feedback Form -->
    <div class="form-card">

        <h3><i style="color: #1e40af;" class="fas fa-comment-dots"></i> Submit Your Feedback</h3>

        <form action="user_feedback_action.jsp" method="post">

            <input type="text" name="name" placeholder="Enter Name" required>
            <input type="email" name="mail" placeholder="Enter Email" required>
            <input type="text" name="subj" placeholder="Subject" required>

            <textarea name="mesg" placeholder="Enter your feedback" rows="5" required></textarea>

            <button type="submit">Submit Feedback</button>

        </form>

    </div>

</div>

</div>

<!-- Footer -->
<jsp:include page="footer.jsp"/>

</body>
</html>