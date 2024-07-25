package servlet;

import java.io.IOException;
import java.util.List;

import dao.DanhMucDAO;
import dao.ProductDAO;
import entity.Account;
import entity.DanhMuc;
import entity.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class ManagerServlet
 */
@WebServlet({ "/ManagerServlet", "/manager" })
public class ManagerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		DanhMucDAO DanhMucDAO = new DanhMucDAO();
		HttpSession session = request.getSession();
		Account account = (Account) session.getAttribute("acc");
		String id = account.getuID();
		ProductDAO productDAO = new ProductDAO();
		List<Product> listProduct = productDAO.getProductBySellID(id);
		List<DanhMuc> danhMucs = DanhMucDAO.getAllDanhMuc();
		
		request.setAttribute("listP", listProduct);
		request.setAttribute("categories", danhMucs);
		request.getRequestDispatcher("ManagerProduct.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
