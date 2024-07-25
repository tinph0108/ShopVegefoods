package servlet;

import java.io.IOException;

import dao.ProductDAO;
import entity.Account;
import entity.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class AddProductServlet
 */
@WebServlet({ "/AddProductServlet", "/addProduct" })
public class AddProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 ProductDAO productDAO = new ProductDAO();
		    String newProductID = productDAO.generateNewProductID();
		    request.setAttribute("newProductID", newProductID);
		    request.getRequestDispatcher("manager").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String maSP=request.getParameter("maSP");
		String tenSP=request.getParameter("name");
		String hinh1=request.getParameter("hinh1");
		String hinh2=request.getParameter("hinh2");
		String hinh3=request.getParameter("hinh3");
		String hinh4=request.getParameter("hinh4");
		double gia=Double.parseDouble(request.getParameter("price"));
		String donVi=request.getParameter("donViTinh");
		int khoiLuong=Integer.parseInt(request.getParameter("khoiLuong"));
		int soLuong=Integer.parseInt(request.getParameter("soLuong"));
		String moTa=request.getParameter("moTa");
		String danhMuc=request.getParameter("category");
		String tinhTrang=request.getParameter("tinhTrang");
		
		HttpSession session = request.getSession();
		Account account = (Account) session.getAttribute("acc");
		String sid = account.getuID();
		
		ProductDAO productDAO = new ProductDAO();
		productDAO.insertProduct(maSP, tenSP, gia, donVi, tinhTrang, danhMuc, hinh1, moTa, khoiLuong, soLuong, hinh2, hinh3, hinh4, sid);
		
		response.sendRedirect("manager");
	}

}
