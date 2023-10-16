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

<body>
    <div class="navbar">
        <a href="#">Inicio</a>
        <a href="#">Productos</a>
        <a href="#">Carrito</a>
    </div>

    <div class="cart">
        <h1>Carrito de Compras</h1>
        <div class="product">
            <img src="product1.jpg" alt="Producto 1">
            <div class="product-info">
                <h2>Producto 1</h2>
                <p>Precio: $19.99</p>
                <p>Cantidad: <input type="number" value="1"></p>
                <p>Subtotal: $19.99</p>
                <button class="remove">Eliminar</button>
            </div>
        </div>

        <div class="product">
            <img src="product2.jpg" alt="Producto 2">
            <div class="product-info">
                <h2>Producto 2</h2>
                <p>Precio: $24.99</p>
                <p>Cantidad: <input type="number" value="1"></p>
                <p>Subtotal: $24.99</p>
                <button class="remove">Eliminar</button>
            </div>
        </div>

        <div class="total">
            <p>Total: $44.98</p>
        </div>

        <button class="checkout">Realizar Pedido</button>
    </div>
</body>

</html>
