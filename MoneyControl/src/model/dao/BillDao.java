package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.vo.Bill;
import model.vo.Month;
import model.vo.User;

public class BillDao {
	
	Connection connection;

	public BillDao() {
		this.connection = new ConnectionFactory().getConexao();
	}
	
	public void registerBill(Bill bill){
		
		String sql = "insert into userBills (idUser, fixedBills, idMonth, salary) values (?,?,?,?)";
		
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			
			stmt.setInt(1, bill.getUser().getIdUser());
			stmt.setDouble(2, bill.getFixedBills());
			stmt.setInt(3, bill.getMonth().getIdMonth());
			stmt.setDouble(4, bill.getSalary());
			
			stmt.execute();
			stmt.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public List<Bill> listBillFalse(int idUser){
		
		List<Bill> list = new ArrayList<Bill>();
		
		String sql = "select u.idUser, b.idBill, b.idMonth, m.name, b.salary, b.fixedBills from user as u join userBills as b on u.idUser=b.idUser join months as m on b.idMonth=m.idMonth where b.status=0 and u.idUser=? order by b.idMonth asc";
				
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			
			stmt.setInt(1, idUser);
			
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){
				
				Bill bill = new Bill();
				
				User user = new User();
				user.setIdUser(rs.getInt("u.idUser"));
				user.setSalary(rs.getDouble("b.salary"));
				bill.setUser(user);
				
				bill.setIdBill(rs.getInt("b.idBill"));
				
				Month month = new Month();
				month.setIdMonth(rs.getInt("b.idMonth"));
				month.setName(rs.getString("m.name"));
				bill.setMonth(month);
				
				bill.setFixedBills(rs.getDouble("b.fixedBills"));
				
				list.add(bill);
			}
			
			stmt.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	public List<Bill> listBillTrue(int idUser){
		
		List<Bill> list = new ArrayList<Bill>();
		
		String sql = "select u.idUser, b.idBill, b.idMonth, m.name, b.salary, b.fixedBills from user as u join userBills as b on u.idUser=b.idUser join months as m on b.idMonth=m.idMonth where b.status=1 and u.idUser=? order by b.idMonth asc";
		
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			
			stmt.setInt(1, idUser);
			
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){
				
				Bill bill = new Bill();
				
				User user = new User();
				user.setIdUser(rs.getInt("u.idUser"));
				user.setSalary(rs.getDouble("b.salary"));
				bill.setUser(user);
				
				bill.setIdBill(rs.getInt("b.idBill"));
				
				Month month = new Month();
				month.setIdMonth(rs.getInt("b.idMonth"));
				month.setName(rs.getString("m.name"));
				bill.setMonth(month);
				
				bill.setFixedBills(rs.getDouble("b.fixedBills"));
				
				list.add(bill);
			}
			
			stmt.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	public void changeBillStatus(Bill bill){
		
		String sql = "update userBills set status=1 where idBill=? ";
		
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			
			stmt.setInt(1, bill.getIdBill());
			
			stmt.execute();
			stmt.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void changeBillStatusInverse(Bill bill){
		
		String sql = "update userBills set status=0 where idBill=? ";
		
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			
			stmt.setInt(1, bill.getIdBill());
			
			stmt.execute();
			stmt.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
