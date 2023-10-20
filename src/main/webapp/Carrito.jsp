<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Carrito de Compras</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <style>
        /* Estilos generales */
body {
    font-family: 'Roboto', sans-serif;
    margin: 0;
    padding: 0;
    display: flex;
    position: relative;
    background-color: #f5f5f5;
    background-image: url('');
    background-size: cover;
    background-position: center;
    background-repeat: repeat;
    flex-direction: column;
}

/* Estilo del menú horizontal */
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

/* Estilo del carrito de compras */
.cart {
    background-color: rgba(255, 255, 255, 0.8);
    padding: 20px;
    border-radius: 5px;
    margin: 20px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
}

.product {
    display: flex;
    margin-bottom: 20px;
}

.product img {
    width: 100px;
    height: 100px;
    margin-right: 20px;
}

.product-info {
    flex: 1;
}

.product h2 {
    font-weight: bold;
}

.product p {
    margin: 0;
}

.product input[type="number"] {
    width: 50px;
}

.product .remove {
    background-color: #FF0000;
    color: #fff;
    border: none;
    padding: 5px 10px;
    border-radius: 3px;
    font-size: 14px;
    cursor: pointer;
}

.total {
    text-align: right;
    margin-top: 20px;
}

.checkout {
    background-color: #007c91;
    color: #fff;
    border: none;
    padding: 10px 20px;
    border-radius: 3px;
    font-size: 18px;
    cursor: pointer;
}

.checkout:hover {
    background-color: #00bcd4;
}

    </style>
</head>
<%
String usuario = (String) request.getSession().getAttribute("sesion");
if(usuario == null) {
	usuario = "No ha iniciado sesion";
	response.sendRedirect("Tienda.jsp");
}
%>

<body>
    <div class="navbar">
        <a href="Tienda.jsp">Regresar a Tienda</a>
        <a href="#">Mis pedidos</a>
    </div>
<P>En sesion: <%=usuario%> </P>


    <div class="cart">

        <h1>Carrito de Compras</h1>

		<%
		Object objCarrito = request.getAttribute("carrito");
		List<String> lsCarrito = null;
		if (objCarrito != null) {
			float total = 0.0f; 
			if (objCarrito instanceof List) {
				lsCarrito = (List<String>) objCarrito;
				
				for (int i = 0; i < lsCarrito.size(); i += 6) {
					String producto = lsCarrito.get(i);
					String url = lsCarrito.get(i + 1);
					String id = lsCarrito.get(i + 2);
					String cantidad = lsCarrito.get(i + 3);
					String precio = lsCarrito.get(i + 4);
					String existencia = lsCarrito.get(i + 5);
					float subtotal = Float.parseFloat(precio) * Float.parseFloat(cantidad);
					total += subtotal;
		%>
<div class="product">
<iframe src="<%=url%>" width="250" height="250" id="imagen<%=i%>" name="imagen"></iframe>
    <div class="product-info">

        <h2><%=producto%></h2>
        <P></P>inventario: <%=existencia%>
        <p>Precio: Q<%=precio%></p>
        <p>Cantidad: <input type="number" value="<%=cantidad%>" id="cantidadInput<%=i%>" onchange="validarCantidad(this, <%=existencia%>);"></p>
<p>Subtotal: Q<span id="subtotal<%=i%>"><%=subtotal%></span></p>
<input id="usuario" name="usuario" value="<%=usuario%>" hidden="">
<button class="remove" type="submit" onclick="enviarFormulario(<%=i%>)">Eliminar</button>
       
    </div>
</div>
	<div id="resultado"></div>






<form id="miFormulario<%=i%>" onsubmit="enviarFormulario(event, <%=i%>)">
</form>
<script type="text/javascript">
function enviarFormulario(i) {
  //  event.preventDefault(); // Evita la recarga de la página

    // Obtén el valor del iframe correspondiente al índice 'i'  y el usuario
    var iframe = document.getElementById("imagen" + i);
    var usuario = document.getElementById("usuario");
    var iframeSrc = iframe.src;

    // Envía el valor al servlet utilizando AJAX (puedes usar fetch o XMLHttpRequest)
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "EliminarProducto", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            // Manejar la respuesta del servlet si es necesario
            document.getElementById("resultado").innerHTML = xhr.responseText;
        }
    };

    // Define los datos que deseas enviar al servlet
    var data = "producto=" + encodeURIComponent(iframeSrc) + "&usuario=<%=usuario%>";
    xhr.send(data);
}
</script>


<script>
//calculo de subtotal 
<% for (int j = 0; j < lsCarrito.size(); j += 6) { %>
document.getElementById("cantidadInput<%=j%>").addEventListener("input", function () {
    var cantidadInput = document.getElementById("cantidadInput<%=j%>");
    var cantidad = parseFloat(cantidadInput.value);
    var existencia = parseFloat("<%=lsCarrito.get(j + 5)%>"); // Supongo que el inventario está en la posición 5

    if (cantidad > existencia) {
        alert("La cantidad no puede ser mayor que el inventario (" + existencia + ")");
        cantidadInput.value = existencia; // Restablecer la cantidad al valor del inventario
    } else if (cantidad < 0) {
        alert("La cantidad no puede ser negativa");
        cantidadInput.value = 0; // Restablecer la cantidad a cero
    }

    var precio = parseFloat("<%=lsCarrito.get(j + 4)%>");
    var subtotal = cantidad * precio;
    document.getElementById("subtotal<%=j%>").textContent = subtotal.toFixed(2); // Formatea el subtotal a dos decimales

    // Actualizar el total
    actualizarTotal();
});
<% } %>

function actualizarTotal() {
    var total = 0;
    <% for (int j = 0; j < lsCarrito.size(); j += 6) { %>
    var subtotal<%=j%> = parseFloat(document.getElementById("subtotal<%=j%>").textContent);
    total += subtotal<%=j%>;
    <% } %>
    document.getElementById("total").textContent = total.toFixed(2);
}

// Llamar a actualizarTotal al cargar la página
actualizarTotal();

</script>









		<%
		}
		%>
		<%
		}
		%>
        <div class="total">
        <p>Total: Q<span id="total"><%=total%></span></p>
		<%}
		%>

        </div>
        <button class="checkout">Confirmar Pedido</button>
    </div>

   
 <form action="ProductoCarrito" method="get">
 <input name="correo" id="correo" type="text" value="<%=usuario%>" hidden="">
 <label>sino ves tus productos, haz clic </label>
<button type="submit" name="ver" id="ver">aqui</button>
</form>
<script type="text/javascript">
// Verifica si ya se ha realizado la acción
var clic = localStorage.getItem('cargar') === 'true';

// Espera a que se cargue completamente la página
window.onload = function() {
    // Verifica si aún no se ha hecho clic
    if (!cargar) {
        // Encuentra el botón por su id
        var boton = document.getElementById('ver');

        // Simula un clic en el botón
        boton.click();

        // Marca que se ha hecho clic en el almacenamiento local
        localStorage.setItem('cargar', 'true');
    }
};
</script>
</body>

</html>
