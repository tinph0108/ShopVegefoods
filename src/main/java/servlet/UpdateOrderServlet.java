package servlet;

import java.io.IOException;

import dao.OrderDAO;
import entity.Order;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateOrderServlet
 */
@WebServlet({ "/UpdateOrderServlet", "/updateOrder" })
public class UpdateOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateOrderServlet() {
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
		 int orderID = Integer.parseInt(request.getParameter("orderID"));
	        String firstName = request.getParameter("firstName");
	        String lastName = request.getParameter("lastName");
	        String address = request.getParameter("address");
	        String phone = request.getParameter("phone");

	        Order order = new Order();
	        order.setOrderID(orderID);
	        order.setFirstName(firstName);
	        order.setLastName(lastName);
	        order.setAddress(address);
	        order.setPhone(phone);

	        OrderDAO orderDAO = new OrderDAO();
	        orderDAO.updateOrder(order);

	        response.sendRedirect("orderlist");
	}

}
