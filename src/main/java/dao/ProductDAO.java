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
				product.setAccount(new AccountDAO().getAccount(rs.getString("sell_ID")));

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
				product.setAccount(new AccountDAO().getAccount(rs.getString("sell_ID")));

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
				product.setAccount(new AccountDAO().getAccount(rs.getString("sell_ID")));

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
		String query = "INSERT INTO Product  VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
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
			ps.setString(14, product.getAccount().getuID());
			return ps.executeUpdate() > 0;
		} catch (Exception e) {
			e.printStackTrace();
			return false;

		}
	}
	
	public void insertProduct(String maSP, String tenSP, double giaBan, String donViTinh, String tinhTrang, String maDanhMuc, String hinh1, String moTa, int khoiLuong, int soLuong, String hinh2, String hinh3, String hinh4, String sell_ID) {
        String query = "INSERT INTO Product VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        try (Connection conn = ConnectDB.getConnection(); PreparedStatement ps = conn.prepareStatement(query);) {
            ps.setString(1, maSP);
            ps.setString(2, tenSP);
            ps.setDouble(3, giaBan);
            ps.setString(4, donViTinh);
            ps.setString(5, tinhTrang);
            ps.setString(6, maDanhMuc);
            ps.setString(7, hinh1);
            ps.setString(8, moTa);
            ps.setInt(9, khoiLuong);
            ps.setInt(10, soLuong);
            ps.setString(11, hinh2);
            ps.setString(12, hinh3);
            ps.setString(13, hinh4);
            ps.setString(14, sell_ID);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
	}
	
	
	public String getMaxProductID() {
	    String query = "SELECT MAX(maSP) FROM Product";
	    try (Connection conn = ConnectDB.getConnection(); PreparedStatement ps = conn.prepareStatement(query); ResultSet rs = ps.executeQuery()) {
	        if (rs.next()) {
	            return rs.getString(1);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return null;
	}

	public String generateNewProductID() {
	    String maxProductID = getMaxProductID();
	    if (maxProductID != null && !maxProductID.isEmpty()) {
	        String numericPart = maxProductID.substring(2); // Assuming the format is SPxxxx
	        int newID = Integer.parseInt(numericPart) + 1;
	        return "SP" + String.format("%05d", newID); // Format to 5 digits
	    }
	    return "SP00001"; // If no products exist, start with SP00001
	}

	public void editProduct(String tenSP, double giaBan, String donViTinh, String tinhTrang, String maDanhMuc, String hinh1, String moTa, int khoiLuong, int soLuong, String hinh2, String hinh3, String hinh4, String maSP) {
		String query = "UPDATE Product SET tenSP = ?, giaBan = ?, donViTinh = ?, tinhTrang = ?, maDanhMuc = ?, hinh1 = ?, moTa = ?, khoiLuong = ?, soLuong = ?, hinh2 = ?, hinh3 = ?, hinh4 = ? WHERE maSP = ?";
        try (Connection conn = ConnectDB.getConnection(); PreparedStatement ps = conn.prepareStatement(query);) {
               ps.setString(1, tenSP);
               ps.setDouble(2, giaBan);
               ps.setString(3, donViTinh);
               ps.setString(4, tinhTrang);
               ps.setString(5, maDanhMuc);
               ps.setString(6, hinh1);
               ps.setString(7, moTa);
               ps.setInt(8, khoiLuong);
               ps.setInt(9, soLuong);
               ps.setString(10, hinh2);
               ps.setString(11, hinh3);
               ps.setString(12, hinh4);
               ps.setString(13, maSP);
               
               ps.executeUpdate();
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
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
			ps.setString(14, product.getAccount().getuID());

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
	
	
	public List<Product> getRelatedProducts(String maDanhMuc, String maSP) {
		List<Product> products = new ArrayList<>();
		String query = "SELECT * FROM Product WHERE maDanhMuc = ? AND maSP != ?";
		try (Connection conn = ConnectDB.getConnection(); PreparedStatement ps = conn.prepareStatement(query);) {
			ps.setString(1, maDanhMuc);
			ps.setString(2, maSP);
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
				product.setAccount(new AccountDAO().getAccount(rs.getString("sell_ID")));
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
	
	// Viết hàm lấy 8 sản phẩm ngẫu nhiên
	public List<Product> getRandomProducts() {
		List<Product> products = new ArrayList<>();
		String query = "SELECT TOP 8 * FROM Product ORDER BY NEWID()";
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
				product.setAccount(new AccountDAO().getAccount(rs.getString("sell_ID")));

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
	
	// tìm kiếm danh sách sản phẩm
	public List<Product> searchProducts(String search) {
		List<Product> products = new ArrayList<>();
		String query = "SELECT * FROM Product WHERE tenSP LIKE ?";
		try (Connection conn = ConnectDB.getConnection(); PreparedStatement ps = conn.prepareStatement(query);) {
			ps.setString(1, "%" + search + "%");
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
				product.setAccount(new AccountDAO().getAccount(rs.getString("sell_ID")));

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
	
	
	public List<Product> getProductBySellID(String sid) {
		List<Product> products = new ArrayList<>();
        String query = "SELECT * FROM Product WHERE sell_ID = ?";
        try (Connection conn = ConnectDB.getConnection(); PreparedStatement ps = conn.prepareStatement(query);) {
            ps.setString(1, sid);
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
                product.setAccount(new AccountDAO().getAccount(rs.getString("sell_ID")));

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
	
	public void updateProductQuantity(String maSP, int newQuantity) {
        String query = "UPDATE Product SET soLuong = ? WHERE maSP = ?";
        try (Connection conn = ConnectDB.getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, newQuantity);
            ps.setString(2, maSP);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
	
	
}
