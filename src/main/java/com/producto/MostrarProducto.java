package com.producto;

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
 * Servlet implementation class MostrarProducto
 */
@WebServlet("/MostrarProducto")
public class MostrarProducto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<String> arrProductos = new ArrayList<String>();
		try {
			Connmysql conn = new Connmysql();
			ResultSet rsProducto = conn.Tienda();
			while(rsProducto.next()) {
				arrProductos.add(rsProducto.getString("ID"));
				arrProductos.add(rsProducto.getString("NombreProducto"));
				arrProductos.add(rsProducto.getString("Descripcion"));
				arrProductos.add(rsProducto.getString("PrecioVenta"));
				arrProductos.add(rsProducto.getString("Marca"));
				arrProductos.add(rsProducto.getString("CantidadInventario"));
				arrProductos.add(rsProducto.getString("URL"));
				//paquete de 7 elementos
			}
			for(String st : arrProductos ) {
				System.out.println(st);
			}
			System.out.println("Mostrando Productos");
			conn.cerrarConexion();
			request.setAttribute("Productos", arrProductos);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.getRequestDispatcher("Tienda.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
