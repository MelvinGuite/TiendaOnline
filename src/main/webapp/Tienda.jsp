<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.List" %> 
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Tienda en Línea</title>
<!-- Estilos -->
<link rel="stylesheet" type="text/css" href="Estilos/carrusel.css">
<link rel="stylesheet" type="text/css" href="Estilos/logo.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
<script src="https://kit.fontawesome.com/be42ec504e.js" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="Estilos/estilotienda.css">

<script src="https://kit.fontawesome.com/be42ec504e.js"></script>

<!-- funciones -->
<script type="text/javascript" src="Funciones/carrusel.js"></script>
<script type="text/javascript" src="Funciones/cerrarsesion.js"></script>


<style type="text/css">
    .modal {
        display: none;
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5);
    }

    .modal-content {
        background-color: #fff;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        padding: 20px;
    }

    .close {
        position: absolute;
        top: 0;
        right: 0;
        padding: 10px;
        cursor: pointer;
    }

</style>

<style>
    #paginacion {
        text-align: center;
        margin-top: 20px;
    }

    #pagina-anterior, #pagina-siguiente {
        background-color: #007bff;
        color: #fff;
        padding: 5px 10px;
        margin: 0 5px;
        border: none;
        border-radius: 3px;
        cursor: pointer;
    }

    #pagina-anterior:hover, #pagina-siguiente:hover {
        background-color: #0056b3;
    }
</style>

</head>
<%
String usuario = (String) request.getSession().getAttribute("sesion");
if(usuario == null) {
	usuario = "No ha iniciado sesion";
}
%>
	<body>
	<div id="miDiv">
 <img alt="" src="Electronix GT.png" frameborder="0" allowtransparency="true">
</div>	


	<!-- Agrega el menu -->
	<div class="navbar"> 
	    <div>
	        <a href="Cliente.jsp">Registrate</a>
	        <a href="Login.jsp">Inicio de sesion</a>
	        <a><%=usuario%></a>
	        <a id="carritoLink" href="NuevoCarrito.jsp">Ver productos en carrito</a>
	        <a href="" id="cerrar-sesion">Cerrar Sesión</a>
	    </div>
		 <div>   
<input type="text" id="busqueda" placeholder="Buscar por nombre de producto" style="width: 300px;">
	   </div>
	    
	</div>
	
	
	<!-- Verifica el inicio de sesion y permite el acceso al carrito -->
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



<template id="tarjeta-template">
    <div class="card" onclick="mostrarDetalles(this);">
        <iframe src="" width="250" height="250"></iframe>
        <p>ID: <span class="id"></span></p>
        <h2>Producto: <span class="producto-nombre"></span></h2>
        <p>Descripción: <span class="producto-descripcion"></span></p>
        <p>Marca: <span class="producto-marca"></span></p>
        <p>Precio: <span class="producto-precio"></span></p>
        <p>Disponibles: <span class="producto-disponibles"></span></p>
    </div>
</template>

<div id="paginacion">
    <button id="pagina-anterior" ><i class="fa-solid fa-left-long fa-fade fa-xl" style="color: #2861c3;"></i></button>
    <button id="pagina-siguiente"><i class="fa-solid fa-right-long fa-fade fa-xl" style="color: #2861c3;"></i></button>
</div>
<div id="contenedor" class="content">
    <!-- Aquí debes tener contenido generado dinámicamente que incluya los productos -->
