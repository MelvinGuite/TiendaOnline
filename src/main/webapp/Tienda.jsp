<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.List" %> 
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Tienda en L�nea</title>
<link rel="stylesheet"
    href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
<style>
/* Estilos generales */
body {
    font-family: 'Roboto', sans-serif;
    margin: 0;
    padding: 0;
    display: flex;
    position: relative;
    background-color: #f5f5f5;
    background-image: url('pantalla.jpg');
    background-size: cover;
    background-position: center;
    background-repeat: repeat;
    flex-direction: column; /* Cambiamos la direcci�n del flujo de contenido a columna */
}


/* Estilo del men� horizontal */
.navbar {
    background-color: #333;
    color: #fff;
    display: flex;
    justify-content: space-between;
    padding: 10px 20px;
    align-items: center;
}

.navbar a {
    text-decoration: none;
    color: #fff;
    font-weight: bold;
    margin-right: 20px;
    transition: color 0.3s;
}

.navbar a:hover {
    color: #00bcd4;
}

/* Estilos de las tarjetas */
.content {
    flex: 1;
    padding: 20px;
    display: flex;
    flex-wrap: wrap;
    justify-content: flex-start;
    align-content: flex-start; /* Alineamos las tarjetas en la parte superior */
}

/* Estilos de las tarjetas adaptados */
.card {
    width: calc(25% - 20px);
    background: linear-gradient(to bottom right, #00bcd4, #007c91);
    background: rgba(95, 8, 11, 0.8);
    color: #FFFF;
    border-radius: 5px;
    padding: 20px;
    margin-right: 10px; /* Agregar un margen derecho para separar las tarjetas horizontalmente */
    margin-bottom: 10px; /* Opcional: agregar un margen inferior para separar las tarjetas verticalmente */
    text-align: center;
    transition: transform 0.3s, box-shadow 0.3s, opacity 0.3s;
    cursor: pointer;
    transform: translateY(0);
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    opacity: 1;
}



.card:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
    opacity: 1; /* Reducimos la opacidad al pasar el cursor sobre la tarjeta */
}
.card h2 {
    font-size: 18px;
    margin-top: 10px;
}

/* Im�genes de las tarjetas */
.card img {
    width: 100%;
    height: 200px; /* Tama�o uniforme de las im�genes */
    object-fit: cover;
    border-radius: 5px;
}

body::before {
    content: "";
    background-image: url('pantalla.jpg'); /* Ruta de la imagen de fondo */
    filter: blur(10px); /* Ajusta el valor de blur seg�n lo desees */
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: -1; /* Coloca la capa detr�s del contenido */
    opacity: 0.7; /* Ajusta la opacidad seg�n tu preferencia */
}

</style>


<style type="text/css">
.carousel-container {
    width: 80%;
    margin: 0 auto;
    text-align: center;
}

.carousel {
    list-style: none;
    padding: 0;
    margin: 0;
    overflow: hidden;
}

.carousel li {
    display: none;
}

.carousel img {
    width: 100%; /* Hacer que todas las im�genes ocupen el 100% del contenedor */
    height: auto; /* Mantener la proporci�n de aspecto original */
}

button {
    margin-top: 10px;
}

.carousel-container {
    width: 80%;
    margin: 0 auto;
    text-align: center;
}

.carousel {
    list-style: none;
    padding: 0;
    margin: 0;
    overflow: hidden;
}

.carousel li {
    display: none;
}

.carousel img {
    max-width: 15%;
    height: auto;
}

button {
    margin-top: 10px;
}


</style>
<script src="https://kit.fontawesome.com/be42ec504e.js" crossorigin="anonymous"></script>
</head>
<body>
<!-- Men� Horizontal -->
<div class="navbar">
    <div>
        <a href="#">Inicio</a>
        <a href="#">Categor�a 1</a>
        <a href="#">Categor�a 2</a>
        <a href="#">Categor�a 3</a>
    </div>
    <div>
        <a href="#">Mi perfil</a>
        <a href="#">Configuraci�n</a>
        <a href="#">Ayuda y Soporte</a>
        <a href="#">Cerrar Sesi�n</a>
    </div>
