package com.producto;

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
 * Servlet implementation class PruebaProducto
 */
@WebServlet("/PruebaProducto")
public class Catalogo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    ArrayList<String> arrProductos = new ArrayList<String>();
	    try {
	        Connmysql conn = new Connmysql();
	        ResultSet rsProducto = conn.Tienda();
	        while (rsProducto.next()) {
	            arrProductos.add(rsProducto.getString("ID"));
	            arrProductos.add(rsProducto.getString("NombreProducto"));
	            arrProductos.add(rsProducto.getString("Descripcion"));
	            arrProductos.add(rsProducto.getString("PrecioVenta"));
	            arrProductos.add(rsProducto.getString("Marca"));
	            arrProductos.add(rsProducto.getString("CantidadInventario"));
	            arrProductos.add(rsProducto.getString("URL"));
	            // paquete de 7 elementos
	        }

	        // Crear un objeto Gson
	        Gson gson = new Gson();

	        // Convertir el ArrayList en una representación JSON
	        String json = gson.toJson(arrProductos);

	        // Configurar la respuesta 
	        response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");

	        // Escribir la respuesta JSON en el HttpServletResponse
	        response.getWriter().write(json);

	        System.out.println("Pruductos en formato json");
	        conn.cerrarConexion();
	    } catch (Exception e) {
	        e.printStackTrace();
	        // Maneja errores y devuelve una respuesta de error en JSON si es necesario
	        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
	        response.getWriter().write("Error en el servidor");
	    }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
