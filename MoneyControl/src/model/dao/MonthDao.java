package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.vo.Month;

public class MonthDao {
	
	Connection connection;

	public MonthDao() {
		this.connection = new ConnectionFactory().getConexao();
	}
	
	public List<Month> listMonth(){
		
		List<Month> list = new ArrayList<Month>();
		
		String sql = "select * from months";
		
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){
				
				Month month = new Month();
				
				month.setIdMonth(rs.getInt("idMonth"));
				month.setName(rs.getString("name"));
				
				list.add(month);
			}
			
			stmt.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
}
