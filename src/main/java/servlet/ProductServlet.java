package servlet;

import java.io.IOException;
import java.util.List;

import dao.DanhMucDAO;
import dao.ProductDAO;
import entity.DanhMuc;
import entity.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ProductServlet
 */
@WebServlet({ "/ProductServlet", "/product" })
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    ProductDAO productDAO = new ProductDAO();
	    DanhMucDAO danhMucDAO = new DanhMucDAO();

	    String categoryId = request.getParameter("categoryId");
	    System.out.println("Category ID: " + categoryId);

	    List<Product> products;
	    if (categoryId == null || categoryId.equals("all")) {
	        products = productDAO.getAllProduct();
	    } else {
	        products = productDAO.getProductByMaDM(categoryId);
	    }

	    List<DanhMuc> categories = danhMucDAO.getAllDanhMuc();
	    System.out.println("Products found: " + products.size());
	    for (Product product : products) {
	        System.out.println(product.getTenSP());
	    }

	    request.setAttribute("products", products);
	    request.setAttribute("categories", categories);
	    request.setAttribute("selectedCategory", categoryId);

	    request.getRequestDispatcher("Shop.jsp").forward(request, response);
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
