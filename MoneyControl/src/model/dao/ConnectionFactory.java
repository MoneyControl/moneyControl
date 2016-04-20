package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {

	public Connection getConexao(){
		 
		String url = "jdbc:mysql://localhost/moneycontrol";
		String user = "root";
		String password = "123456";
		
		try{
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			return DriverManager.getConnection(url, user, password);
		}  catch (SQLException e){
			throw new RuntimeException(e);
		}
	}
}
