package servlet;

import java.io.IOException;
import java.sql.SQLException;

import dao.AccountDAO;
import dao.ResetService;
import dao.TokenForgetDAO;
import entity.Account;
import entity.TokenForgetPassword;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class ResetPassword
 */
@WebServlet({ "/ResetPassword", "/resetPassword" })
public class ResetPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ResetPassword() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		TokenForgetDAO tokenForgetDAO = new TokenForgetDAO();
		AccountDAO accountDAO = new AccountDAO();
		String token = request.getParameter("token");
		HttpSession session = request.getSession();
		try {

			if (token != null) {
				TokenForgetPassword tokenForget = tokenForgetDAO.getTokenForget(token);
				ResetService service = new ResetService();
				if (tokenForget == null) {
					request.setAttribute("mess", "Token is invalid");
					request.getRequestDispatcher("requestPassword.jsp").forward(request, response);
					return;
				}
				if (tokenForget.isUsed()) {
					request.setAttribute("mess", "Token is used");
					request.getRequestDispatcher("requestPassword.jsp").forward(request, response);
					return;
				}
				if (service.isExpireTime(tokenForget.getExpiryTime())) {
					request.setAttribute("mess", "Token is expired time");
					request.getRequestDispatcher("requestPassword.jsp").forward(request, response);
					return;
				}
				Account account = accountDAO.getAccount(tokenForget.getAccount().getuID());
				request.setAttribute("email", account.getEmail());
				session.setAttribute("token", tokenForget.getToken());
				request.getRequestDispatcher("resetPassword.jsp").forward(request, response);
				return;

			} else {
				request.getRequestDispatcher("requestPassword.jsp").forward(request, response);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		TokenForgetDAO tokenForgetDAO = new TokenForgetDAO();
		String email = request.getParameter("email");
		String newPassword = request.getParameter("newpassword");
		String cfPassword = request.getParameter("confirmPassword");
		
		if (!newPassword.equals(cfPassword)) {
			request.setAttribute("mess", "Password and confirm password is not match");
			request.setAttribute("email", email);
			request.getRequestDispatcher("resetPassword.jsp").forward(request, response);
			return;
		}
		HttpSession session = request.getSession();
		String token = (String) session.getAttribute("token");
		TokenForgetPassword tokenForget;
		try {
			tokenForget = tokenForgetDAO.getTokenForget(token);
			ResetService service = new ResetService();
			if (tokenForget == null) {
				request.setAttribute("mess", "Token is invalid");
				request.getRequestDispatcher("requestPassword.jsp").forward(request, response);
				return;
			}
			if (tokenForget.isUsed()) {
				request.setAttribute("mess", "Token is used");
				request.getRequestDispatcher("requestPassword.jsp").forward(request, response);
				return;
			}
			if (service.isExpireTime(tokenForget.getExpiryTime())) {
				request.setAttribute("mess", "Token is expired time");
				request.getRequestDispatcher("requestPassword.jsp").forward(request, response);
				return;
			}
			AccountDAO accountDAO = new AccountDAO();
			accountDAO.updatePassword(email, newPassword);
			
			tokenForget.setToken(token);
			tokenForget.setUsed(true);
			
			
			tokenForgetDAO.updateStatus(tokenForget);
			
			
			request.getRequestDispatcher("indexLogin.jsp").forward(request, response);	
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
