package com.carrito;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.mysql.Connmysql;

public class ActualizaCarrito {
 
	public void procesaJson (String pedido) {

	        Gson gson = new Gson();
	        JsonObject jsonObject = gson.fromJson(pedido, JsonObject.class);

	        String usuario = jsonObject.get("usuario").getAsString();
	        JsonArray productos = jsonObject.getAsJsonArray("productos");
	        try {
	        	Connmysql conn = new Connmysql();
	        for (int i = 0; i < productos.size(); i++) {
	            JsonObject producto = productos.get(i).getAsJsonObject();
	            String id = producto.get("id").getAsString();
	            String cantidad = producto.get("cantidad").getAsString();

	            System.out.println("Usuario: " + usuario);
	            System.out.println("ID: " + id);
	            System.out.println("Cantidad: " + cantidad);
	            System.out.println("------------");
		           
            	
            	conn.ActualizaCarrito(usuario, Integer.parseInt(id) ,Integer.parseInt(cantidad));
            	System.out.println("Producto actualizado producto: " + id + " cantidad: " + cantidad);
				}
	        conn.ConfirmaPedido(usuario);
	        System.out.println("Pedido Confirmado");
	        conn.cerrarConexion();
	        }catch (Exception e) {
	        	e.printStackTrace();
	        }
	}
  }
