package Test;

import java.util.List;

import dao.DanhMucDAO;
import dao.ProductDAO;
import entity.DanhMuc;
import entity.Product;

public class MainTest {
	public static void main(String[] args) {
		ProductDAO productDAO = new ProductDAO();
		DanhMucDAO danhMucDAO = new DanhMucDAO();

//		List<Product> listProduct = productDAO.getAllProduct();
//		for (Product product : listProduct) {
//			System.out.println(product);
//		}
//		List<DanhMuc> listDanhMuc = danhMucDAO.getAllDanhMuc();
//		for (DanhMuc danhMuc : listDanhMuc) {
//			System.out.println(danhMuc);
//		}
		
		
		// Thêm sản phẩm mới
//        DanhMuc danhMuc = danhMucDAO.getDanhMucByMaDM("DM002");
//        Product newProduct = new Product("SP003", "Chuối", 15000, "Kg", "Còn hàng", danhMuc, "link-to-image1", "Mô tả về chuối", 1000, 100, "link-to-image2", "link-to-image3", "link-to-image4");
//        boolean isInserted = productDAO.insertProduct(newProduct);
//        System.out.println("Thêm sản phẩm mới: " + isInserted);
//		
		 // Cập nhật sản phẩm
//        Product updatedProduct = productDAO.getProductByMaSP("SP003");
//        if (updatedProduct != null) {
//            updatedProduct.setTenSP("Chuối tiêu");
//            boolean isUpdated = productDAO.updateProduct(updatedProduct);
//            System.out.println("Cập nhật sản phẩm: " + isUpdated);
//        }
		
		 // Xóa sản phẩm
//        boolean isDeleted = productDAO.deleteProduct("SP003");
//        System.out.println("Xóa sản phẩm: " + isDeleted);
        
//        List<DanhMuc> listDanhMuc = danhMucDAO.getAllDanhMuc();
//        for (DanhMuc danhMuc : listDanhMuc) {
//            System.out.println(danhMuc);
//        }
		
		List<Product> list=productDAO.getProductByMaDM("DM001");
		for (Product product : list) {
            System.out.println(product);
		}
		
	}
}
