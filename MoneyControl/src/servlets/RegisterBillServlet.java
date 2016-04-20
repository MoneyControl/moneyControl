package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.BillControl;
import control.MonthControl;
import model.vo.Month;
import model.vo.User;

/**
 * Servlet implementation class RegisterBillServlet
 */
@WebServlet("/registerBillServlet")
public class RegisterBillServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterBillServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		
		User user = (User) session.getAttribute("user");
		
		if(user != null){
			request.setAttribute("user", user);
			
			MonthControl monthControl = new MonthControl();
			
			List<Month> list = monthControl.listMonth();
			
			request.setAttribute("list", list);
			
			request.getRequestDispatcher("WEB-INF/registerBill.jsp").forward(request, response);
			
		} else {
			response.sendRedirect("loginServlet");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		
		User user = (User) session.getAttribute("user");
		
		if(user != null){
			
			String idUser = String.valueOf(user.getIdUser());
			String fixedBills = request.getParameter("fixedBills");
			String idMonth = request.getParameter("idMonth");
			String salary = request.getParameter("salary");
			String waterBill = request.getParameter("waterBill");
			String energyBill = request.getParameter("energyBill");
			String divideWater = request.getParameter("divideWater");
			String divideEnergy = request.getParameter("divideEnergy");
						
			BillControl billControl = new BillControl();
			
			boolean ok = billControl.registerBill(idUser, fixedBills, idMonth, salary, waterBill, energyBill, divideWater, divideEnergy);
			
			if(ok){
				request.setAttribute("registered", true);
			} else {
				request.setAttribute("registered", false);
			}
			
			request.getRequestDispatcher("WEB-INF/registerBill.jsp").forward(request, response);
			
		} else {
			response.sendRedirect("loginServlet");
		}
	}

}
