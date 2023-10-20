package com.acceso;

import java.io.IOException;
import java.sql.ResultSet;

import com.encriptado.Procesamiento;
import com.mysql.Connmysql;
import com.mysql.cj.protocol.Resultset;
import com.mysql.cj.xdevapi.Result;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String correo = request.getParameter("correo");
		String pass = request.getParameter("password");
		String hash = null;
		try {
			Procesamiento pr = new Procesamiento();
			Connmysql conn = new Connmysql();
			ResultSet rsHash = conn.Verificar(correo);
			if(rsHash.next()) {
				hash = rsHash.getString("passw");
				if(pr.Verificar(pass, hash)) {
					System.out.println("Iniciando sesion");
				request.getSession().setAttribute("sesion",correo);
				response.sendRedirect("Tienda.jsp");
				} else {
					request.getSession().setAttribute("sesion", "Credenciales Incorrectas");
					response.sendRedirect("Login.jsp");
				}
			} else {
				request.getSession().setAttribute("sesion", "El usuario no existe");
				response.sendRedirect("Login.jsp");
			}
			conn.cerrarConexion();
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
