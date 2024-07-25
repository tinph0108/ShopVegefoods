package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import connect.ConnectDB;
import entity.Order;

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
}
