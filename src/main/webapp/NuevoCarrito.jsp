<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Carrito de Compras</title>
<link rel="stylesheet" type="text/css" href="Estilos/carrito.css">


<%
String usuario = (String) request.getSession().getAttribute("sesion");
if (usuario == null) {
	usuario = "No ha iniciado sesion";
	response.sendRedirect("Tienda.jsp");
}
%>
</head>
<body>
	<div class="navbar">
		<a href="Tienda.jsp">Regresar a Tienda</a> <a href="#">Mis pedidos</a>
	</div>
	<P>En sesion:<%=usuario%></P>


	

		<h1>Carrito de Compras</h1>
		
<template id="tarjeta-template">
		<div class="product">
			<iframe src="" width="250" height="250" id="imagen" name="imagen"></iframe>

			<div class="product-info">

				<h2>Producto <span class="producto-nombre"></span> </h2>
				<p>ID: <span class="id-producto"></span> </p>
				<P>inventario: <span class="producto-inventario"></span> </P>
				<p>Precio: <span class="producto-precio"></span> </p>
      			<input type="number" class="producto-cantidad" value="" min="1" max="100">
				<p>Inventario: <span class="inventario"></span> </p>
				<p>Subtotal: Q<span class="subtotal"></span></p>
				<button class="remove" type="submit">Eliminar</button>

			</div>
		</div>
		</template>

	
	<div class="cart">
		<div id="contenedor" ></div>
		<div class="total">	<p>Total: Q<span id="total"></span></p>
		</div>	
<button id="confirmarPedido" class="checkout">Confirmar Pedido</button>
	</div>
	
		
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	  $(document).ready(function () {
	        var correo = "<%=usuario%>";

	        function actualizarSubtotal() {
	            var total = 0;
	            $('.product').each(function () {
	                var cantidadInput = $(this).find('.producto-cantidad');
	                var cantidad = parseInt(cantidadInput.val());
	                var c_inventario = parseInt($(this).find('.inventario').text());

	                if (isNaN(cantidad) || cantidad <= 0) {
	                    cantidad = 1;
	                    cantidadInput.val(1);
	                } else if (cantidad > c_inventario) {
	                    cantidad = c_inventario;
	                    cantidadInput.val(c_inventario);
	                }

	                var precio = parseFloat($(this).find('.producto-precio').text());
	                var subtotal = cantidad * precio;
	                $(this).find('.subtotal').text(subtotal);
	                total += subtotal;
	            });
	            $('#total').text(total.toFixed(2));
	        }

	        function obtenerYMostrarCarrito() {
	            $.ajax({
	                url: 'ProductoEnCarrito',
	                type: 'get',
	                dataType: 'json',
	                data: { correo: correo },
	                success: function (data) {
	                    var contenedor = $('#contenedor');
	                    contenedor.empty();

	                    for (var i = 0; i < data.length; i += 7) {
	                        var carrito = {
	                            "nombreproducto": data[i],
	                            "URL": data[i + 1],
	                            "idproducto": data[i + 2],
	                            "cantidad": data[i + 3],
	                            "precio": data[i + 4],
	                            "CantidadInventario": data[i + 5],
	                            "idproducto": data[i + 6]
	                        };
	                        var template = $('#tarjeta-template').contents().clone();
	                        template.find('.producto-nombre').text(carrito.nombreproducto);
	                        template.find('iframe').attr('src', carrito.URL);
	                        template.find('.producto-inventario').text(carrito.CantidadInventario);
	                        template.find('.producto-precio').text(carrito.precio);
	                        template.find('.producto-cantidad').val(carrito.cantidad);
	                        template.find('.inventario').text(carrito.CantidadInventario);
	                        template.find('.id-producto').text(carrito.idproducto);

	                        contenedor.append(template);
	                    }

	                    $('.producto-cantidad').on('input', function () {
	                        var cantidadInput = $(this);
	                        var cantidad = parseInt(cantidadInput.val());
	                        var c_inventario = parseInt($(this).closest('.product').find('.inventario').text());

	                        if (isNaN(cantidad) || cantidad <= 0) {
	                            cantidad = 1;
	                            cantidadInput.val(1);
	                        } else if (cantidad > c_inventario) {
	                            cantidad = c_inventario;
	                            cantidadInput.val(c_inventario);
	                        }

	                        actualizarSubtotal();
	                    });

	                    actualizarSubtotal();
	                },
	                error: function () {
	                    console.log('Error en la solicitud');
	                }
	            });
	        }

	        // Llama a la función para obtener y mostrar el carrito al cargar la página
	        obtenerYMostrarCarrito();

	        $(document).on('click', '.remove', function () {
	            var producto = $(this).closest('.product');
	            var idProducto = producto.find('.id-producto').text();
	            if (confirm('¿Estás seguro de que deseas eliminar este producto del carrito?')) {
	                $.ajax({
	                    url: 'EliminarProducto',
	                    type: 'post',
	                    data: {
	                        producto: idProducto,
	                        usuario: correo
	                    },
	                    dataType: 'json',
	                    success: function (response) {
	                        if (response.success) {
	                            // Producto eliminado con éxito
	                            producto.remove();
	                            actualizarSubtotal();
	                            obtenerYMostrarCarrito();
	                            alert("Producto eliminado correctamente");
	                        } else {
	                           console.log('Error al eliminar el producto');
	                            alert("Error al eliminar el producto");
	                        }
	                    },
	                    error: function () {
	                        console.log('Error en la solicitud');
	                    }
	                });
	            }
	        });
	        
	        
	        $(document).on('click', '#confirmarPedido', function () {
	            // Muestra una ventana de confirmación al usuario
	            if (confirm('¿Estás seguro de confirmar el pedido?')) {
	                var productosEnCarrito = [];

	                // Recorre todos los productos en el carrito
	                $('.product').each(function () {
	                    var idProducto = $(this).find('.id-producto').text();
	                    var cantidad = $(this).find('.producto-cantidad').val();

	                    // Agrega los datos del producto al arreglo
	                    productosEnCarrito.push({ id: idProducto, cantidad: cantidad });
	                });

	                // Envía los datos al servlet
	                $.ajax({
	                    url: 'GeneraPedido',
	                    type: 'POST',
	                    data: JSON.stringify({ usuario: correo, productos: productosEnCarrito }),
	                    contentType: 'application/json', // Especifica el tipo de contenido como JSON
	                    success: function (response) {
	                        obtenerYMostrarCarrito();
	                        // Muestra un mensaje de agradecimiento
	                        alert('¡Gracias! Tu pedido ha sido procesado con éxito.');
	                    },
	                    error: function () {
	                        console.log('Error en la solicitud');
	                    }
	                });
	            } else {
	                // El usuario canceló la confirmación, no se realiza la acción.
	                console.log('Pedido no confirmado.');
	            }
	        });

  
	    });
	</script>
</body>
</html>































