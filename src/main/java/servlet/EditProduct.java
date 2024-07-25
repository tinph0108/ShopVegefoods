package servlet;

import java.io.IOException;

import dao.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EditProduct
 */
@WebServlet({"/EditProduct", "/editProduct"})
public class EditProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditProduct() {
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
		
	    ProductDAO productDAO = new ProductDAO();
	    productDAO.editProduct(tenSP, gia, donVi, tinhTrang, danhMuc, hinh1, moTa, khoiLuong, soLuong, hinh2, hinh3, hinh4, maSP);
	    response.sendRedirect("manager");
	     
	}

}
