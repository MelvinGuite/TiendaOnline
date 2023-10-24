<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.List" %> 
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Tienda en Línea</title>
<link rel="stylesheet" type="text/css" href="Estilos/estilotienda.css">
<link rel="stylesheet" type="text/css" href="Estilos/carrusel.css">
<link rel="stylesheet" type="text/css" href="Estilos/logo.css">
<link rel="stylesheet" type="text/css" href="Estilos/ventana.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
<!-- Estilos -->
<script src="https://kit.fontawesome.com/be42ec504e.js" crossorigin="anonymous"></script>
</head>
<%
String usuario = (String) request.getSession().getAttribute("sesion");
if(usuario == null) {
	usuario = "No ha iniciado sesion";
}
%>

<body>
<!-- Logo -->
<div id="miDiv">
 <img alt="" src="Electronix GT.png" frameborder="0" allowtransparency="true">
</div>	


<!-- Menú Horizontal -->
<div class="navbar">
    <div>
        <a href="Cliente.jsp">Registrate</a>
        <a href="Login.jsp">Inicio de sesion</a>
    </div>
    <div>
     <%=usuario%>
     <a></a><a></a><a></a><a></a><a>${agregado}</a><a></a><a></a><a></a><a></a><a></a><a></a>
		<input type="search"> <button type="button">Buscar</button>
		<a id="carritoLink" href="Carrito.jsp">Ver productos en carrito</a>
		<a href="#" id="cerrar-sesion">Cerrar Sesión</a>
		
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
// enlace para cerrar sesion
    $(document).ready(function() {
        $("#cerrar-sesion").click(function() {
            // Realizar una solicitud POST al servlet de cierre de sesión
            $.post("Logout", function() {
                // Redirigir a la página de inicio de sesión después de cerrar sesión
                window.location.href = "Tienda.jsp";
            });
        });
    });
</script>


<script>
var usuario = "<%= usuario %>";

// Obtén el elemento del enlace del carrito por su ID
var carritoLink = document.getElementById("carritoLink");

// Verifica si el usuario está autenticado (usuario no está vacío)
if (!usuario || usuario === "No ha iniciado sesion") {
    // Si el usuario no ha iniciado sesión, deshabilita el enlace del carrito
    carritoLink.href = "#"; // Establece el atributo href a "#" para deshabilitar el enlace
    carritoLink.onclick = function(event) {
        event.preventDefault(); // Evita que se siga el enlace cuando se hace clic
        // Muestra una alerta al usuario
        alert("Primero inicia sesión para acceder al carrito.");
    };
}
</script>




<div class="carousel-container" >
        <ul class="carousel">
            <li><iframe src="https://drive.google.com/file/d/1HuUpxrS5VuA5luUw0qJ6KiBczKy4T8Rl/preview" width="250" height="250"></iframe></li>
            <li><iframe src="https://drive.google.com/file/d/168ERW7_LA037fCTWipdi58Do5MdRs-qg/preview" width="250" height="250"></iframe></li>
            <li><iframe src="https://drive.google.com/file/d/1WHZYsJHjDbQe37fr_TdPvUsb2bjNo_QH/preview" width="250" height="250"></iframe></li>
            <!-- Agrega más imágenes aquí -->
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
		<form id="frm-agregar" >
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
	
<div class="card" onclick="mostrarDetalles('<%=ID%>', '<%=NombreProducto%>', '<%=Descripcion%>', '<%=Marca%>', <%=Precio%>, <%=Inventario%>);">
    <iframe src="<%=url%>" width="250" height="250"></iframe>
    <p>ID: <%=ID%></p>
    <input id="id" name="id" value="<%=ID%>" hidden="true">
    <h2>Producto: <%=NombreProducto%> </h2>
    <p>Descripción: <%=Descripcion %></p>
    <p>Marca: <%=Marca%></p>
    <p>Precio: Q<%=Precio%> </p>
    <p>Disponibles: <%=Inventario%> </p>
</div>

<!-- Ventana emergente oculta -->
<div id="modal" class="modal">

    <div class="modal-content">
        <span class="close" onclick="cerrarDetalles()">&times;</span>
        <h2 id="producto-nombre"></h2>
        <p id="producto-numero" hidden="true" ></p>
        <p id="producto-descripcion"></p>
        <p id="producto-marca"></p>
        <p id="producto-precio"></p>
        <p id="producto-inventario" hidden="true"></p>
    </div>
</div>


    
<script>

function mostrarDetalles(id, nombre, descripcion, marca, precio, inventario) {
    if ("<%= usuario %>" === null || "<%= usuario %>" == "No ha iniciado sesion" ) {
        alert("Debe iniciar sesión para agregar productos al carrito.");
        return;
    }
    document.getElementById("producto-numero").innerText = "Numero " + id;
    document.getElementById("producto-nombre").innerText = "Producto: " + nombre;
    document.getElementById("producto-descripcion").innerText = "Descripción: " + descripcion;
    document.getElementById("producto-marca").innerText = "Marca: " + marca;
    document.getElementById("producto-precio").innerText = "Precio: Q" + precio;
    document.getElementById("producto-inventario").innerText = "Disponibles: " + inventario;
    document.getElementById("modal").style.display = "block";

    // Mostrar un cuadro de diálogo de entrada para la cantidad
    var cantidad = prompt("¿Cuántos productos desea agregar?", "1");

    // Verificar si la cantidad es válida
    cantidad = parseInt(cantidad);

    if (cantidad > 0 && cantidad <= inventario) {
        var confirmar = window.confirm("¿Desea agregar " + cantidad + " producto(s) al carrito?");
        if (confirmar) {
            agregarAlCarrito(id, cantidad);
        } else {
            cerrarDetalles();
        }
    } else {
        alert("La cantidad ingresada no es válida. Debe ser mayor que 0 y menor o igual al inventario disponible.");
        cerrarDetalles();
    }
}
function cerrarDetalles() {
    document.getElementById("modal").style.display = "none";
}

function agregarAlCarrito(id, cantidad) {
    // Realizar una solicitud HTTP a un servlet
    var xhr = new XMLHttpRequest();
    var url = "AgregaCarrito?id_producto=" + id + "&usuario=<%=usuario%>&cantidad=" + cantidad;

    xhr.open("GET", url, true);

    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4 && xhr.status == 200) {
            alert("Producto agregado al carrito");
            cerrarDetalles();
        }
    };

    xhr.send();
}
</script>
        
		<%
		}
		%>
		
		</div>
		</form>
		<%
		}
		%>
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
<form action="MostrarProducto" method="get">
<label>sino ves los productos, haz clic </label>
<button type="submit" name="ver" id="ver">aqui</button>
</form>
		
<script type="text/javascript">
// Verifica si ya se ha realizado la acción
var clic = localStorage.getItem('clic') === 'true';

// Espera a que se cargue completamente la página
window.onload = function() {
    // Verifica si aún no se ha hecho clic
    if (!clic) {
        // Encuentra el botón por su id
        var boton = document.getElementById('ver');

        // Simula un clic en el botón
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

</script>

</body>
</html>