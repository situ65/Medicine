function shopNow() {
    alert("Redirecting to medicines page...");
}

function searchMedicine() {
    let searchValue = document.getElementById("searchBox").value;
    
    if(searchValue === "") {
        alert("Please enter medicine name");
    } else {
        alert("Searching for: " + searchValue);
    }
}

// Hero Image Slider
let images = [
    "./images/back1.jpg",
    "./images/back2.jpg",
    "./images/back3.jpg",
    "./images/back4.jpg"
];

let index = 0;

function changeHeroImage() {
    index++;
    if (index >= images.length) {
        index = 0;
    }
    document.getElementById("heroSlider").src = images[index];
}

// change every 5 seconds
setInterval(changeHeroImage, 5000);