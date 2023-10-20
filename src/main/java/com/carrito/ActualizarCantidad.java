package com.carrito;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class ActualizarCantidad
 */
@WebServlet("/ActualizarCantidad")
public class ActualizarCantidad extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		   // Recuperar los parámetros enviados desde la página web
        String cantidad = request.getParameter("cantidad");
        String usuario = request.getParameter("usuario");
       
        String respuesta = "Datos recibidos: Cantidad = " + cantidad + ", Usuario = " + usuario;
        System.out.println(respuesta);
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
