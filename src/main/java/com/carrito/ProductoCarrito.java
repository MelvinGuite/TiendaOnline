package com.carrito;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.mysql.Connmysql;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ProductoCarrito
 */
@WebServlet("/ProductoCarrito")
public class ProductoCarrito extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String correo = request.getParameter("correo");
		ArrayList<String> arrCarrito = new ArrayList<String>();
		try {
			Connmysql conn = new Connmysql();
			ResultSet rsCarrito = conn.ProductoCarrito(correo);
			while(rsCarrito.next()) {
				arrCarrito.add(rsCarrito.getString("nombreproducto"));
				arrCarrito.add(rsCarrito.getString("URL"));
				arrCarrito.add(rsCarrito.getString("idproducto"));
				arrCarrito.add(rsCarrito.getString("cantidad"));
				arrCarrito.add(rsCarrito.getString("precio"));
				arrCarrito.add(rsCarrito.getString("CantidadInventario"));
				//paquetes de 6 datos
			}
			request.setAttribute("carrito", arrCarrito);
			conn.cerrarConexion();
		}catch (Exception e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher("Carrito.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
