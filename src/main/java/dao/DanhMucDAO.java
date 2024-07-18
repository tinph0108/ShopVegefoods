package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import connect.ConnectDB;
import entity.DanhMuc;

public class DanhMucDAO {
	public List<DanhMuc> getAllDanhMuc() {
		List<DanhMuc> listDanhMuc = new ArrayList<>();
		String query = "SELECT * FROM DanhMuc";
		try (Connection conn = ConnectDB.getConnection(); PreparedStatement ps = conn.prepareStatement(query);) {
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				DanhMuc danhMuc = new DanhMuc();
				danhMuc.setMaDanhMuc(rs.getString("maDanhMuc"));
				danhMuc.setTenDanhMuc(rs.getString("tenDanhMuc"));

				listDanhMuc.add(danhMuc);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return listDanhMuc;
	}

	public DanhMuc getDanhMucByMaDM(String maDanhMuc) {
		String query = "SELECT * FROM DanhMuc WHERE maDanhMuc = ?";
		try (Connection conn = ConnectDB.getConnection(); PreparedStatement ps = conn.prepareStatement(query);) {
			ps.setString(1, maDanhMuc);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				DanhMuc danhMuc = new DanhMuc();
				danhMuc.setMaDanhMuc(rs.getString("maDanhMuc"));
				danhMuc.setTenDanhMuc(rs.getString("tenDanhMuc"));
				return danhMuc;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	public boolean insertDanhMuc(DanhMuc danhMuc) {
		String query = "INSERT INTO DanhMuc VALUES(?, ?)";
		try (Connection conn = ConnectDB.getConnection(); PreparedStatement ps = conn.prepareStatement(query);) {
			ps.setString(1, danhMuc.getMaDanhMuc());
			ps.setString(2, danhMuc.getTenDanhMuc());
			return ps.executeUpdate() > 0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean updateDanhMuc(DanhMuc danhMuc) {
		String query = "UPDATE DanhMuc SET tenDanhMuc = ? WHERE maDanhMuc = ?";
		try (Connection conn = ConnectDB.getConnection(); PreparedStatement ps = conn.prepareStatement(query);) {
			ps.setString(1, danhMuc.getTenDanhMuc());
			ps.setString(2, danhMuc.getMaDanhMuc());
			return ps.executeUpdate() > 0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean deleteDanhMuc(String maDanhMuc) {
		String query = "DELETE FROM DanhMuc WHERE maDanhMuc = ?";
		try (Connection conn = ConnectDB.getConnection(); PreparedStatement ps = conn.prepareStatement(query);) {
			ps.setString(1, maDanhMuc);
			return ps.executeUpdate() > 0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
