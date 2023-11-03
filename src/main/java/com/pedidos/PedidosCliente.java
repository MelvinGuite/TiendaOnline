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
 * Servlet implementation class PedidosCliente
 */
@WebServlet("/PedidosCliente")
public class PedidosCliente extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String correo = request.getParameter("correo");
		System.out.println("Pedidos de: " + correo);
		String idCliente = null;
		ArrayList<String> arrPedidos = new ArrayList<String>();
		try {
			Connmysql conn = new Connmysql();
			ResultSet rsCliente = conn.Identificador(correo);
			if(rsCliente.next()) {
				idCliente = rsCliente.getString("ID");
				System.out.println("Cliente numero: " + idCliente);
			}
			ResultSet rsPedido = conn.ListaPedidosCliente(idCliente);
			while(rsPedido.next()) {
				arrPedidos.add(rsPedido.getString("IDPedido"));
				arrPedidos.add(rsPedido.getString("estado"));
				arrPedidos.add(rsPedido.getString("fecha"));
				arrPedidos.add(rsPedido.getString("Total"));
			}
			System.out.println("Mostrando pedidos");
			conn.cerrarConexion();
			
			Gson gson = new Gson();
			String json = gson.toJson(arrPedidos);
			
			response.setContentType("application/json");
			response.setContentType("UTF-8");
			
			response.getWriter().write(json);
		}catch (Exception e) {
			e.printStackTrace();
			response.getWriter().write("Error en el servidor");
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
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
