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
 * Servlet implementation class LoadProduct
 */
@WebServlet({ "/LoadProduct", "/loadProduct" })
public class LoadProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoadProduct() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("pid");
		ProductDAO productDAO = new ProductDAO();
		Product p = productDAO.getProductByMaSP(id);
		DanhMucDAO DanhMucDAO = new DanhMucDAO();
		List<DanhMuc> danhMucs = DanhMucDAO.getAllDanhMuc();
		
		request.setAttribute("detail", p);
		request.setAttribute("categories", danhMucs);
		request.getRequestDispatcher("EditProduct.jsp").forward(request, response);
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
