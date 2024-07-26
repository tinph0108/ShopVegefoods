package servlet;

import java.io.IOException;

import dao.OrderDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateQuantityOrderServlet
 */
@WebServlet({ "/UpdateQuantityOrderServlet", "/updateQuantity" })
public class UpdateQuantityOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateQuantityOrderServlet() {
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
	        String maSP = request.getParameter("maSP");
	        int quantity = Integer.parseInt(request.getParameter("quantity"));

	        OrderDAO orderDAO = new OrderDAO();
	        boolean success = orderDAO.updateProductQuantity(orderID, maSP, quantity);

	        if (success) {
	            response.sendRedirect("orderdetails?orderID=" + orderID);
	        } else {
	            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Unable to update quantity");
	        }
	}

}
