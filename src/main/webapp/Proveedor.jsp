<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
    <title>Formulario de Registro de Proveedor</title>
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
</head>
<body>
<h1>${exito}</h1>
<h1>${error}</h1>
    <h1>Registro de Proveedor</h1>
    <form action="Proveedores" method="POST">
        <label for="nit">NIT del Proveedor (sin guiones):</label>
        <input type="number" id="nit" name="nit" required><br><br>

        <label for="nombre">Nombre del Proveedor:</label>
        <input type="text" id="nombre" name="nombre" required><br><br>

        <label for="direccion">Dirección del Proveedor:</label>
        <input type="text" id="direccion" name="direccion"><br><br>

        <label for="telefono">Teléfono del Proveedor:</label>
        <input type="number" id="telefono" name="telefono"><br><br>

        <label for="correo">Correo Electrónico del Proveedor:</label>
        <input type="email" id="correo" name="correo"><br><br>

        <input type="submit" name="registrar" id="registrar" value="Registrar Proveedor">
    </form>
</body>
</html>
