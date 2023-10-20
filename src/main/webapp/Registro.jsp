<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Registro de Cliente</title>
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

/* Estilo del formulario de registro */
.registration {
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
input[type="password"],
input[type="number"]
 {
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

    </style>
</head>

<body>
    <div class="navbar">
        <a href="#">Inicio</a>
        <a href="#">Productos</a>
        <a href="#">Carrito</a>
        <a href="#">Iniciar Sesión</a>
    </div>

    <div class="registration">
        <h1>Registro de Cliente</h1>
        <form>
            <label for="name">Nombre:</label>
            <input type="text" id="name" name="name" required>

            <label for="email">Correo Electrónico:</label>
            <input type="email" id="email" name="email" required>
            
            <label for="email">Telefono:</label>
            <input type="number" id="telefono" name="telefono" required>
            
            <label for="name">Direccion de entrega:</label>
            <input type="text" id="direccion" name="direccion" required>

            <label for="password">Contraseña:</label>
            <input type="password" id="password" name="password" required>

            <label for="confirm-password">Confirmar Contraseña:</label>
            <input type="password" id="confirm-password" name="confirm-password" required>

            <input type="submit" value="Registrarse">
        </form>
    </div>
</body>

</html>
