package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import connect.ConnectDB;
import entity.Account;

public class AccountDAO {
	public Account login(String email, String password) {
		String query = "SELECT * FROM Account WHERE email = ? AND password = ?";
		try (Connection conn = ConnectDB.getConnection(); PreparedStatement ps = conn.prepareStatement(query);) {
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
		} catch (Exception e) {
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

	public String getHighestUID() {
		String query = "SELECT MAX(uID) FROM Account WHERE uID LIKE ?";
		try (Connection conn = ConnectDB.getConnection(); PreparedStatement ps = conn.prepareStatement(query);) {
			LocalDate now = LocalDate.now();
			String datePart = now.format(DateTimeFormatter.ofPattern("ddMMyy"));
			ps.setString(1, "UID" + datePart + "%");
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public String generateNewUID(String highestUID) {
		LocalDate now = LocalDate.now();
		String datePart = now.format(DateTimeFormatter.ofPattern("ddMMyy"));
		if (highestUID == null) {
			return "UID" + datePart + "0001"; // Nếu không có uID nào trước đó, bắt đầu từ UIDddMMyy0001
		}
		int numericPart = Integer.parseInt(highestUID.substring(8)) + 1;
		return "UID" + datePart + String.format("%04d", numericPart);
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

	public Account getAccount(String uID) {
		String query = "SELECT * FROM Account WHERE uID = ?";
		try (Connection conn = ConnectDB.getConnection(); PreparedStatement ps = conn.prepareStatement(query);) {
			ps.setString(1, uID);
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

	public void updatePassword(String email, String password) {
		String query = "UPDATE Account SET password = ? WHERE email = ?";
		try (Connection conn = ConnectDB.getConnection(); PreparedStatement ps = conn.prepareStatement(query);) {
			ps.setString(1, password);
			ps.setString(2, email);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<Account> getAllAccounts() {
		List<Account> accounts = new ArrayList<>();
		String query = "SELECT * FROM Account";

		try (Connection conn = ConnectDB.getConnection();
				PreparedStatement ps = conn.prepareStatement(query);
				ResultSet rs = ps.executeQuery()) {

			while (rs.next()) {
				Account account = new Account();
				account.setuID(rs.getString("uID"));
				account.setEmail(rs.getString("email"));
				account.setSell(rs.getBoolean("isSell"));
				account.setAdmin(rs.getBoolean("isAdmin"));
				// Lấy thêm các thuộc tính khác nếu cần
				accounts.add(account);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return accounts;
	}

	public boolean deleteAccount(String uID) {
		String query = "DELETE FROM Account WHERE uID = ?";
		try (Connection conn = ConnectDB.getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
			ps.setString(1, uID);
			int result = ps.executeUpdate();
			return result > 0;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean updateAccountWithoutPassword(Account account) {
        String query = "UPDATE Account SET email = ?, isSell = ?, isAdmin = ? WHERE uID = ?";
        try (Connection conn = ConnectDB.getConnection(); 
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, account.getEmail());
            ps.setBoolean(2, account.isSell());
            ps.setBoolean(3, account.isAdmin());
            ps.setString(4, account.getuID());

            int result = ps.executeUpdate();
            return result > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
	public void addAccount(Account account) {
	    String query = "INSERT INTO Account (uID, email, password, isSell, isAdmin) VALUES (?, ?, ?, ?, ?)";
	    try (Connection conn = ConnectDB.getConnection(); 
	         PreparedStatement ps = conn.prepareStatement(query)) {
	        ps.setString(1, account.getuID());
	        ps.setString(2, account.getEmail());
	        ps.setString(3, account.getPassword());
	        ps.setBoolean(4, account.isSell());
	        ps.setBoolean(5, account.isAdmin());
	        ps.executeUpdate();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
	
}
