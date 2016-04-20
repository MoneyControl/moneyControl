package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.UserControl;
import model.vo.User;

/**
 * Servlet implementation class EditUserServlet
 */
@WebServlet("/editUserServlet")
public class EditUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditUserServlet() {
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
			
			request.getRequestDispatcher("WEB-INF/editUser.jsp").forward(request, response);
			
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
			
			String userName = request.getParameter("userName");
			String userLastName = request.getParameter("userLastName");
			String salary = request.getParameter("salary");
			String email = request.getParameter("email");
			String idUser = String.valueOf(user.getIdUser());
			
			UserControl userControl = new UserControl();
			
			boolean ok = userControl.editUser(userName, userLastName, salary, email, idUser);
			
			if(ok){
				request.setAttribute("edited", true);
			} else {
				request.setAttribute("edited", false);
			}
			
			request.getRequestDispatcher("WEB-INF/editUser.jsp").forward(request, response);

		} else {
			response.sendRedirect("loginServlet");
		}
	}
}
