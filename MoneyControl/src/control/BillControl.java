package control;

import java.util.List;

import model.dao.BillDao;
import model.vo.Bill;
import model.vo.Month;
import model.vo.User;

public class BillControl {
	
	public boolean registerBill(String idUser, String fixedBills, String idMonth, String salary, String waterBill, String energyBill, String divideWater, String divideEnergy){
		
		double convertFixedBills;
		double convertSalary;
		double convertWaterBill;
		double convertEnergyBill;
		
		double result = 0;
		
		try{
			convertFixedBills = Double.parseDouble(fixedBills);
			convertSalary = Double.parseDouble(salary);
			convertWaterBill = Double.parseDouble(waterBill);
			convertEnergyBill = Double.parseDouble(energyBill);
		} catch(NumberFormatException e){
			return false;
		}
		
		int convertIdUser;
		int convertIdMonth;
		
		try{
			convertIdUser = Integer.parseInt(idUser);
			convertIdMonth = Integer.parseInt(idMonth);
		} catch (NumberFormatException e){
			return false;
		}
		
		//verifica se o valor que a conta ser� dividida � nulo
		if(divideWater.isEmpty()){
			
			result = result + convertWaterBill;
			
		} else {
			
			int convertDivideWater;
			
			try{
				convertDivideWater = Integer.parseInt(divideWater);
			} catch (NumberFormatException e){
				return false;
			}
			
			double waterBillDivided = convertWaterBill / convertDivideWater;
			
			result = result + waterBillDivided;
		}
		
		//verifica se o valor que a conta ser� dividida � nulo
		if(divideEnergy.isEmpty()){
			
			result = result + convertEnergyBill;
			
		} else {
			
			int convertDivideEnergy;
			
			try{
				convertDivideEnergy = Integer.parseInt(divideEnergy);
			} catch (NumberFormatException e){
				return false;
			}
			
			double energyBillDivided = convertEnergyBill / convertDivideEnergy;
			
			result = result + energyBillDivided;
		}
		
		result = result + convertFixedBills;
		
		Bill bill = new Bill();
		
		User user  = new User();
		user.setIdUser(convertIdUser);
		bill.setUser(user);

		bill.setFixedBills(result);
		
		Month month = new Month();
		month.setIdMonth(convertIdMonth);
		bill.setMonth(month);
		
		bill.setSalary(convertSalary);
		
		BillDao billDao = new BillDao();
		billDao.registerBill(bill);
		
		return true;
	}
	
	public List<Bill> listBillFalse(String idUser){
		
		int convertIdUser;
		
		try{
			convertIdUser = Integer.parseInt(idUser);
		} catch (NumberFormatException e){
			return null;
		}
		
		List<Bill> list;
		
		BillDao billDao = new BillDao();
		
		list = billDao.listBillFalse(convertIdUser);
		
		return list;
	}
	
	public List<Bill> listBillTrue(String idUser){
		
		int convertIdUser;
		
		try{
			convertIdUser = Integer.parseInt(idUser);
		} catch (NumberFormatException e){
			return null;
		}
		
		List<Bill> list;
		
		BillDao billDao = new BillDao();
		
		list = billDao.listBillTrue(convertIdUser);
		
		return list;
	}
	
	public boolean changeBillStatus(String idBill){
		
		int convertIdBill;
		
		try{
			convertIdBill = Integer.parseInt(idBill);
		} catch (NumberFormatException e){
			return false;
		}
		
		Bill bill = new Bill();
		
		bill.setIdBill(convertIdBill);
		
		BillDao billDao = new BillDao();
		
		billDao.changeBillStatus(bill);
		
		return true;
	}
	
	public boolean changeBillStatusInverse(String idBill){
		
		int convertIdBill;
		
		try{
			convertIdBill = Integer.parseInt(idBill);
		} catch (NumberFormatException e){
			return false;
		}
		
		Bill bill = new Bill();
		
		bill.setIdBill(convertIdBill);
		
		BillDao billDao = new BillDao();
		
		billDao.changeBillStatusInverse(bill);
		
		return true;
	}
}
