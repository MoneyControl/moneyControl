package control;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import model.dao.UserDao;
import model.vo.User;

public class UserControl {
	
	public boolean registerUser(String userName, String userLastName, String salary, String password, String email, String userType){
		
		String convertPassword;
		MessageDigest algorithm;
				
		try {
			algorithm = MessageDigest.getInstance("SHA-256");
	        byte hashPassword[] = algorithm.digest(password.getBytes());
	        
	        convertPassword = new String(hashPassword);
		
		} catch (NoSuchAlgorithmException e) {
			return false;
		}
		
		double convertSalary = 0;
		
		try {
			convertSalary = Double.parseDouble(salary);
		} catch(NumberFormatException e){
			
		}
		
		int convertUserType;
		
		try{
			convertUserType = Integer.parseInt(userType);
		}catch(NumberFormatException e){
			return false;
		}
		
		User user = new User();
		
		user.setUserName(userName);
		user.setUserLastName(userLastName);
		user.setSalary(convertSalary);
		user.setPassword(convertPassword);
		user.setEmail(email);
		user.setUserType(convertUserType);
		
		UserDao userDao = new UserDao();
		userDao.registerUser(user);
		
		return true;
	}
	
	public User login(String email, String password){
		
		String convertPassword;
		MessageDigest algorithm;
		
		try {
			algorithm = MessageDigest.getInstance("SHA-256");
	        byte hashPassword[] = algorithm.digest(password.getBytes());
	        
	        convertPassword = new String(hashPassword);
		
		} catch (NoSuchAlgorithmException e) {
			return null;
		}
		
		User user = new User();
		
		user.setEmail(email);
		user.setPassword(convertPassword);
		
		UserDao userDao = new UserDao();		
		return userDao.login(user);
	}
	
	public boolean editUser(String userName, String userLastName, String salary, String email, String idUser){
		
		double convertSalary = 0;
		
		try {
			convertSalary = Double.parseDouble(salary);
		} catch(NumberFormatException e){
			
		}
		
		int convertIdUser;
		
		try{
			convertIdUser = Integer.parseInt(idUser);
		} catch (NumberFormatException e){
			return false;
		}
		
		User user = new User();
		
		user.setUserName(userName);
		user.setUserLastName(userLastName);
		user.setSalary(convertSalary);
		user.setEmail(email);
		user.setIdUser(convertIdUser);
		
		UserDao userDao = new UserDao();
		userDao.editUser(user);
		
		return true;
	}
}
