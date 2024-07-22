package servlet;

import java.io.IOException;
import java.util.List;

import dao.ProductDAO;
import entity.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ProductDetailServlet
 */
@WebServlet({ "/ProductDetailServlet", "/productDetail" })
public class ProductDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductDetailServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String productId = request.getParameter("productId");
		if (productId != null) {
			ProductDAO productDAO = new ProductDAO();
			Product product = productDAO.getProductByMaSP(productId);
			List<Product> relatedProducts = productDAO.getRelatedProducts(product.getDanhMuc().getMaDanhMuc(),
					productId);

			if (product != null) {
				request.setAttribute("product", product);
				request.setAttribute("relatedProducts", relatedProducts);

				request.getRequestDispatcher("ProductSingle.jsp").forward(request, response);

			} else {
				response.sendRedirect("product");
			}
		} else {
			response.sendRedirect("product");
		}
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
