package servlet;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.List;

import dao.CartDAO;
import entity.Account;
import entity.Cart;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet({ "/CartServlet", "/cart" })
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CartServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
	    Account account = (Account) session.getAttribute("acc");
	    DecimalFormat df = new DecimalFormat("#,###");
	    if (account == null) {
	        response.sendRedirect("login");
	        return;
	    }

	    CartDAO cartDAO = new CartDAO();
	    List<Cart> cartItems = cartDAO.getCartItems(account.getuID());
	    int totalItems = cartItems.stream().mapToInt(Cart::getAmount).sum();
	    

	    request.setAttribute("cartItems", cartItems);
	    session.setAttribute("totalItems", totalItems);

	    double totalPrice = cartItems.stream()
	            .mapToDouble(cartItem -> cartItem.getProduct().getGiaBan() * cartItem.getAmount()).sum();
	  
	    request.setAttribute("totalPrice", df.format(totalPrice));

	    request.getRequestDispatcher("Cart.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
