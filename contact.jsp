<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Contact - MediCare</title>

<script src="https://cdn.tailwindcss.com"></script>

<style>
body {
    font-family: 'Segoe UI', sans-serif;
}

/* Hero */
.hero {
    background: url('images/back2.jpg') no-repeat center center/cover;
    height: 400px;
    position: relative;
}

.hero-overlay {
    background: rgba(56, 55, 55, 0.333);
    height: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;
    text-align: center;
    color: white;
}

/* Cards row */
.cards-container {
    display: flex;
    justify-content: center;
    gap: 25px;
    flex-wrap: wrap;
}

/* Card */
.card {
    width: 380px;
    background: white;
    border-radius: 15px;
    padding: 20px;
    box-shadow: 0 10px 25px rgba(0,0,0,0.1);
    transition: 0.3s;
    text-align: left;
    padding-top: 50px;
    padding-bottom: 50px;
}

.card:hover {
    transform: translateY(-6px);
}

/* Text */
.card-content h2 {
    margin-bottom: 10px;
    font-size: 35px;
    font-weight: bold;
    color: #111;
}

.card-content p {
    color: #555;
    font-size: 20px;
    margin-bottom: 5px;
}
</style>

</head>

<body>

<!-- Navbar -->
<jsp:include page="navbar.jsp" />

<!-- Hero -->
<section class="hero">
  <div class="hero-overlay">
    <h1 class="text-4xl font-bold mb-4">Contact MediCare</h1>
    <p class="text-lg">We are here to help you anytime</p>
  </div>
</section>

<!-- Contact Section -->
<section class="bg-gray-100 py-16 px-6">

<div class="max-w-10xl mx-auto">

    <div class="cards-container">

        <!-- Card 1 -->
        <div class="card">
            <div class="card-content">
                <h2>Customer Support</h2>
                <p>Have questions about orders or medicines? Our support team is always ready to assist you.</p>
                <p><b>Email:</b> support@medicare.com</p>
                <p><b>Phone:</b> +91 98765 43210</p>
            </div>
        </div>

        <!-- Card 2 -->
        <div class="card">
            <div class="card-content">
                <h2>Visit Us</h2>
                <p>We ensure a welcoming environment for all customers and partners.</p>
                <p><b>Address:</b> Salt Lake, Kolkata</p>
                <p><b>Time:</b> 9 AM - 8 PM</p>
            </div>
        </div>

        <!-- Card 3 -->
        <div class="card">
            <div class="card-content">
                <h2>Connect With Us</h2>
                <p>Stay connected with MediCare for updates and offers.</p>
                <p><b>Instagram:</b> @medicare</p>
                <p><b>Facebook:</b> /medicare</p>
            </div>
        </div>

    </div>

</div>

</section>

<!-- Footer -->
<jsp:include page="ofooter.jsp" />

</body>
</html>