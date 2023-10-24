package com.carrito;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import com.google.gson.Gson;
import com.mysql.Connmysql;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class EliminarProducto
 */
@WebServlet("/EliminarProducto")
public class EliminarProducto extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String producto = request.getParameter("producto");
	    String correo = request.getParameter("usuario");

	    try {
	        Connmysql conn = new Connmysql();
	        conn.EiminarPCarrito(producto, correo);
	        conn.cerrarConexion();
	        Gson gson = new Gson();
	        
	        // Crear un objeto que contenga la respuesta
	        Map<String, String> respuesta = new HashMap<>();
	        respuesta.put("success", "true"); // o "false" según el resultado
	        respuesta.put("message", "Producto eliminado"); // o "Error al eliminar el producto" según el resultado

	        String respuestaJson = gson.toJson(respuesta);

	        response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");

	        response.getWriter().write(respuestaJson);
	    } catch (Exception e) {
	        e.printStackTrace();
	        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
	        response.getWriter().write("Error en el servidor");
	    }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    // TODO Auto-generated method stub
	    doGet(request, response);
	}

}
