package model.vo;

public class Bill {
	
	private int idBill;
	private User User;
	private double fixedBills;
	private Month Month;
	private int year;
	private double salary;
	
	public int getIdBill() {
		return idBill;
	}
	
	public void setIdBill(int idBill) {
		this.idBill = idBill;
	}
	
	public User getUser() {
		return User;
	}
	
	public void setUser(User user) {
		User = user;
	}
	
	public double getFixedBills() {
		return fixedBills;
	}
	
	public void setFixedBills(double fixedBills) {
		this.fixedBills = fixedBills;
	}

	public Month getMonth() {
		return Month;
	}

	public void setMonth(Month month) {
		Month = month;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public double getSalary() {
		return salary;
	}

	public void setSalary(double salary) {
		this.salary = salary;
	}
}
