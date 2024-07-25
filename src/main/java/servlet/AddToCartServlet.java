package servlet;

import java.io.IOException;
import java.util.List;

import dao.CartDAO;
import dao.ProductDAO;
import entity.Account;
import entity.Cart;
import entity.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class AddCartServlet
 */
@WebServlet({ "/AddCartServlet", "/addToCart" })
public class AddToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddToCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("acc");
        if (account == null) {
            response.sendRedirect("login");
            return;
        }

        String maSP = request.getParameter("maSP");
        int amount = Integer.parseInt(request.getParameter("amount"));

        ProductDAO productDAO = new ProductDAO();
        Product product = productDAO.getProductByMaSP(maSP);

        Cart cartItem = new Cart();
        cartItem.setAccount(account);
        cartItem.setProduct(product);
        cartItem.setAmount(amount);

        CartDAO cartDAO = new CartDAO();
        cartDAO.addToCart(cartItem);

        // Cập nhật tổng số lượng sản phẩm trong giỏ hàng
        List<Cart> cartItems = cartDAO.getCartItems(account.getuID());
        int totalItems = cartItems.stream().mapToInt(Cart::getAmount).sum();
        session.setAttribute("totalItems", totalItems);

        response.sendRedirect("cart");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
