package control;

import java.util.List;

import model.dao.MonthDao;
import model.vo.Month;

public class MonthControl {
	
	public List<Month> listMonth(){
		
		List<Month> list;
		
		MonthDao monthDao = new MonthDao();
		
		list = monthDao.listMonth();
		
		return list;
	}
}
