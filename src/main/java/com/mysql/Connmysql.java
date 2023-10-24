package com.mysql;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.cj.x.protobuf.MysqlxDatatypes.Array;

public class Connmysql {
	private String url = "jdbc:mysql://127.0.0.1:3306/tienda";
	private String usuario = "admin";
	private String password = "1829372MG";
	private Connection conexion = null;

	// ___________________________Conexion a la base de
	// datos_____________________________________//
	public Connmysql() throws SQLException {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conexion = DriverManager.getConnection(url, usuario, password);
			// System.out.println("Conexión establecida");
		} catch (ClassNotFoundException e) {
			System.out.println("Error al cargar el driver");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("Error en la conexión");
			e.printStackTrace();
		}
	}

	public void cerrarConexion() {
		try {
			conexion.close();
			// System.out.println("Conexión cerrada");
		} catch (SQLException e) {
			System.out.println("Error al cerrar la conexión");
			e.printStackTrace();
		}
	}

	// Registro cliente
	public void RegistroCliente(ArrayList<String> arrDatos, String hash) throws SQLException {
		CallableStatement cl = conexion.prepareCall(" { call RegistraCliente ( ?, ? , ?, ?, ?, ?, ?) }");
		cl.setInt(1, Integer.parseInt(arrDatos.get(0)));
		cl.setString(2, arrDatos.get(1));
		cl.setString(3, arrDatos.get(2));
		cl.setString(4, arrDatos.get(3));
		cl.setString(5, arrDatos.get(4));
		cl.setString(6, arrDatos.get(5));
		cl.setString(7, hash);
		cl.execute();
		cl.close();
	}
	
	//Registro Proveedor
	public void RegistroProveedor(ArrayList<String> arrDatos) throws SQLException {
		CallableStatement cl = conexion.prepareCall(" { call RegistraProveedor ( ?, ?, ?, ?, ?) }");
		cl.setInt(1, Integer.parseInt(arrDatos.get(0)));
		cl.setString(2, arrDatos.get(1));
		cl.setString(3, arrDatos.get(2));
		cl.setString(4, arrDatos.get(3));
		cl.setString(5, arrDatos.get(4));
		cl.execute();
		cl.close();
	}

	//Muestra lista de proveedores
	public ResultSet ListaProveedores () throws SQLException {
		String consulta = "select * from  listaProveedor; ";
		PreparedStatement ps = conexion.prepareStatement(consulta);
		return ps.executeQuery();
	}
    
	//Registra producto
	public void RegistraProducto (ArrayList<String> arrDatos) throws SQLException{
		CallableStatement cl = conexion.prepareCall(" { call InsertarProducto ( ?, ?, ?, ?, ?, ?, ? , ?) }");
		cl.setString(1, arrDatos.get(0));
		cl.setString(2, arrDatos.get(1));
		cl.setString(3, arrDatos.get(2));
		cl.setInt(4, Integer.parseInt(arrDatos.get(3)));
		cl.setString(5, arrDatos.get(4));
		cl.setString(6, arrDatos.get(5));
		cl.setInt(7, Integer.parseInt(arrDatos.get(6)));
		cl.setInt(8, Integer.parseInt(arrDatos.get(7)));
		cl.execute();
		cl.close();
	}

	//Ver productos en tienda 
	public ResultSet Tienda () throws SQLException {
		String consulta = "select * from ListaProducto;";
		PreparedStatement ps = conexion.prepareStatement(consulta);
		return ps.executeQuery();
	}
	
	//Recuperar HASH
	public ResultSet Verificar( String correo) throws SQLException {
		String consulta = "select passw from cliente where correoelectronico = ? ;";
		PreparedStatement ps = conexion.prepareStatement(consulta);
		ps.setString(1,correo);
		return ps.executeQuery();
	}
	
	//recuperar identificador de usuario
	public ResultSet Identificador (String correo) throws SQLException {
		String consulta = "select id from cliente where CorreoElectronico = ? ;\r\n"
				+ "";
		PreparedStatement ps = conexion.prepareStatement(consulta);
		ps.setString(1, correo);
		return ps.executeQuery();
	}
	
	//agregar productos al carrito
	public void AgregarACarrito (int producto, int cantidad, int cliente) throws SQLException {
		CallableStatement cl = conexion.prepareCall(" {  call AgregaCarrito (?, ?, ?) }");
		cl.setInt(1, producto);
		cl.setInt(2, cantidad);
		cl.setInt(3, cliente);
		cl.execute();
	}
	
	//Ver productos en el carrito
	public ResultSet ProductoCarrito (String correo) throws SQLException {
		String consulta = "select \r\n"
				+ "p.nombreproducto, p.URL , p.CantidadInventario , \r\n"
				+ "d.idproducto, d.cantidad, d.precio\r\n"
				+ "from \r\n"
				+ "producto p join detallecarrito d \r\n"
				+ "on p.ID = d.IDProducto join cliente c \r\n"
				+ "on c.ID = d.ID_cliente\r\n"
				+ "where d.estado = 1 and c.CorreoElectronico  = ? ;";
		PreparedStatement ps = conexion.prepareStatement(consulta);
		ps.setString(1, correo);
		return ps.executeQuery();
	}
	
	//eliminar producto de carrito 
	public void EiminarPCarrito(String id, String correo) throws SQLException {
		CallableStatement cl = conexion.prepareCall(" { call EliminarPCarrito (?, ? ) } ");
		cl.setInt(1, Integer.parseInt(id));
		cl.setString(2, correo);
		cl.execute();
	}
	
	//actualizar carrito 
	public void ActualizaCarrito (String usuario, int producto, int cantidad) throws SQLException {
		CallableStatement cl = conexion.prepareCall(" { call ActualizaCarrito (?, ?, ?) } ");
		cl.setString(1, usuario);
		cl.setInt(2, producto);
		cl.setInt(3, cantidad);
		cl.execute();
	}
	
	// Crear y confirmar pedido 
	public void ConfirmaPedido (String correo) throws SQLException {
		CallableStatement cl = conexion.prepareCall(" { call CreaPedido (?) } ");
		cl.setString(1, correo);
		cl.execute();
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
