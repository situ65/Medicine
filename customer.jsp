<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Customer Home</title>
<link rel="stylesheet" href="customer.css">
</head>
<body>

<!-- Header -->
<header>
    <div class="logo">MediCare</div>
    <nav>
        <ul>
            <li>Home</li>
            <li>My Orders</li>
            <li>Cart</li>
            <li onclick="logout()">Logout</li>
        </ul>
    </nav>
</header>

<!-- Search -->
<section class="search-section">
    <input type="text" placeholder="Search medicines..." id="searchBox">
    <button onclick="searchMedicine()">Search</button>
</section>


<!-- Medicines -->
<section class="products">

    <div class="product-card">
        <img src="./images/med/para.jpg">
        <h3>Paracetamol</h3>
        <p>Rs. 50</p>
        <button onclick="addToCart('Paracetamol')">Add to Cart</button>
    </div>

    <div class="product-card">
        <img src="./images/med/cough.jpg">
        <h3>Cough Syrup</h3>
        <p>Rs. 120</p>
        <button onclick="addToCart('Cough Syrup')">Add to Cart</button>
    </div>

    <div class="product-card">
        <img src="./images/med/vita.jpg ">
        <h3>Vitamin Tablets</h3>
        <p>Rs. 200</p>
        <button onclick="addToCart('Vitamin Tablets')">Add to Cart</button>
    </div>

    <div class="product-card">
        <img src="./images/med/iron.webp">
        <h3>Iron Tablets</h3>
        <p>Rs. 400</p>
        <button onclick="addToCart('Vitamin Tablets')">Add to Cart</button>
    </div>

    <div class="product-card">
        <img src="./images/med/kids.jpg">
        <h3>Kids Chewable Tablets</h3>
        <p>Rs. 1200</p>
        <button onclick="addToCart('Vitamin Tablets')">Add to Cart</button>
    </div>
</section>

<!-- Medicines -->
<section class="products">

    <div class="product-card">
        <img src="./images/med/para.jpg">
        <h3>Paracetamol</h3>
        <p>Rs. 50</p>
        <button onclick="addToCart('Paracetamol')">Add to Cart</button>
    </div>

    <div class="product-card">
        <img src="./images/med/cough.jpg">
        <h3>Cough Syrup</h3>
        <p>Rs. 120</p>
        <button onclick="addToCart('Cough Syrup')">Add to Cart</button>
    </div>

    <div class="product-card">
        <img src="./images/med/vita.jpg ">
        <h3>Vitamin Tablets</h3>
        <p>Rs. 200</p>
        <button onclick="addToCart('Vitamin Tablets')">Add to Cart</button>
    </div>

    <div class="product-card">
        <img src="./images/med/iron.webp">
        <h3>Iron Tablets</h3>
        <p>Rs. 400</p>
        <button onclick="addToCart('Vitamin Tablets')">Add to Cart</button>
    </div>

    <div class="product-card">
        <img src="./images/med/kids.jpg">
        <h3>Kids Chewable Tablets</h3>
        <p>Rs. 1200</p>
        <button onclick="addToCart('Vitamin Tablets')">Add to Cart</button>
    </div>
</section>

<!-- Footer -->
 <jsp:include page="footer.jsp"></jsp:include>

<script src="customer.js"></script>
</body>
</html>