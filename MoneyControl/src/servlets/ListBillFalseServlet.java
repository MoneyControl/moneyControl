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
 * Servlet implementation class ListBill
 */
@WebServlet("/listBillFalseServlet")
public class ListBillFalseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListBillFalseServlet() {
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
			
			String idUser = String.valueOf(user.getIdUser());
			
			BillControl billControl = new BillControl();
			
			List<Bill> list = billControl.listBillFalse(idUser);
			
			request.setAttribute("list", list);
			
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
