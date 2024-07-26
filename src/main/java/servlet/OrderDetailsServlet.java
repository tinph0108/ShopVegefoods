package servlet;

import java.io.IOException;

import dao.OrderDAO;
import entity.OrderProductDetails;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class OrderDetailsServlet
 */
@WebServlet({ "/OrderDetailsServlet", "/orderdetails" })
public class OrderDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderDetailsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
String orderIdStr = request.getParameter("orderID");
        
        if (orderIdStr != null && !orderIdStr.isEmpty()) {
            try {
                int orderID = Integer.parseInt(orderIdStr);
                OrderDAO orderDAO = new OrderDAO();
                OrderProductDetails orderProductDetails = orderDAO.getOrderProductDetailsById(orderID);
                if (orderProductDetails != null) {
                    request.setAttribute("orderProductDetails", orderProductDetails);
                    request.getRequestDispatcher("OrderDetails.jsp").forward(request, response);
                } else {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND, "Order not found");
                }
            } catch (NumberFormatException e) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid order ID");
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Order ID is required");
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  String orderIdStr = request.getParameter("orderID");
	        String maSP = request.getParameter("maSP");
	        String quantityStr = request.getParameter("quantity");
	        
	        if (orderIdStr != null && maSP != null && quantityStr != null) {
	            try {
	                int orderID = Integer.parseInt(orderIdStr);
	                int quantity = Integer.parseInt(quantityStr);

	                OrderDAO orderDAO = new OrderDAO();
	                orderDAO.updateProductQuantity(orderID, maSP, quantity);

	                // Cập nhật lại tổng số tiền của đơn hàng
	                orderDAO.updateOrderTotalAmount(orderID);

	                OrderProductDetails orderProductDetails = orderDAO.getOrderProductDetailsById(orderID);
	                request.setAttribute("orderProductDetails", orderProductDetails);
	                request.getRequestDispatcher("OrderDetails.jsp").forward(request, response);
	            } catch (NumberFormatException e) {
	                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid data");
	            }
	        } else {
	            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing required parameters");
	        }
	}

}
