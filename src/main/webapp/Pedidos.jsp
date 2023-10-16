<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Administración de Pedidos</title>
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
</head>

<body>
    <div class="navbar">
        <a href="#">Inicio</a>
        <a href="#">Pedidos</a>
    </div>

    <div class="order-management">
        <h1>Administración de Pedidos</h1>
        <div class="filter">
            <label for="date-filter">Filtrar por Fecha:</label>
            <input type="date" id="date-filter">
            <label for "status-filter">Filtrar por Estado:</label>
            <select id="status-filter">
                <option value="todos">Todos</option>
                <option value="activo">Activo</option>
                <option value="proceso">En Proceso</option>
                <option value="finalizado">Finalizado</option>
                <option value="cancelado">Cancelado</option>
            </select>
        </div>

        <table id="order-table">
            <thead>
                <tr>
                    <th>Número de Pedido</th>
                    <th>Fecha de Pedido</th>
                    <th>Cliente</th>
                    <th>Dirección de Envío</th>
                    <th>Productos</th>
                    <th>Total</th>
                    <th>Estado</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1001</td>
                    <td>2023-10-15</td>
                    <td>Juan Pérez</td>
                    <td>Calle Principal 123, Ciudad</td>
                    <td>Producto 1, Producto 2</td>
                    <td>$44.98</td>
                    <td>
                        <select>
                            <option value="activo">Activo</option>
                            <option value="proceso">En Proceso</option>
                            <option value="finalizado">Finalizado</option>
                            <option value="cancelado">Cancelado</option>
                        </select>
                    </td>
                    <td><button class="edit">Editar</button></td>
                </tr>
                <tr>
                    <td>1002</td>
                    <td>2023-10-16</td>
                    <td>Maria González</td>
                    <td>Avenida Secundaria 456, Ciudad</td>
                    <td>Producto 3, Producto 4</td>
                    <td>$62.50</td>
                    <td>
                        <select>
                            <option value="activo">Activo</option>
                            <option value="proceso">En Proceso</option>
                            <option value="finalizado">Finalizado</option>
                            <option value="cancelado">Cancelado</option>
                        </select>
                    </td>
                    <td><button class="edit">Editar</button></td>
                </tr>
                <tr>
                    <td>1003</td>
                    <td>2023-10-17</td>
                    <td>Laura Smith</td>
                    <td>Plaza Principal 789, Ciudad</td>
                    <td>Producto 2, Producto 5</td>
                    <td>$38.75</td>
                    <td>
                        <select>
                            <option value="activo">Activo</option>
                            <option value="proceso">En Proceso</option>
                            <option value="finalizado">Finalizado</option>
                            <option value="cancelado">Cancelado</option>
                        </select>
                    </td>
                    <td><button class="edit">Editar</button></td>
                </tr>
                <tr>
                    <td>1004</td>
                    <td>2023-10-18</td>
                    <td>Carlos Rodríguez</td>
                    <td>Avenida Principal 987, Ciudad</td>
                    <td>Producto 1, Producto 3, Producto 6</td>
                    <td>$77.97</td>
                    <td>
                        <select>
                            <option value="activo">Activo</option>
                            <option value="proceso">En Proceso</option>
                            <option value="finalizado">Finalizado</option>
                            <option value="cancelado">Cancelado</option>
                        </select>
                    </td>
                    <td><button class="edit">Editar</button></td>
                </tr>
                <!-- Puedes seguir agregando más filas de pedidos aquí -->
            </tbody>
        </table>
    </div>

    <!-- Agregar la biblioteca DataTables JavaScript -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
    <script>
        // Inicializar la tabla con DataTables
        $(document).ready(function() {
            $('#order-table').DataTable();
        });
    </script>
</body>

</html>