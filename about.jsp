<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>About - MediCare</title>

<script src="https://cdn.tailwindcss.com"></script>

<style>
body {
    font-family: 'Segoe UI', sans-serif;
}

/* Section background */
.section-bg {
    background: #f3f4f6;
}

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

/* Row layout */
.row {
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin-bottom: 60px;
    gap: 40px;
}

/* Card */
.card {
    display: flex;
    align-items: center;
    gap: 25px;
    background: white;
    border-radius: 15px;
    padding: 20px;
    width: 48%;
    box-shadow: 0 10px 25px rgba(0,0,0,0.1);
    transition: 0.3s;
}

.card:hover {
    transform: translateY(-6px);
}

/* Image */
.card img {
    width: 150px;
    height: 150px;
    object-fit: cover;
    border-radius: 10px;
}

/* Text */
.card-content h2 {
    margin-bottom: 8px;
    font-size: 22px;
}

.card-content p {
    color: #555;
    font-size: 14px;
}

/* Spacer */
.spacer {
    width: 48%;
}
</style>

</head>

<body>

<!-- Navbar -->
<jsp:include page="navbar.jsp" />

<!-- Hero -->
<section class="hero">
  <div class="hero-overlay">
            <h1 class="text-4xl md:text-5xl font-bold mb-4">
About MediCare</h1>
    <p class="mb-6 text-lg">Your trusted partner for online healthcare services</p>
  </div>
</section>

<!-- Zig-Zag Section -->
<section class="section-bg py-16 px-6">

    <div class="max-w-6xl mx-auto">

        <div class="max-w-6xl mx-auto">

        <!-- Row 1 (Left) -->
        <div class="row">
            <div class="card">
                <img src="images/back1.jpg">
                <div class="card-content">
                    <h2>Who We Are</h2>
                    <p>
                        MediCare connects users with trusted pharmacies.
                        We provide a secure and easy way to order medicines online
                        with fast delivery and reliable service.
                    </p>
                </div>
            </div>
            <div class="spacer"></div>
        </div>

        <!-- Row 2 (Right) -->
        <div class="row">
            <div class="spacer"></div>
            <div class="card">
                <img src="images/back3.jpg">
                <div class="card-content">
                    <h2>What We Do</h2>
                    <p>
                        We offer medicine ordering, delivery tracking,
                        and healthcare support. Our system ensures genuine
                        products and smooth user experience.
                    </p>
                </div>
            </div>
        </div>

        <!-- Row 3 (Left) -->
        <div class="row">
            <div class="card">
                <img src="images/back4.jpg">
                <div class="card-content">
                    <h2>Our Mission</h2>
                    <p>
                        Our mission is to simplify healthcare access.
                        We aim to provide affordable, fast, and trusted
                        services to improve everyday lives.
                    </p>
                </div>
            </div>
            <div class="spacer"></div>
        </div>

    </div>

</section>

<!-- Footer -->
<jsp:include page="ofooter.jsp" />

</body>
</html>