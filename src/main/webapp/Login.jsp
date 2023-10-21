<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Inicio de sesion</title>
<link rel="stylesheet" type="text/css" href="Estilos/login.css">
<link rel="stylesheet" type="text/css" href="Estilos/logo.css">

</head>
<body>
<%
String usuario = (String) request.getSession().getAttribute("sesion");
if(usuario == null) {
	usuario = "No ha iniciado sesion";
}
%>
<div id="miDiv">
 <img alt="" src="Electronix GT.png" frameborder="0" allowtransparency="true">
</div>	
<div class="login-container">
    <div class="login-form">
        <h2>Login</h2>
        <form method="get" action="Login">
            <label for="username">Correo:</label>
            <input type="email" id="correo" name="correo" required>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            <button type="submit" name="iniciar" id="iniciar">Login</button>
			<a href="Registro.jsp"><button type="button">Registrar</button></a>            
<p><%=usuario%></p>
        </form>
        <a href="Tienda.jsp"><button type="button">Regresar a tienda</button></a>    
    </div>
     
</div>
</body>
</html>