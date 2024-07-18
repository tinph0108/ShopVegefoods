package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import connect.ConnectDB;
import entity.DanhMuc;
import entity.Product;

public class ProductDAO {
	public List<Product> getAllProduct() {
		List<Product> products = new ArrayList<>();
		String query = "SELECT * FROM Product";
		try (Connection conn = ConnectDB.getConnection(); PreparedStatement ps = conn.prepareStatement(query);) {
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Product product = new Product();
				product.setMaSP(rs.getString("maSP"));
				product.setTenSP(rs.getString("tenSP"));
				product.setGiaBan(rs.getDouble("giaBan"));
				product.setDonViTinh(rs.getString("donViTinh"));
				product.setTinhTrang(rs.getString("tinhTrang"));
				product.setHinh1(rs.getString("hinh1"));
				product.setMoTa(rs.getString("moTa"));
				product.setKhoiLuong(rs.getInt("khoiLuong"));
				product.setSoLuong(rs.getInt("soLuong"));
				product.setHinh2(rs.getString("hinh2"));
				product.setHinh3(rs.getString("hinh3"));
				product.setHinh4(rs.getString("hinh4"));

				// Set danh muc
				String maDanhMuc = rs.getString("maDanhMuc");
				DanhMuc danhMuc = new DanhMucDAO().getDanhMucByMaDM(maDanhMuc);
				product.setDanhMuc(danhMuc);

				products.add(product);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return products;
	}

	public Product getProductByMaSP(String maSP) {
		String query = "SELECT * FROM Product WHERE maSP = ?";
		try (Connection conn = ConnectDB.getConnection(); PreparedStatement ps = conn.prepareStatement(query);) {
			ps.setString(1, maSP);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				Product product = new Product();
				product.setMaSP(rs.getString("maSP"));
				product.setTenSP(rs.getString("tenSP"));
				product.setGiaBan(rs.getDouble("giaBan"));
				product.setDonViTinh(rs.getString("donViTinh"));
				product.setTinhTrang(rs.getString("tinhTrang"));
				product.setHinh1(rs.getString("hinh1"));
				product.setMoTa(rs.getString("moTa"));
				product.setKhoiLuong(rs.getInt("khoiLuong"));
				product.setSoLuong(rs.getInt("soLuong"));
				product.setHinh2(rs.getString("hinh2"));
				product.setHinh3(rs.getString("hinh3"));
				product.setHinh4(rs.getString("hinh4"));

				// Set danh muc
				String maDanhMuc = rs.getString("maDanhMuc");
				DanhMuc danhMuc = new DanhMucDAO().getDanhMucByMaDM(maDanhMuc);
				product.setDanhMuc(danhMuc);

				return product;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	public List<Product> getProductByMaDM(String maDanhMuc) {
		List<Product> products = new ArrayList<>();
		String query = "SELECT * FROM Product WHERE maDanhMuc = ?";
		try (Connection conn = ConnectDB.getConnection(); PreparedStatement ps = conn.prepareStatement(query);) {
			ps.setString(1, maDanhMuc);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Product product = new Product();
				product.setMaSP(rs.getString("maSP"));
				product.setTenSP(rs.getString("tenSP"));
				product.setGiaBan(rs.getDouble("giaBan"));
				product.setDonViTinh(rs.getString("donViTinh"));
				product.setTinhTrang(rs.getString("tinhTrang"));
				product.setHinh1(rs.getString("hinh1"));
				product.setMoTa(rs.getString("moTa"));
				product.setKhoiLuong(rs.getInt("khoiLuong"));
				product.setSoLuong(rs.getInt("soLuong"));
				product.setHinh2(rs.getString("hinh2"));
				product.setHinh3(rs.getString("hinh3"));
				product.setHinh4(rs.getString("hinh4"));

				// Set danh muc
				DanhMuc danhMuc = new DanhMucDAO().getDanhMucByMaDM(maDanhMuc);
				product.setDanhMuc(danhMuc);

				products.add(product);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return products;
	}

	public boolean insertProduct(Product product) {
		String query = "INSERT INTO Product  VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try (Connection conn = ConnectDB.getConnection(); PreparedStatement ps = conn.prepareStatement(query);) {
			ps.setString(1, product.getMaSP());
			ps.setString(2, product.getTenSP());
			ps.setDouble(3, product.getGiaBan());
			ps.setString(4, product.getDonViTinh());
			ps.setString(5, product.getTinhTrang());
			ps.setString(6, product.getDanhMuc().getMaDanhMuc());
			ps.setString(7, product.getHinh1());
			ps.setString(8, product.getMoTa());
			ps.setInt(9, product.getKhoiLuong());
			ps.setInt(10, product.getSoLuong());
			ps.setString(11, product.getHinh2());
			ps.setString(12, product.getHinh3());
			ps.setString(13, product.getHinh4());
			return ps.executeUpdate() > 0;
		} catch (Exception e) {
			e.printStackTrace();
			return false;

		}
	}

	public boolean updateProduct(Product product) {
		String query = "UPDATE Product SET tenSP = ?, giaBan = ?, donViTinh = ?, tinhTrang = ?, maDanhMuc = ?, hinh1 = ?, moTa = ?, khoiLuong = ?, soLuong = ?, hinh2 = ?, hinh3 = ?, hinh4 = ? WHERE maSP = ?";
		try (Connection conn = ConnectDB.getConnection(); PreparedStatement ps = conn.prepareStatement(query);) {
			ps.setString(1, product.getTenSP());
			ps.setDouble(2, product.getGiaBan());
			ps.setString(3, product.getDonViTinh());
			ps.setString(4, product.getTinhTrang());
			ps.setString(5, product.getDanhMuc().getMaDanhMuc());
			ps.setString(6, product.getHinh1());
			ps.setString(7, product.getMoTa());
			ps.setInt(8, product.getKhoiLuong());
			ps.setInt(9, product.getSoLuong());
			ps.setString(10, product.getHinh2());
			ps.setString(11, product.getHinh3());
			ps.setString(12, product.getHinh4());
			ps.setString(13, product.getMaSP());
			return ps.executeUpdate() > 0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean deleteProduct(String maSP) {
		String query = "DELETE FROM Product WHERE maSP = ?";
		try (Connection conn = ConnectDB.getConnection(); PreparedStatement ps = conn.prepareStatement(query);) {
			ps.setString(1, maSP);
			return ps.executeUpdate() > 0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
