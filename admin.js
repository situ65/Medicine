function showSection(sectionId) {
    let sections = document.querySelectorAll(".section");
    sections.forEach(section => {
        section.classList.add("hidden");
    });

    document.getElementById(sectionId).classList.remove("hidden");
}

function logout() {
    alert("Logging out...");
    window.location.href = "index.jsp";
}