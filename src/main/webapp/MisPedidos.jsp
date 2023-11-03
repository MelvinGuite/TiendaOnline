<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tus Pedidos</title>

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
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #333;
            color: #fff;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
        }
    </style>
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
    <%=usuario%>
        <a href="Tienda.jsp">Productos</a>
        <a href="NuevoCarrito.jsp">Carrito</a>
    </div>

<div class="cart">
    <h1>Tus Pedidos</h1>
    <table id="tabla-pedidos" class="dataTable">
        <thead>
            <tr>
                <th style="display: none;">ID Pedido</th>
                <th>Estado</th>
                <th>Fecha</th>
                <th>Total</th>
                <th>Detalles</th>
            </tr>
        </thead>
        <tbody>
            <!-- Aquí se insertarán las filas de datos -->
        </tbody>
    </table>
</div>

<script type="text/javascript">
    $(document).ready(function () {
        var correo = "<%=usuario%>";
        $.ajax({
            url: 'PedidosCliente',
            type: 'get',
            dataType: 'json',
            data: { correo: correo },
            success: function (data) {
                var tabla = $('#tabla-pedidos').find('tbody');
                tabla.empty();

                // Procesa los datos en paquetes de 4
                for (var i = 0; i < data.length; i += 4) {
                    var idPedido = data[i];
                    var estado = data[i + 1];
                    var fecha = data[i + 2];
                    var total = data[i + 3];

                    if (estado == 1) {
                        estado = 'Solicitado';
                    }

                    var row = $('<tr>');
                    row.append($('<td style="display: none;">').text(idPedido)); // Oculta la columna visualmente
                    row.append($('<td>').text(estado));
                    row.append($('<td>').text(fecha));
                    row.append($('<td>').text("Q" + total));
                    row.append($('<td>').html('<a href="DetallePedido.jsp?id=' + idPedido + '">Ver Detalles</a>'));
                    tabla.append(row);
                }

                $('#tabla-pedidos').DataTable({
                   
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
