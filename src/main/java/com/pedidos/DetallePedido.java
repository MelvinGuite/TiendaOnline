package com.pedidos;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.google.gson.Gson;
import com.mysql.Connmysql;
import com.mysql.cj.xdevapi.Result;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class DetallePedido
 */
@WebServlet("/DetallePedido")
public class DetallePedido extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<String> arrDetalle = new ArrayList<String>();
		String id = request.getParameter("id");
		String correo = request.getParameter("correo");
		String idCliente = null;
		
		try {
			Connmysql conn = new Connmysql();
			ResultSet rsCliente = conn.Identificador(correo);
			if(rsCliente.next()) {
				idCliente = rsCliente.getString("ID");
				System.out.println("Identificador del cliente es " + idCliente);				
			}
			ResultSet rsDetalle = conn.DetallePedido(Integer.parseInt(idCliente), Integer.parseInt(id));
			while (rsDetalle.next()) {
				arrDetalle.add(rsDetalle.getString("imagen"));
				arrDetalle.add(rsDetalle.getString("nombreproducto"));
				arrDetalle.add(rsDetalle.getString("cantidad"));
				arrDetalle.add(rsDetalle.getString("precio_unitario"));
			}
			conn.cerrarConexion();
			
			Gson gson = new Gson();
			String json = gson.toJson(arrDetalle);
			
			response.setContentType("application/json");
			response.setContentType("UTF-8");
			
			response.getWriter().write(json);
			System.out.println("Mostrar detallePedido");
		}catch (Exception e) {
			e.printStackTrace();
			response.getWriter().write("Error en el servidor");
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
