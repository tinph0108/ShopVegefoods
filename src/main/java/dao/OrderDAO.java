package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import connect.ConnectDB;
import entity.Order;
import entity.OrderProductDetails;
import entity.Product;

public class OrderDAO {
	public int insertOrder(Order order) {
		String query = "INSERT INTO [Order] (uID, firstName, lastName, address, phone, email, orderDate, totalAmount) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		try (Connection conn = ConnectDB.getConnection();
				PreparedStatement ps = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
			ps.setString(1, order.getAccount().getuID());
			ps.setString(2, order.getFirstName());
			ps.setString(3, order.getLastName());
			ps.setString(4, order.getAddress());
			ps.setString(5, order.getPhone());
			ps.setString(6, order.getEmail());
			ps.setDate(7, Date.valueOf(order.getOrderDate()));
			ps.setDouble(8, order.getTotalAmount());
			ps.executeUpdate();

			ResultSet rs = ps.getGeneratedKeys();
			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public List<Order> listAllOrders() {
		List<Order> listOrder = new ArrayList<>();
		String sql = "SELECT * FROM [Order] ORDER BY orderDate DESC;";
		try (Connection conn = ConnectDB.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql);
				ResultSet rs = ps.executeQuery()) {
			while (rs.next()) {
				Order order = new Order();
				order.setOrderID(rs.getInt("orderID"));
				order.setAccount(new AccountDAO().getAccount(rs.getString("uID")));
				order.setFirstName(rs.getString("firstName"));
				order.setLastName(rs.getString("lastName"));
				order.setAddress(rs.getString("address"));
				order.setPhone(rs.getString("phone"));
				order.setEmail(rs.getString("email"));
				order.setOrderDate(rs.getDate("orderDate").toLocalDate());
				order.setTotalAmount(rs.getDouble("totalAmount"));
				listOrder.add(order);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listOrder;

	}

	 public OrderProductDetails getOrderProductDetailsById(int orderID) {
	        Order order = null;
	        List<Product> products = new ArrayList<>();

	        try (Connection conn = ConnectDB.getConnection()) {
	            String orderSql = "SELECT * FROM [Order] WHERE orderID = ?";
	            try (PreparedStatement orderPs = conn.prepareStatement(orderSql)) {
	                orderPs.setInt(1, orderID);
	                try (ResultSet orderRs = orderPs.executeQuery()) {
	                    if (orderRs.next()) {
	                        order = new Order();
	                        order.setOrderID(orderRs.getInt("orderID"));
	                        order.setFirstName(orderRs.getString("firstName"));
	                        order.setLastName(orderRs.getString("lastName"));
	                        order.setAddress(orderRs.getString("address"));
	                        order.setPhone(orderRs.getString("phone"));
	                        order.setEmail(orderRs.getString("email"));
	                        order.setOrderDate(orderRs.getDate("orderDate").toLocalDate());
	                        order.setTotalAmount(orderRs.getDouble("totalAmount"));
	                    }
	                }
	            }

	            String productSql = "SELECT p.*, od.quantity FROM Product p INNER JOIN OrderDetail od ON p.maSP = od.maSP WHERE od.orderID = ?";
	            try (PreparedStatement productPs = conn.prepareStatement(productSql)) {
	                productPs.setInt(1, orderID);
	                try (ResultSet productRs = productPs.executeQuery()) {
	                    while (productRs.next()) {
	                        Product product = new Product();
	                        product.setMaSP(productRs.getString("maSP"));
	                        product.setTenSP(productRs.getString("tenSP"));
	                        product.setGiaBan(productRs.getDouble("giaBan"));
	                        product.setHinh1(productRs.getString("hinh1"));
	                        product.setSoLuong(productRs.getInt("quantity"));
	                        products.add(product);
	                    }
	                }
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return new OrderProductDetails(order, products);
	    }
	
	
	 public boolean updateProductQuantity(int orderID, String maSP, int quantity) {
	        String sql = "UPDATE OrderDetail SET quantity = ? WHERE orderID = ? AND maSP = ?";

	        try (Connection conn = ConnectDB.getConnection();
	             PreparedStatement ps = conn.prepareStatement(sql)) {
	            ps.setInt(1, quantity);
	            ps.setInt(2, orderID);
	            ps.setString(3, maSP);

	            int rowsUpdated = ps.executeUpdate();
	            return rowsUpdated > 0;
	        } catch (Exception e) {
	            e.printStackTrace();
	            return false;
	        }
	    }
	 public void updateOrderTotalAmount(int orderID) {
	        String query = "UPDATE [Order] SET totalAmount = (SELECT SUM(p.giaBan * od.quantity) FROM OrderDetail od JOIN Product p ON od.maSP = p.maSP WHERE od.orderID = ?) WHERE orderID = ?";
	        try (Connection conn = ConnectDB.getConnection(); 
	             PreparedStatement ps = conn.prepareStatement(query)) {
	            ps.setInt(1, orderID);
	            ps.setInt(2, orderID);
	            ps.executeUpdate();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }

}
