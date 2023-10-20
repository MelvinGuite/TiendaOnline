package com.carrito;

import java.io.IOException;

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
	String producto = (request.getParameter("producto"));
		String correo = (request.getParameter("usuario"));
		try {
			Connmysql conn = new Connmysql();
			conn.EiminarPCarrito(producto, correo);
			conn.cerrarConexion();
		}catch (Exception e) {
			e.printStackTrace();
		}
		response.getWriter().append("Eliminado ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
