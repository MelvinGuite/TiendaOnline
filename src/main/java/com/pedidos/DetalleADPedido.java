package com.pedidos;

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
 * Servlet implementation class DetalleADPedido
 */
@WebServlet("/DetalleADPedido")
public class DetalleADPedido extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		ArrayList<String> arrDetalle = new ArrayList<String>();
		
		try {
			Connmysql conn = new Connmysql();
			ResultSet rsDetalle = conn.DetalleMisPedidos(id);
			while(rsDetalle.next()) {
				arrDetalle.add(rsDetalle.getString("imagen"));
				arrDetalle.add(rsDetalle.getString("nombreproducto"));
				arrDetalle.add(rsDetalle.getString("cantidad"));
				arrDetalle.add(rsDetalle.getString("precio_unitario"));
			}
			conn.cerrarConexion();
			
			Gson gson = new Gson();
			String json = gson.toJson(arrDetalle);
			
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			
			response.getWriter().write(json);
			System.out.println("Mostrando detalle pedidos");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
