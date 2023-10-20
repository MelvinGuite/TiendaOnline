package com.cliente;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import com.encriptado.Procesamiento;
import com.mysql.Connmysql;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class Clientes
 */
@WebServlet("/Clientes")
public class Clientes extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
           ArrayList<String> lsDatos = new ArrayList<String>();

           if(request.getParameter("registrar") != null ) {
               lsDatos.add(request.getParameter("id"));
               lsDatos.add(request.getParameter("nombre").toUpperCase());
               lsDatos.add(request.getParameter("apellido").toUpperCase());
               lsDatos.add(request.getParameter("direccion").toUpperCase());
               lsDatos.add(request.getParameter("telefono").toUpperCase());
               lsDatos.add(request.getParameter("correo").toUpperCase());
               lsDatos.add(request.getParameter("password"));
               try {
            	   Connmysql conn = new Connmysql();
            	   Procesamiento pr = new Procesamiento();
            	   String hash = pr.Encriptar(lsDatos.get(6));
            	   conn.RegistroCliente(lsDatos, hash);
            	   conn.cerrarConexion();
            	   System.out.println("Cliente Registrado");
            	   request.setAttribute("exito", "Registro exitoso");
               } catch (SQLException e) {
				if(e.getSQLState().equals("45000")) {
		            request.setAttribute("error", "Error: Identificacion o correo ya registrados");
				} else {
					e.printStackTrace();
				}
			}
               request.getRequestDispatcher("Cliente.jsp").forward(request, response);
           }
           
           for(String st : lsDatos) {
        	   System.out.println(st);
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