</div>


<div class="carousel-container">
        <ul class="carousel">
            <li><iframe src="https://drive.google.com/file/d/1HuUpxrS5VuA5luUw0qJ6KiBczKy4T8Rl/preview" width="250" height="250"></iframe></li>
            <li><iframe src="https://drive.google.com/file/d/168ERW7_LA037fCTWipdi58Do5MdRs-qg/preview" width="250" height="250"></iframe></li>
            <li><iframe src="https://drive.google.com/file/d/1WHZYsJHjDbQe37fr_TdPvUsb2bjNo_QH/preview" width="250" height="250"></iframe></li>
            <!-- Agrega m�s im�genes aqu� -->
        </ul>
        <button id="prevBtn" hidden="true">Anterior</button>
        <button id="nextBtn" hidden="true">Siguiente</button>
    </div>
    
        
<%
Object objProducto = request.getAttribute("Productos");
List<String> lsProducto = null ;
if(objProducto != null ) {
	if (objProducto instanceof List) {
		lsProducto = (List<String>) objProducto;
	}
		%>
			<div class="content">
		<%
		for(int i = 0; i<lsProducto.size(); i += 7) {
			String ID = lsProducto.get(i);
			String NombreProducto = lsProducto.get(i + 1);
			String Descripcion = lsProducto.get(i + 2);
			String Precio = lsProducto.get(i + 3);
			String Marca = lsProducto.get(i + 4);
			String Inventario = lsProducto.get(i + 5);
			String url = lsProducto.get(i+ 6);
			%>
			<!-- Contenido de las tarjetas -->
	
		<div class="card" onclick="window.location.href='#';">
            <iframe src="<%=url%>" width="250" height="250"></iframe>
            <p>ID: <%=ID%></p>
            <h2>Producto: <%=NombreProducto%> </h2>
            <p>Descripci�n: <%=Descripcion %></p>
            <p>Marca: <%=Marca%></p>
            <p>Precio: Q<%=Precio%> </p>
            <p>Disponibles:<%=Inventario%> </p>
        </div>
        
		<%
		}
		%>
		
		</div>
		<%
		}
		%>



<form action="MostrarProducto" method="get">
<label>sino ves los productos, haz clic </label>
<button type="submit" name="ver" id="ver">aqui</button>
</form>

    <script>
        // Verifica si ya se ha realizado la acci�n
        var clic = localStorage.getItem('clic') === 'true';

        // Espera a que se cargue completamente la p�gina
        window.onload = function() {
            // Verifica si a�n no se ha hecho clic
            if (!clic) {
                // Encuentra el bot�n por su id
                var boton = document.getElementById('ver');

                // Simula un clic en el bot�n
                boton.click();

                // Marca que se ha hecho clic en el almacenamiento local
                localStorage.setItem('clic', 'true');
            }
        };
    </script>
    
<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function () {
    const carousel = document.querySelector(".carousel");
    const images = carousel.querySelectorAll("li");
    const prevBtn = document.getElementById("prevBtn");
    const nextBtn = document.getElementById("nextBtn");
    let currentIndex = 0;

    // Funci�n para mostrar la imagen actual
    function showImage(index) {
        images.forEach((image, i) => {
            if (i === index) {
                image.style.display = "block";
            } else {
                image.style.display = "none";
            }
        });
    }

    // Funci�n para avanzar al siguiente �ndice
    function nextImage() {
        currentIndex = (currentIndex + 1) % images.length;
        showImage(currentIndex);
    }

    // Funci�n para retroceder al �ndice anterior
    function prevImage() {
        currentIndex = (currentIndex - 1 + images.length) % images.length;
        showImage(currentIndex);
    }

    // Mostrar la primera imagen al cargar la p�gina
    showImage(currentIndex);

    // Manejar el bot�n "Anterior"
    prevBtn.addEventListener("click", prevImage);

    // Manejar el bot�n "Siguiente"
    nextBtn.addEventListener("click", nextImage);

    // Automatizar el cambio de im�genes cada 3 segundos
    setInterval(nextImage, 3000);
});

</script>

</body>
</html>