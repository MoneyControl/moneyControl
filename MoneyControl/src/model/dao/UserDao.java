package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.vo.User;

public class UserDao {
	
	Connection connection;

	public UserDao() {
		this.connection = new ConnectionFactory().getConexao();
	}
	
	public void registerUser(User user){
		
		String sql = "insert into user (userName, userLastName, salary, password, email, userType) values (?,?,?,?,?,?)";
		
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			
			stmt.setString(1, user.getUserName());
			stmt.setString(2, user.getUserLastName());
			stmt.setDouble(3, user.getSalary());
			stmt.setString(4, user.getPassword());
			stmt.setString(5, user.getEmail());
			stmt.setInt(6, user.getUserType());
			
			stmt.execute();
			stmt.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public User login(User user){
		
		String sql = "select * from user where email=? and password=?";
		
		User u = null;
		
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			
			stmt.setString(1, user.getEmail());
			stmt.setString(2, user.getPassword());
			
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){
				
				u = new User();
				u.setIdUser(rs.getInt("idUser"));
				u.setUserName(rs.getString("userName"));
				u.setUserLastName(rs.getString("userLastName"));
				u.setSalary(rs.getDouble("salary"));
				u.setEmail(rs.getString("email"));
				u.setUserType(rs.getInt("userType"));
			}
			
			stmt.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return u;
	}
	
	public void editUser(User user){
		
		String sql = "update user set userName=?, userLastName=?, salary=?, email=? where idUser=?";
		
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			
			stmt.setString(1, user.getUserName());
			stmt.setString(2, user.getUserLastName());
			stmt.setDouble(3, user.getSalary());
			stmt.setString(4, user.getEmail());
			stmt.setInt(5, user.getIdUser());
			
			stmt.execute();
			stmt.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
