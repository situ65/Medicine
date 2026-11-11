function addToCart(medicine) {
    alert(medicine + " added to cart");
}

function searchMedicine() {
    let value = document.getElementById("searchBox").value;
    alert("Searching for: " + value);
}

function logout() {
    window.location.href = "index.jsp";
}