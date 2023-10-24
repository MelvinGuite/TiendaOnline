
document.addEventListener("DOMContentLoaded", function () {
    const carousel = document.querySelector(".carousel");
    const images = carousel.querySelectorAll("li");
    const prevBtn = document.getElementById("prevBtn");
    const nextBtn = document.getElementById("nextBtn");
    let currentIndex = 0;

    // Función para mostrar la imagen actual
    function showImage(index) {
        images.forEach((image, i) => {
            if (i === index) {
                image.style.display = "block";
            } else {
                image.style.display = "none";
            }
        });
    }

    // Función para avanzar al siguiente índice
    function nextImage() {
        currentIndex = (currentIndex + 1) % images.length;
        showImage(currentIndex);
    }

    // Función para retroceder al índice anterior
    function prevImage() {
        currentIndex = (currentIndex - 1 + images.length) % images.length;
        showImage(currentIndex);
    }

    // Mostrar la primera imagen al cargar la página
    showImage(currentIndex);

    // Manejar el botón "Anterior"
    prevBtn.addEventListener("click", prevImage);

    // Manejar el botón "Siguiente"
    nextBtn.addEventListener("click", nextImage);

    // Automatizar el cambio de imágenes cada 3 segundos
    setInterval(nextImage, 3000);
});
