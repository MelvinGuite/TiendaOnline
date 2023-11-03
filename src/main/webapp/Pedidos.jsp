<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Administración de Pedidos</title>
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

/* Estilo para la administración de pedidos */
.order-management {
    background-color: rgba(255, 255, 255, 0.8);
    padding: 20px;
    border-radius: 5px;
    margin: 20px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
}

.filter {
    display: flex;
    justify-content: space-between;
    margin-bottom: 20px;
}

table {
    width: 100%;
    border-collapse: collapse;
}

table, th, td {
    border: 1px solid #ccc;
}

th, td {
    padding: 10px;
    text-align: left;
}

thead {
    background-color: #007c91;
    color: #fff;
}

th {
    font-weight: bold;
}

select {
    width: 100%;
    padding: 5px;
    border: 1px solid #ccc;
    border-radius: 3px;
}

button.edit {
    background-color: #007c91;
    color: #fff;
    border: none;
    padding: 5px 10px;
    border-radius: 3px;
    font-size: 14px;
    cursor: pointer;
}

    </style>
    
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
    <script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>


    
</head>

<body>
    <div class="navbar">
        <a href="Proveedor.jsp">Proveedor</a>
        
        <a href="RegistraProducto.jsp">Registrar Producto</a>
    </div>

    <div class="order-management">
        <h1>Administración de Pedidos</h1>
 

 

 <table id="pedidos" class="dataTable">
    <thead>
        <tr>
            <th>Número de Pedido</th>
            <th>Fecha de Pedido</th>
            <th>Cliente</th>
            <th>Dirección de Envío</th>
            <th>Total</th>
            <th>Estado</th>
            <th>Acciones</th>
            <th>Detalles</th>
        </tr>
    </thead>
    <tbody>

    </tbody>
</table>

<script type="text/javascript">
    $(document).ready(function () {

        $.ajax({
            url: 'ADPedidos',
            type: 'get',
            dataType: 'json',
            success: function (data) {
                var tabla = $('#pedidos').find('tbody');
                tabla.empty();

                for (var i = 0; i < data.length; i += 7) {
                    var idPedido = data[i];
                    var fecha = data[i + 1];
                    var nombre = data[i + 2];
                    var apellido = data[i + 3];
                    var direccion = data[i + 4];
                    var total = data[i + 5];
                    var estado = data[i + 6];

                    if (estado == 1) {
                        estado = 'Solicitado';
                    }

                    var row = $('<tr>');
                    row.append($('<td>').text(idPedido));
                    row.append($('<td>').text(fecha));
                    row.append($('<td>').text(nombre + " " + apellido));
                    row.append($('<td>').text(direccion));
                    row.append($('<td>').text(total));
                    row.append($('<td>').text(estado));

                    // Agrega una lista desplegable de opciones en lugar del botón "Opciones"
                    var accionesCell = $('<td>');
                    var accionesSelect = $('<select>');
                    accionesSelect.addClass('acciones-select');
                    accionesSelect.data('id', idPedido); // Almacena el ID del pedido en el select

                    // Agrega opciones al select
                    var opcionPreparar = $('<option>').val('preparar').text('Preparar');
                    var opcionCancelar = $('<option>').val('cancelar').text('Cancelar');
                    var opcionEntregar = $('<option>').val('entregar').text('Entregar');

                    accionesSelect.append(opcionPreparar, opcionCancelar, opcionEntregar);
                    accionesCell.append(accionesSelect);
                    row.append(accionesCell);

                    row.append($('<td>').html('<a href="Detalle.jsp?id=' + idPedido + '">Ver Detalles</a>'));
                    tabla.append(row);
                }

                $('#pedidos').DataTable({
                    // Configura las opciones de DataTable, si es necesario
                });

                // Maneja el cambio en la lista desplegable
                $('.acciones-select').change(function () {
                    var idPedido = $(this).data('id');
                    var opcionSeleccionada = $(this).val();
                    // Aquí puedes agregar la lógica para manejar la opción seleccionada.
                    // Puedes usar AJAX para realizar acciones según la opción y actualizar la interfaz de usuario.
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