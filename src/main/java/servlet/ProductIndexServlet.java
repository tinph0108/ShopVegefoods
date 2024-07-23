package servlet;

import java.io.IOException;
import java.util.List;

import com.google.gson.Gson;

import dao.ProductDAO;
import entity.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class ProductIndexServlet
 */
@WebServlet({ "/ProductIndexServlet", "/index" })
public class ProductIndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductIndexServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String query = request.getParameter("query");
	    ProductDAO productDAO = new ProductDAO();
	    List<Product> products;

	    if (query != null && !query.isEmpty()) {
	        products = productDAO.searchProducts(query);
	        response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");
	        String json = new Gson().toJson(products);
	        response.getWriter().write(json);
	    } else {
	        products = productDAO.getRandomProducts();
	        request.setAttribute("products", products);
	        
	        HttpSession session = request.getSession();
	        if (session != null && session.getAttribute("acc") != null) {
	            request.getRequestDispatcher("indexLogin.jsp").forward(request, response);
	        } else {
	            request.getRequestDispatcher("index.jsp").forward(request, response);
	        }
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
