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
 * Servlet implementation class DanhMucServlet
 */
@WebServlet({ "/DanhMucServlet", "/category" })
public class DanhMucServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DanhMucServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String danhMucID = request.getParameter("maDanhMuc");
		    ProductDAO productDAO = new ProductDAO();
		    DanhMucDAO danhMucDAO = new DanhMucDAO();
		    List<Product> products;
		    
		    if (danhMucID == null || danhMucID.equals("all")) {
		        products = productDAO.getAllProduct();
		    } else {
		        products = productDAO.getProductByMaDM(danhMucID);
		    }
		    
		    List<DanhMuc> danhMucs = danhMucDAO.getAllDanhMuc();
		    request.setAttribute("products", products);
		    request.setAttribute("categories", danhMucs);
		    request.getRequestDispatcher("product").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