</div>


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function () {
        $.ajax({
            url: 'PruebaProducto',
            type: 'get',
            dataType: 'json',
            success: function (data) {
                var contenedor = $('#contenedor');
                contenedor.empty();
                // Recorrer el array en 7
                for (var i = 0; i < data.length; i += 7) {
                    var producto = {
                        "ID": data[i],
                        "NombreProducto": data[i + 1],
                        "Descripcion": data[i + 2],
                        "PrecioVenta": data[i + 3],
                        "Marca": data[i + 4],
                        "CantidadInventario": data[i + 5],
                        "URL": data[i + 6]
                    };

                    var template = $('#tarjeta-template').contents().clone();
                    template.find('iframe').attr('src', producto.URL);
                    template.find('.id').text(producto.ID);
                    template.find('h2').text(producto.NombreProducto);
                    template.find('.producto-descripcion').text(producto.Descripcion);
                    template.find('.producto-marca').text(producto.Marca);
                    template.find('.producto-precio').text(producto.PrecioVenta);
                    template.find('.producto-disponibles').text(producto.CantidadInventario);

                    contenedor.append(template);
                }         
            },
            
            
            error: function () {
                console.log('Error en la solicitud');
            }
        });
    });

    function mostrarDetalles(card) {
        if ("<%= usuario %>" === null || "<%= usuario %>" == "No ha iniciado sesion" ) {
            alert("Debe iniciar sesión para agregar productos al carrito.");
            return;
        }
        // Obtener el ID del producto desde la tarjeta clicada
        var productoID = $(card).find('.id').text();       
        // Mostrar el ID en un prompt
      //  prompt('ID del producto:', productoID);
      //  prompt('La cantidad disponible es: ' , inventario);
        var inventario = $(card).find('.producto-disponibles').text();
        var cantidad = prompt("¿Que cantidad deseas agregar?", "1");
    	  
        // Verificar si la cantidad es válida
        cantidad = parseInt(cantidad);
        
        if (cantidad > 0 && cantidad <= inventario) {
        	
            var confirmar = window.confirm("¿Desea agregar " + cantidad + " producto(s) al carrito?");
            
            if (confirmar) {

                // Crear un objeto de datos para enviar al servlet
                var carrito = {
                    id_producto: productoID,
                    usuario: "<%=usuario%>",
                    cantidad: cantidad
                };

                // Realizar una solicitud AJAX al servlet
                $.ajax({
                    url: 'AgregaCarrito', 
                    type: 'POST', // O 'GET' si es necesario
                    data: carrito,
                    success: function(response) {
                        
                        alert("Productos agregados al carrito" );
                    },
                    error: function() {
                        alert("No se ha podido cominicar con el carrito de compras");
                    }
                });
                
            } else {
                return;
            }
        } else {
            alert("La cantidad ingresada no es válida. Debe ser mayor que 0 y menor o igual al inventario disponible.");
            return;
        }

    }
</script>

		    
		    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function () {
    	var paginaActual = 1;
    	var productosPorPagina = 3; // Puedes ajustar este número según tus necesidades

        var productos = [];

        function cargarProductos() {
            $.ajax({
                url: 'PruebaProducto',
                type: 'get',
                dataType: 'json',
                success: function (data) {
                    productos = [];
                    for (var i = 0; i < data.length; i += 7) {
                        var producto = {
                            "ID": data[i],
                            "NombreProducto": data[i + 1],
                            "Descripcion": data[i + 2],
                            "PrecioVenta": data[i + 3],
                            "Marca": data[i + 4],
                            "CantidadInventario": data[i + 5],
                            "URL": data[i + 6]
                        };
                        productos.push(producto);
                    }
                    mostrarProductos();
                },
                error: function () {
                    console.log('Error en la solicitud');
                }
            });
        }

        function mostrarProductos() {
            var contenedor = $('#contenedor');
            contenedor.empty();
            var inicio = (paginaActual - 1) * productosPorPagina;
            var fin = paginaActual * productosPorPagina;
            var productosMostrados = productos.slice(inicio, fin);

            productosMostrados.forEach(function (producto) {
                var template = $('#tarjeta-template').contents().clone();
                template.find('iframe').attr('src', producto.URL);
                template.find('.id').text(producto.ID);
                template.find('h2').text(producto.NombreProducto);
                template.find('.producto-descripcion').text(producto.Descripcion);
                template.find('.producto-marca').text(producto.Marca);
                template.find('.producto-precio').text(producto.PrecioVenta);
                template.find('.producto-disponibles').text(producto.CantidadInventario);
                contenedor.append(template);
            });
        }
	    $('#pagina-anterior').on('click', function () {
	        if (paginaActual > 1) {
	            paginaActual--;
	            mostrarProductos();
	        }
	    });

	    $('#pagina-siguiente').on('click', function () {
	        if (paginaActual < Math.ceil(productos.length / productosPorPagina)) {
	            paginaActual++;
	            mostrarProductos();
	        }
	    });


        $('#busqueda').on('input', function () {
            var term = $(this).val().toLowerCase();
            var productosFiltrados = productos.filter(function (producto) {
                return producto.NombreProducto.toLowerCase().includes(term);
            });
            mostrarProductosFiltrados(productosFiltrados);
        });

        function mostrarProductosFiltrados(productosFiltrados) {
            var contenedor = $('#contenedor');
            contenedor.empty();
            productosFiltrados.forEach(function (producto) {
                var template = $('#tarjeta-template').contents().clone();
                template.find('iframe').attr('src', producto.URL);
                template.find('.id').text(producto.ID);
                template.find('h2').text(producto.NombreProducto);
                template.find('.producto-descripcion').text(producto.Descripcion);
                template.find('.producto-marca').text(producto.Marca);
                template.find('.producto-precio').text(producto.PrecioVenta);
                template.find('.producto-disponibles').text(producto.CantidadInventario);
                contenedor.append(template);
            });
        }

        cargarProductos();
    });
</script>


		</body>
</html>