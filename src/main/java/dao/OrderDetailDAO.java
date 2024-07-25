package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import connect.ConnectDB;
import entity.OrderDetail;

public class OrderDetailDAO {
	public void insertOrderDetail(OrderDetail orderDetail) {
        String query = "INSERT INTO OrderDetail (orderID, maSP, quantity, price) VALUES (?, ?, ?, ?)";
        try (Connection conn = ConnectDB.getConnection(); 
        	 PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, orderDetail.getOrder().getOrderID());
            ps.setString(2, orderDetail.getProduct().getMaSP());
            ps.setInt(3, orderDetail.getQuantity());
            ps.setDouble(4, orderDetail.getPrice());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
