package servlet;

import java.io.IOException;
import java.time.LocalDateTime;

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

/**
 * Servlet implementation class RequestPassword
 */
@WebServlet({ "/RequestPassword", "/requestPassword" })
public class RequestPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RequestPassword() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("requestPassword.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		AccountDAO accountDAO = new AccountDAO();
		String email = request.getParameter("email");
		Account account = accountDAO.checkAccountExist(email);
		if (account == null) {
			request.setAttribute("mess", "Email does not exist");
			request.getRequestDispatcher("requestPassword.jsp").forward(request, response);
			return;
		}
		ResetService service = new ResetService();
		String token = service.generateToken();
		String linkReset = "http://localhost:8080/21018801_PhanHuuTin/resetPassword?token=" + token;

		TokenForgetPassword newTokenForget = new TokenForgetPassword(token, service.expireDateTime(), false, account);
		TokenForgetDAO daoToken = new TokenForgetDAO();
		boolean isInsert = daoToken.insertTokenForget(newTokenForget);
		if (!isInsert) {
            request.setAttribute("mess", "Error! Please try again!");
            request.getRequestDispatcher("requestPassword.jsp").forward(request, response
            		);
            return;
            }
		boolean isSend = service.sendEmailRS(email, linkReset, account.getEmail());
		if (!isSend) {
			request.setAttribute("mess", "Cant not send request!");
			request.getRequestDispatcher("requestPassword.jsp").forward(request, response);
			return;
		}
		request.setAttribute("mess", "Send email success! Please check your email to reset password!");
		request.getRequestDispatcher("requestPassword.jsp").forward(request, response);

	}

}
