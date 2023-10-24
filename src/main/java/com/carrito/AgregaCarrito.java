package com.carrito;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.Connmysql;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AgregaCarrito
 */
@WebServlet("/AgregaCarrito")
public class AgregaCarrito extends HttpServlet {
	private static final long serialVersionUID = 1L;

		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		    String id_producto = request.getParameter("id_producto");
		    String correo_usuario = request.getParameter("usuario");
		    String cantidad = request.getParameter("cantidad");
		    System.out.println("el id es" + id_producto);
		    System.out.println("EL correo es: " + correo_usuario);
		    System.out.println("LA cantidad : " + cantidad);
		    try {
		    	Connmysql conn = new Connmysql();
		    	ResultSet rsCliente = conn.Identificador(correo_usuario);
		    	if(rsCliente.next()) {
		    		int identificacion = Integer.parseInt(rsCliente.getString("ID"));
		    		conn.AgregarACarrito(Integer.parseInt(id_producto), Integer.parseInt(cantidad), identificacion);
		    		System.out.println("Producto selecionado " + id_producto + " " + identificacion + " " + cantidad);
					request.setAttribute("agregado","Producto agregado al carrito");
		    	}
		    	conn.cerrarConexion();
		    } catch (SQLException e) {
		    	if(e.getSQLState().equals("45000")) {
		    		System.out.println("Producto ya existe en el carrito");
		    	} else {
		    		e.printStackTrace();
		    	}
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
