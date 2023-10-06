package com.producto;

import java.io.IOException;
import java.util.ArrayList;

import com.mysql.Connmysql;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class Producto
 */
@WebServlet("/Producto")
public class Producto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<String> arrProducto = new ArrayList<String>();

		if (request.getParameter("registrar") != null ){
			String url = (request.getParameter("url").replace("/view", "/preview"));
			System.out.println(url);
			arrProducto.add(0, url);
			arrProducto.add(1, request.getParameter("nombre_producto").toUpperCase());
			arrProducto.add(2, request.getParameter("descripcion").toUpperCase());
			arrProducto.add(3, request.getParameter("precio_venta"));
			arrProducto.add(4, request.getParameter("marca").toUpperCase());
			arrProducto.add(5, request.getParameter("categoria").toUpperCase());
			arrProducto.add(6, request.getParameter("cantidad_inventario").toUpperCase());
			arrProducto.add(7, request.getParameter("id_proveedor"));
			
			try {
				Connmysql conn = new Connmysql();
				conn.RegistraProducto(arrProducto);
				conn.cerrarConexion();
				request.setAttribute("exito", "Su Producto ha sido registrado");
			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("exito", "Su Producto ha sido registrado");

			}
		}
		
		request.getRequestDispatcher("RegistraProducto.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
