package servlet;

import java.io.IOException;

import dao.AccountDAO;
import entity.Account;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class SignUpServlet
 */
@WebServlet({ "/SignUpServlet", "/signup" })
public class SignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SignUpServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String repassword = request.getParameter("repassword");
		if (!password.equals(repassword)) {
			request.setAttribute("message2", "Passwords do not match");
			request.getRequestDispatcher("Login.jsp").forward(request, response);
		} else {
			AccountDAO accountDAO = new AccountDAO();
			Account account = accountDAO.checkAccountExist(email);
			if (account == null) {
				accountDAO.signUp(email, password);
				Account acc = accountDAO.login(email, password);
				if (acc != null) {
					HttpSession session = request.getSession();
					session.setAttribute("acc", acc);
					session.setMaxInactiveInterval(10 * 60);
					response.sendRedirect("index");
				} else {
					response.sendRedirect("Login.jsp");
				}
			} else {
				request.setAttribute("alertMessage", "Account already exists");
				request.getRequestDispatcher("Login.jsp").forward(request, response);
			}
		}
	}
}
