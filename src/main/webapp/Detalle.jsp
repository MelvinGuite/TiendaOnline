<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Detalles del pedido</title>
 <link rel="stylesheet" type="text/css" href="Estilos/carrito.css">
       <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
    <script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    
    
        <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #333;
            color: #fff;
        }
    </style>
</head>
<%
String id = request.getParameter("id");
%>
<body>
       <div class="navbar">
 
        <a href="Pedidos.jsp">Regresar</a>

    </div>

<div class="cart">
    <h1>Detalle de Pedido</h1>
    <table id="tabla-detalle">
        <thead>
            <tr>
                <th></th>
                <th>Producto</th>
                <th>Cantidad</th>
                <th>Precio Unitario</th>
                <th>Subtotal</th>
            </tr>
        </thead>
        <tbody>
            <!-- Aquí se insertarán las filas de datos -->
        </tbody>
    </table>
    <div class="total">
        <p>Total: <span class="calculo-total"></span> </p>
    </div>
</div>


<script type="text/javascript">
    $(document).ready(function () {
        var id = "<%=id%>";
        var total = 0;
        var variables = { id };
        $.ajax({
            url: 'DetalleADPedido',
            type: 'get',
            dataType: 'json',
            data: variables,
            success: function (data) {
                var tabla = $('#tabla-detalle').find('tbody');
                tabla.empty();
                // Procesa los datos en paquetes de 4
                for (var i = 0; i < data.length; i += 4) {
                    var imagen = data[i];
                    var nombreproducto = data[i + 1];
                    var cantidad = data[i + 2];
                    var precio_unitario = data[i + 3];
                    // Cálculo de total
                    var subtotal = precio_unitario * cantidad;
                    total += subtotal;
                    
                    var row = $('<tr>');
                    row.append($('<td>').append($('<iframe>').attr('src', imagen)));
                    row.append($('<td>').text(nombreproducto));
                    row.append($('<td>').text(cantidad));
                    row.append($('<td>').text("Q" + precio_unitario));
                    row.append($('<td>').text(precio_unitario * cantidad));
                    tabla.append(row);
                }
                // Mostrando el total 
                $('.calculo-total').text("Q" + total);
                $('#tabla-detalle').DataTable({
                    
                });
            },
            error: function () {
                console.log('Error en la solicitud');
            }
        });
    });
</script>
</body>
</html>