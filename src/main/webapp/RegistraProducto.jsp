<%@ page import="java.util.List" %> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Formulario de Registro de Producto</title>
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
            flex-direction: column; /* Cambiamos la dirección del flujo de contenido a columna */
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

        /* Estilo del formulario */
        form {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 20px;
            border-radius: 5px;
            margin: 20px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
        }

        label {
            font-weight: bold;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
            font-size: 16px;
        }

        input[type="submit"] {
            background-color: #007c91;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 3px;
            font-size: 18px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #00bcd4;
        }

        /* Estilo para mensajes de error */
        .error {
            color: #FF0000;
            font-size: 14px;
            margin-top: -10px;
            margin-bottom: 10px;
        }
    </style>
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
  // Esta función se ejecutará cuando la página se cargue completamente
  window.onload = function() {
    
    $.get('MostrarProveedor'); 
  };
</script>
    
</head>
<body>
    <div class="navbar">
        <a href="Proveedor.jsp">Proveedor</a>
        
        <a href="Pedidos.jsp">Pedidos</a>
    </div>
    <h1>Registro de Producto</h1>
    <h2>${exito}</h2>
    <h2>${error}</h2>
    <form action="Producto" method="POST">
        <label for="nombre_producto">Nombre del Producto:</label>
        <input type="text" id="nombre_producto" name="nombre_producto" required><br><br>

        <label for="descripcion">Descripción:</label>
        <textarea id="descripcion" name="descripcion"></textarea><br><br>

        <label for="precio_venta">Precio de Venta:</label>
        <input type="number" id="precio_venta" name="precio_venta" required><br><br>

        <label for="marca">Marca:</label>
        <input type="text" id="marca" name="marca"><br><br>

        <label for="categoria">Categoría:</label>
        <input type="text" id="categoria" name="categoria"><br><br>

        <label for="cantidad_inventario">Cantidad en Inventario:</label>
        <input type="number" id="cantidad_inventario" name="cantidad_inventario"><br><br>
        
        <label for="id_proveedor">ID del Proveedor:</label>
        <select name="id_proveedor" id="id_proveedor">
		<%
		Object objProveedor = request.getAttribute("Proveedores");
		List<String> lsProveedor = null;
		if (objProveedor != null) {
			if (objProveedor instanceof List) {
				lsProveedor = (List<String>) objProveedor;
				for (int i = 0; i < lsProveedor.size(); i += 2) {
			String id = lsProveedor.get(i);
			String nombre = lsProveedor.get(i + 1);
		%>
		<option value="<%=id%>">ID: <%=id%> Nombre: <%=nombre%></option>
		<%
		}
				%>
				</select>
				<%
		}
			} else { %>
			<p>No hay Proveedores registrados</p>
	<%		
		}
		%>
        
<h2>Mi Imagen en Google Drive</h2>
    <label for="url">URL:</label>
    <input type="text" id="url" name="url" oninput="actualizarIframeSrc(this.value)"><br><br>
    <iframe id="imagenFrame" width="300" height="300"></iframe>

    <input type="submit" name="registrar" id="registrar" value="Registrar Producto">

    <script>
        function actualizarIframeSrc(url) {
            // Reemplaza "view" por "preview" en la URL
            url = url.replace("/view", "/preview");

            // Obtén una referencia al elemento iframe
            var iframe = document.getElementById("imagenFrame");

            // Actualiza el atributo src del iframe con la nueva URL modificada
            iframe.src = url;
        }
    </script>
    </form>
 
    <form action="MostrarProveedor" method="get">
    <label>Si los proveedores no se muestran, presiona aqui</label>
        <button id="verProveedorButton" type="submit">Ver proveedor</button>
    </form>

    <script>
        // Verifica si ya se ha realizado la acción
        var seHaHechoClic = localStorage.getItem('seHaHechoClic') === 'true';

        // Espera a que se cargue completamente la página
        window.onload = function() {
            // Verifica si aún no se ha hecho clic
            if (!seHaHechoClic) {
                // Encuentra el botón por su id
                var boton = document.getElementById('verProveedorButton');

                // Simula un clic en el botón
                boton.click();

                // Marca que se ha hecho clic en el almacenamiento local
                localStorage.setItem('seHaHechoClic', 'true');
            }
        };
    </script>
</body>
</html>
