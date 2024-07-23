package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import connect.ConnectDB;
import entity.Account;
import entity.TokenForgetPassword;

public class TokenForgetDAO {

	public boolean insertTokenForget(TokenForgetPassword token) {
		String query = "INSERT INTO tokenForgetPassword (token, expiryTime, isUsed, uID) VALUES (?, ?, ?, ?)";
		try (Connection conn = ConnectDB.getConnection(); PreparedStatement ps = conn.prepareStatement(query);) {
			ps.setString(1, token.getToken());
			ps.setTimestamp(2, Timestamp.valueOf(token.getExpiryTime()));
			ps.setBoolean(3, token.isUsed());
			ps.setString(4, token.getAccount().getuID());
			return ps.executeUpdate() > 0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public TokenForgetPassword getTokenForget(String token) throws SQLException {
		String query = "SELECT * FROM tokenForgetPassword WHERE token = ?";
		try (Connection conn = ConnectDB.getConnection(); PreparedStatement ps = conn.prepareStatement(query);) {
			ps.setString(1, token);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				TokenForgetPassword tokenForget = new TokenForgetPassword();
				tokenForget.setToken(rs.getString("token"));
				tokenForget.setExpiryTime(rs.getTimestamp("expiryTime").toLocalDateTime());
				tokenForget.setUsed(rs.getBoolean("isUsed"));
				AccountDAO accountDAO = new AccountDAO();
				Account account = accountDAO.getAccount(rs.getString("uID"));
				tokenForget.setAccount(account);
				return tokenForget;
			}

			return null;
		}
	}

	public void updateStatus(TokenForgetPassword token) {
        String query = "UPDATE tokenForgetPassword SET isUsed = ? WHERE token = ?";
        try (Connection conn = ConnectDB.getConnection(); PreparedStatement ps = conn.prepareStatement(query);) {
            ps.setBoolean(1, token.isUsed());
            ps.setString(2, token.getToken());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
	}
}
