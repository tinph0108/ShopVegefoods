package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import connect.ConnectDB;
import entity.Account;
import entity.Cart;
import entity.Product;

public class CartDAO {
	public void addToCart(String uID, String maSP, int amount) {
	    try (Connection conn = ConnectDB.getConnection()) {
	        // Kiểm tra xem sản phẩm đã tồn tại trong giỏ hàng chưa
	        String sql = "SELECT * FROM Cart WHERE uID = ? AND maSP = ?";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setString(1, uID);
	        ps.setString(2, maSP);
	        ResultSet rs = ps.executeQuery();
	        if (rs.next()) {
	            // Nếu sản phẩm đã tồn tại, tăng số lượng
	            sql = "UPDATE Cart SET amount = amount + ? WHERE uID = ? AND maSP = ?";
	            ps = conn.prepareStatement(sql);
	            ps.setInt(1, amount);
	            ps.setString(2, uID);
	            ps.setString(3, maSP);
	        } else {
	            // Nếu sản phẩm chưa tồn tại, thêm mới
	            sql = "INSERT INTO Cart (uID, maSP, amount) VALUES (?, ?, ?)";
	            ps = conn.prepareStatement(sql);
	            ps.setString(1, uID);
	            ps.setString(2, maSP);
	            ps.setInt(3, amount);
	        }
	        ps.executeUpdate();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
	public boolean updateCartItem(String maCart, int delta) {
	    try (Connection conn = ConnectDB.getConnection()) {
	        String sql = "UPDATE Cart SET amount = amount + ? WHERE maCart = ?";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setInt(1, delta);
	        ps.setString(2, maCart);
	        int rowsAffected = ps.executeUpdate();

	        return rowsAffected > 0;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}

	
	 public List<Cart> getCartItems(String uid) {
	        List<Cart> cartItems = new ArrayList<>();
	        String query = "SELECT c.maCart, c.amount, p.maSP, p.tenSP, p.giaBan, p.hinh1, p.donViTinh, p.tinhTrang, p.moTa, p.khoiLuong, p.soLuong, p.hinh2, p.hinh3, p.hinh4, p.maDanhMuc " +
	                       "FROM Cart c JOIN Product p ON c.maSP = p.maSP " +
	                       "WHERE c.uID = ?";
	        try (Connection conn = ConnectDB.getConnection();
	             PreparedStatement ps = conn.prepareStatement(query)) {
	            ps.setString(1, uid);
	            ResultSet rs = ps.executeQuery();
	            while (rs.next()) {
	                Product product = new Product(rs.getString("maSP"), rs.getString("tenSP"), rs.getDouble("giaBan"), 
	                    rs.getString("donViTinh"), rs.getString("tinhTrang"), null, rs.getString("hinh1"), 
	                    rs.getString("moTa"), rs.getInt("khoiLuong"), rs.getInt("soLuong"), rs.getString("hinh2"), 
	                    rs.getString("hinh3"), rs.getString("hinh4"), null);
	                Cart cart = new Cart(rs.getString("maCart"), null, product, rs.getInt("amount"));
	                cartItems.add(cart);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return cartItems;
	    }
	
	public void updateCartItem(Cart cart) {
        String query = "UPDATE Cart SET amount = ? WHERE maCart = ?";
        try (Connection conn = ConnectDB.getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, cart.getAmount());
            ps.setString(2, cart.getMaCart());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
	public void removeCartItem(String maCart) {
        String query = "DELETE FROM Cart WHERE maCart = ?";
        try (Connection conn = ConnectDB.getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, maCart);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
	public void updateCartItemAmount(int maCart, int amount) {
	    String query = "UPDATE Cart SET amount = ? WHERE maCart = ?";
	    try (Connection conn = ConnectDB.getConnection();
	         PreparedStatement ps = conn.prepareStatement(query)) {
	        ps.setInt(1, amount);
	        ps.setInt(2, maCart);
	        ps.executeUpdate();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
	 public void updateCartItemAmount(String productID, int amount) {
	        String query = "UPDATE Cart SET amount = ? WHERE uID = ?";
	        try (Connection conn = ConnectDB.getConnection();
	   	         PreparedStatement ps = conn.prepareStatement(query)) {
	            ps.setInt(1, amount);
	            ps.setString(2, productID);
	            ps.executeUpdate();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }

		public void clearCart(String uid) {
			String query = "DELETE FROM Cart WHERE uID = ?";
			try (Connection conn = ConnectDB.getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
				ps.setString(1, uid);
				ps.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
}
