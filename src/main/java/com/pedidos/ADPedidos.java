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
 * Servlet implementation class ADPedidos
 */
@WebServlet("/ADPedidos")
public class ADPedidos extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<String> arrPedidos = new ArrayList<String>();
		try {
			Connmysql conn = new Connmysql();
			ResultSet rsPedidos = conn.MisPedidos();
			while(rsPedidos.next()) {
				arrPedidos.add(rsPedidos.getString("idpedido"));
				arrPedidos.add(rsPedidos.getString("fecha"));
				arrPedidos.add(rsPedidos.getString("nombre"));
				arrPedidos.add(rsPedidos.getString("apellido"));
				arrPedidos.add(rsPedidos.getString("direccion"));
				arrPedidos.add(rsPedidos.getString("total"));
				arrPedidos.add(rsPedidos.getString("estado"));  // 7 datos
			}
			conn.cerrarConexion();
			Gson gson = new Gson();
			String json = gson.toJson(arrPedidos);
			
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			
			response.getWriter().write(json);
			System.out.println("Mostrando pedidos");
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().write("Error en el servidor");
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
