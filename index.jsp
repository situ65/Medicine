<!-- index.jsp -->

<!DOCTYPE html>

<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MediCare</title>

<script src="https://cdn.tailwindcss.com"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
body {
    margin: 0;
    font-family: 'Segoe UI', sans-serif;
}

/* Hero Background */
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

/* Cards */
.card {
    background: white;
    border-radius: 12px;
    padding: 25px;
    box-shadow: 0 10px 25px rgba(0,0,0,0.1);
    transition: 0.3s;
}

.card:hover {
    transform: translateY(-8px);
}

/* Section background */
.section-bg {
    background: #f3f4f6;
}
</style>

</head>

<body>

<!-- Navbar -->

<jsp:include page="navbar.jsp" />

<!-- Hero Section -->

<section class="hero">
    <div class="hero-overlay">
        <h1 class="text-4xl md:text-5xl font-bold mb-4">
            Order Medicines Online Easily
        </h1>
        <p class="mb-6 text-lg">
            Fast delivery, trusted pharmacies & healthcare at your fingertips
        </p>

    <!-- Search -->
    <div class="bg-white rounded-full flex overflow-hidden w-2/3 max-w-xl">
        <input type="text" placeholder="Search medicines..." class="flex-grow px-4 py-2 outline-none">
        <button class="bg-blue-600 text-white px-6">Search</button>
    </div>
</div>


</section>

<!-- About Section -->

<section class="section-bg py-16 px-6">
    <div class="max-w-6xl mx-auto grid md:grid-cols-2 gap-10">


    <div class="card">
        <h2 class="text-3xl font-bold mb-4">Welcome to MediCare</h2>
        <p class="text-gray-600 mb-4">
            MediCare simplifies your healthcare experience by providing an easy way to order medicines online,
            book lab tests, and consult doctors from home.
        </p>

        <h3 class="text-xl font-semibold mt-4 mb-2">Why Choose Us?</h3>
        <p class="text-gray-600">
            Secure ordering, fast delivery, verified pharmacies, and a seamless experience for all users.
        </p>
    </div>

    <div class="card flex items-center justify-center">
        <img src="images/back5.jpg" alt="medicine" class="rounded-lg">
    </div>

</div>


</section>

<!-- Services -->

<section class="py-16 px-6 text-center">
    <h2 class="text-3xl font-bold mb-10">Our Services</h2>


<div class="grid md:grid-cols-3 gap-6 max-w-6xl mx-auto">

    <div class="card">
        <i class="fas fa-pills text-3xl text-blue-600 mb-3"></i>
        <h3 class="font-semibold">Medicines</h3>
        <p>Order medicines easily</p>
    </div>

    <!-- <div class="card">
        <i class="fas fa-vials text-3xl text-blue-600 mb-3"></i>
        <h3 class="font-semibold">Lab Tests</h3>
        <p>Book pathology tests</p>
    </div> -->

    <div class="card">
        <i class="fas fa-user-md text-3xl text-blue-600 mb-3"></i>
        <h3 class="font-semibold">Doctors</h3>
        <p>Consult specialists</p>
    </div>

    <div class="card">
        <i class="fas fa-shopping-cart text-3xl text-blue-600 mb-3"></i>
        <h3 class="font-semibold">Orders</h3>
        <p>Track your orders</p>
    </div>

</div>


</section>

<!-- Brands / Trusted

<section class="bg-gradient-to-r from-teal-400 to-blue-500 py-16 text-white text-center">
    <h2 class="text-3xl font-bold mb-4">Our Trusted Pharmacies</h2>
    <p class="mb-10">We partner with top healthcare providers</p>


<div class="flex justify-center gap-6 flex-wrap">
    <div class="bg-white p-4 rounded shadow text-black">Apollo</div>
    <div class="bg-white p-4 rounded shadow text-black">1mg</div>
    <div class="bg-white p-4 rounded shadow text-black">MedPlus</div>
    <div class="bg-white p-4 rounded shadow text-black">PharmEasy</div>
</div> -->


</section>

<!-- Footer -->

<jsp:include page="ofooter.jsp" />

</body>
</html>
