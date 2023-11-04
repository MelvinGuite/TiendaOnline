package com.pedidos;

import java.io.IOException;

import com.mysql.Connmysql;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class AccionPedido
 */
@WebServlet("/AccionPedido")
public class AccionPedido extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String idPedido = request.getParameter("idPedido");
        String opcion = request.getParameter("opcion");
        
        System.out.println("Accion: " + opcion + " Id del pedido " + idPedido);
        
        try {
        	Connmysql conn = new Connmysql();
        	
        	if (opcion.equals("entregar")) {
        		conn.AprobarPedido(idPedido);
        		System.out.println("Aprobar pedido");
        		
        	}
        }catch (Exception e) {
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
