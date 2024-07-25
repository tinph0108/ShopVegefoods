package servlet;

import java.io.IOException;

import dao.CartDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateCartItemServlet
 */
@WebServlet({ "/UpdateCartItemServlet", "/updateCartItem" })
public class UpdateCartItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCartItemServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  String maCartStr = request.getParameter("maCart");
	        String amountStr = request.getParameter("amount");

	        if (maCartStr == null || amountStr == null || maCartStr.isEmpty() || amountStr.isEmpty()) {
	            response.getWriter().write("error");
	            return;
	        }

	        try {
	            int maCart = Integer.parseInt(maCartStr);
	            int amount = Integer.parseInt(amountStr);

	            CartDAO cartDAO = new CartDAO();
	            cartDAO.updateCartItemAmount(maCart, amount);

	            response.getWriter().write("success");
	        } catch (NumberFormatException e) {
	            response.getWriter().write("error");
	        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
