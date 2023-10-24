package com.carrito;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.google.gson.Gson;
import com.mysql.Connmysql;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class ProductoEnCarrito
 */
@WebServlet("/ProductoEnCarrito")
public class ProductoEnCarrito extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String correo = request.getParameter("correo");
		
		System.out.println("El carrito ha sido llamado por: " + correo);
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
				arrCarrito.add(rsCarrito.getString("idproducto"));
				//paquetes de 7 datos
			}
			conn.cerrarConexion();
			
			//objeto json
			Gson gson = new Gson();
			
			//String json
			String json = gson.toJson(arrCarrito);
			
			//configurar la respueta 
	        response.setContentType("application/json");
	        response.setContentType("UTF-8");
	        
	        //mandando la respuesta
	        response.getWriter().write(json);
			
		}catch (Exception e) {
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