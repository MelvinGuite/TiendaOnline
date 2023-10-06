package com.proveedor;

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
 * Servlet implementation class MostrarProveedor
 */
@WebServlet("/MostrarProveedor")
public class MostrarProveedor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//mostrar lista de proveedores
		ArrayList<String> arrProveedor = new ArrayList <String>();
				try {
					
					Connmysql conn = new Connmysql();
					ResultSet rsProveedores = conn.ListaProveedores();
					while(rsProveedores.next()) {
						arrProveedor.add(rsProveedores.getString("ID"));
						arrProveedor.add(rsProveedores.getString("Nombre"));
						//Paquete de dos elementos
					}
					conn.cerrarConexion();
					request.setAttribute("Proveedores", arrProveedor);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				for(String st : arrProveedor) {
					System.out.println(st);
				}
				
				request.getRequestDispatcher("RegistraProducto.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
