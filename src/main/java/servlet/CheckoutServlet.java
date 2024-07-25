package servlet;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import dao.CartDAO;
import dao.EmailUtil;
import dao.OrderDAO;
import dao.OrderDetailDAO;
import dao.ProductDAO;
import entity.Account;
import entity.Cart;
import entity.Order;
import entity.OrderDetail;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class CheckoutServlet
 */
@WebServlet("/CheckoutServlet")
public class CheckoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckoutServlet() {
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

        CartDAO cartDAO = new CartDAO();
        List<Cart> cartItems = cartDAO.getCartItems(account.getuID());
        if (cartItems.isEmpty()) {
            response.sendRedirect("Cart.jsp");
            return;
        }

        request.setAttribute("cartItems", cartItems);
        double totalPrice = cartItems.stream()
                .mapToDouble(cartItem -> cartItem.getProduct().getGiaBan() * cartItem.getAmount()).sum();
        request.setAttribute("totalPrice", totalPrice);

        request.getRequestDispatcher("Checkout.jsp").forward(request, response);
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("acc");
        if (account == null) {
            response.sendRedirect("login");
            return;
        }

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");

        CartDAO cartDAO = new CartDAO();
        List<Cart> cartItems = cartDAO.getCartItems(account.getuID());

        if (cartItems.isEmpty()) {
            response.sendRedirect("Cart.jsp");
            return;
        }

        OrderDAO orderDAO = new OrderDAO();
        Order order = new Order(account, firstName, lastName, address, phone, email, LocalDate.now(), calculateTotal(cartItems));
        int orderId = orderDAO.insertOrder(order);
        order.setOrderID(orderId);

        OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
        ProductDAO productDAO = new ProductDAO();
        for (Cart cartItem : cartItems) {
            OrderDetail orderDetail = new OrderDetail(order, cartItem.getProduct(), cartItem.getAmount(), cartItem.getProduct().getGiaBan());
            orderDetailDAO.insertOrderDetail(orderDetail);

            // Cập nhật số lượng sản phẩm
            int currentQuantity = cartItem.getProduct().getSoLuong();
            int newQuantity = currentQuantity - cartItem.getAmount();
            productDAO.updateProductQuantity(cartItem.getProduct().getMaSP(), newQuantity);
        }

        // Gửi email xác nhận đơn hàng
        String subject = "Xác nhận đơn hàng";
        String content = "Cảm ơn bạn đã đặt hàng!\n\n" + generateOrderDetails(order, cartItems);
        EmailUtil.sendEmail(email, subject, content);

        // Xóa các sản phẩm trong giỏ hàng
        cartDAO.clearCart(account.getuID());

        response.sendRedirect("orderConfirmation.jsp");
    }
    
    
    private double calculateTotal(List<Cart> cartItems) {
        return cartItems.stream().mapToDouble(cartItem -> cartItem.getProduct().getGiaBan() * cartItem.getAmount()).sum();
    }

    private String generateOrderDetails(Order order, List<Cart> cartItems) {
        StringBuilder sb = new StringBuilder();
        sb.append("Thông tin đơn hàng:\n");
        sb.append("Họ tên: ").append(order.getFirstName()).append(" ").append(order.getLastName()).append("\n");
        sb.append("Địa chỉ: ").append(order.getAddress()).append("\n");
        sb.append("Số điện thoại: ").append(order.getPhone()).append("\n");
        sb.append("Email: ").append(order.getEmail()).append("\n");
        sb.append("Ngày đặt hàng: ").append(order.getOrderDate()).append("\n");
        sb.append("Tổng cộng: ").append(order.getTotalAmount()).append(" VNĐ\n");
        sb.append("\nChi tiết đơn hàng:\n");

        for (Cart cartItem : cartItems) {
            sb.append(cartItem.getProduct().getTenSP()).append(" - Số lượng: ").append(cartItem.getAmount()).append(" - Giá: ").append(cartItem.getProduct().getGiaBan()).append(" VNĐ\n");
        }

        return sb.toString();
    }

}
