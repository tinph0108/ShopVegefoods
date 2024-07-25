package servlet;

import java.io.IOException;

import dao.AccountDAO;
import entity.Account;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EditAccountServlet
 */
@WebServlet({ "/EditAccountServlet", "/editAccount" })
public class EditAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditAccountServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String uID = request.getParameter("uID");
	        String email = request.getParameter("email");
	        boolean isSell = Boolean.parseBoolean(request.getParameter("sell"));
	        boolean isAdmin = Boolean.parseBoolean(request.getParameter("admin"));

	        Account account = new Account();
	        account.setuID(uID);
	        account.setEmail(email);
	        account.setSell(isSell);
	        account.setAdmin(isAdmin);

	        AccountDAO accountDAO = new AccountDAO();
	        boolean isUpdated = accountDAO.updateAccountWithoutPassword(account);

	        response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");

	        if (isUpdated) {
	            response.getWriter().write("{\"status\":\"success\"}");
	        } else {
	            response.getWriter().write("{\"status\":\"error\"}");
	        }
	}

}
