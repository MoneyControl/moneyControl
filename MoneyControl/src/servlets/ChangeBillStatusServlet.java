package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.vo.Bill;
import model.vo.User;
import control.BillControl;

/**
 * Servlet implementation class ChangeBillStatus
 */
@WebServlet("/changeBillStatusServlet")
public class ChangeBillStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeBillStatusServlet() {
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
			
			BillControl billControl = new BillControl();
			
			String idBill = request.getParameter("idBill");
			String idUser = String.valueOf(user.getIdUser());
			
			boolean ok = billControl.changeBillStatus(idBill);
			
			if(ok){
				request.setAttribute("statusChanged", true);
				
				List<Bill> list = billControl.listBillFalse(idUser);
				
				request.setAttribute("list", list);
				
			} else {
				request.setAttribute("statusChanged", false);
				
				List<Bill> list = billControl.listBillFalse(idUser);
				
				request.setAttribute("list", list);
			}
			
			request.getRequestDispatcher("WEB-INF/listBillFalse.jsp").forward(request, response);
			
		} else {
			response.sendRedirect("loginServlet");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
