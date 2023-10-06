package com.proveedor;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.Connmysql;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class Proveedores
 */
@WebServlet("/Proveedores")
public class Proveedores extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<String> arrProveedor = new ArrayList<String>();
		
		if(request.getParameter("registrar") != null ) {
			arrProveedor.add(request.getParameter("nit").trim());
			arrProveedor.add(request.getParameter("nombre").toUpperCase());
			arrProveedor.add(request.getParameter("direccion").toUpperCase());
			arrProveedor.add(request.getParameter("telefono"));
			arrProveedor.add(request.getParameter("correo").toUpperCase());
			
			try {
				Connmysql conn = new Connmysql();
				conn.RegistroProveedor(arrProveedor);
				conn.cerrarConexion();
				request.setAttribute("exito", "Nuevo proveedor ha sido registrado");
				
			} catch (SQLException e) {
				if( e.getSQLState().equals("45000") ) {
		            request.setAttribute("error", "Ya existe un proveedor registrado con ese numero de nit");					
				} else {
					e.printStackTrace();
					request.setAttribute("error", "Ha ocurrido un error inesperado");
				}
			}
			
		}

		request.getRequestDispatcher("Proveedor.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
