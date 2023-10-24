
// enlace para cerrar sesion
    $(document).ready(function() {
        $("#cerrar-sesion").click(function() {
            // Realizar una solicitud POST al servlet de cierre de sesión
            $.post("Logout", function() {
                // Redirigir a la página de inicio de sesión después de cerrar sesión
                window.location.href = "Tienda.jsp";
            });
        });
    });
