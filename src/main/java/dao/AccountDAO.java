package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import connect.ConnectDB;
import entity.Account;

public class AccountDAO {
	public Account login(String email, String password) {
		String query = "SELECT * FROM Account WHERE email = ? AND password = ?";
		try(Connection conn = ConnectDB.getConnection(); PreparedStatement ps = conn.prepareStatement(query);) {
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Account account = new Account();
                account.setuID(rs.getString("uID"));
                account.setEmail(rs.getString("email"));
                account.setPassword(rs.getString("password"));
                account.setSell(rs.getBoolean("isSell"));
                account.setAdmin(rs.getBoolean("isAdmin"));
                return account;
            }
        }  catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public Account checkAccountExist(String email) {
		String query = "SELECT * FROM Account WHERE email = ?";
		try (Connection conn = ConnectDB.getConnection(); PreparedStatement ps = conn.prepareStatement(query);) {
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				Account account = new Account();
				account.setuID(rs.getString("uID"));
				account.setEmail(rs.getString("email"));
				account.setPassword(rs.getString("password"));
				account.setSell(rs.getBoolean("isSell"));
				account.setAdmin(rs.getBoolean("isAdmin"));
				return account;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	private String getHighestUID() {
        String query = "SELECT MAX(uID) FROM Account";
        try (Connection conn = ConnectDB.getConnection(); PreparedStatement ps = conn.prepareStatement(query);) {
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
	 private String generateNewUID(String highestUID) {
	        if (highestUID == null) {
	            return "UID1"; // Nếu không có uID nào trước đó, bắt đầu từ UID1
	        }
	        int numericPart = Integer.parseInt(highestUID.replaceAll("\\D+", ""));
	        numericPart++;
	        return "UID" + numericPart;
	    }

	 public void signUp(String email, String password) {
	        String highestUID = getHighestUID();
	        String newUID = generateNewUID(highestUID);

	        String query = "INSERT INTO Account(uID, email, password, isSell, isAdmin) VALUES(?, ?, ?, 0, 0)";
	        try (Connection conn = ConnectDB.getConnection(); PreparedStatement ps = conn.prepareStatement(query);) {
	            ps.setString(1, newUID);
	            ps.setString(2, email);
	            ps.setString(3, password);
	            ps.executeUpdate();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }

	
}