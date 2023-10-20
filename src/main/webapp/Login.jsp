<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Inicio de sesion</title>
<link rel="stylesheet" type="text/css" href="Estilos/login.css">
</head>
<body>
<%
String usuario = (String) request.getSession().getAttribute("sesion");
if(usuario == null) {
	usuario = "No ha iniciado sesion";
}
%>
<div class="login-container">
    <div class="login-form">
        <h2>Login</h2>
        <form method="get" action="Login">
            <label for="username">Correo:</label>
            <input type="email" id="correo" name="correo" required>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            <button type="submit" name="iniciar" id="iniciar">Login</button>
            <p><%=usuario%></p>
        </form>
    </div>
</div>
</body>
</html>