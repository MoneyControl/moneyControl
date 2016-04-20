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
 * Servlet implementation class RegisterUser
 */
@WebServlet("/registerUserServlet")
public class RegisterUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public RegisterUserServlet() {
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
			
			if(user.getUserType()==1){
				
				request.getRequestDispatcher("WEB-INF/registerUser.jsp").forward(request, response);
			}
			
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
			String password = request.getParameter("password");
			String email = request.getParameter("email");
			String userType = request.getParameter("userType");
			
			UserControl userControl = new UserControl();
			
			boolean ok = userControl.registerUser(userName, userLastName, salary, password, email, userType);
			
			if(ok){
				request.setAttribute("registered", true);
			} else {
				request.setAttribute("registered", false);
			}
			
			request.getRequestDispatcher("WEB-INF/registerUser.jsp").forward(request, response);

		} else {
			response.sendRedirect("loginServlet");
		}
	}
}
