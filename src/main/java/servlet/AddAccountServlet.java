package servlet;

import java.io.IOException;
import java.util.UUID;

import dao.AccountDAO;
import entity.Account;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddAccountServlet
 */
@WebServlet({ "/AddAccountServlet", "/addAccount" })
public class AddAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddAccountServlet() {
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
		 String email = request.getParameter("email");
	        String password = request.getParameter("password");
	        boolean isSell = Boolean.parseBoolean(request.getParameter("sell"));
	        boolean isAdmin = Boolean.parseBoolean(request.getParameter("admin"));

	        AccountDAO accountDAO = new AccountDAO();
	        String highestUID = accountDAO.getHighestUID();
	        String newUID = accountDAO.generateNewUID(highestUID);

	        Account account = new Account(newUID, email, password, isSell, isAdmin);
	        accountDAO.addAccount(account);

	        response.sendRedirect("viewAccounts");
	}

}
