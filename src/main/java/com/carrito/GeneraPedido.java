package com.carrito;

import java.io.BufferedReader;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class GeneraPedido
 */
@WebServlet("/GeneraPedido")
public class GeneraPedido extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Configura la codificación de caracteres para la solicitud y la respuesta
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        // Lee el cuerpo de la solicitud (datos JSON)
        StringBuilder sb = new StringBuilder();
        BufferedReader reader = request.getReader();
        String line;
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }

        // Procesa el JSON directamente como una cadena
        String json = sb.toString();

        // Ahora puedes trabajar con la cadena JSON como desees

        // Por ejemplo, puedes imprimir el JSON en la consola
        System.out.println("JSON recibido: " + json);

        ActualizaCarrito carrito = new ActualizaCarrito();
        carrito.procesaJson(json);
 
    }
}