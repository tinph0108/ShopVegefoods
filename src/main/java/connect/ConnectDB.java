package connect;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectDB {
	private static final String URL = "jdbc:sqlserver://localhost:1433;databaseName=Vegefoods;encrypt=true;trustServerCertificate=true";
	private static final String USER = "sa";
	private static final String PASSWORD = "123";

	public static Connection getConnection() {
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			return DriverManager.getConnection(URL, USER, PASSWORD);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	public static void main(String[] args) {
		try {
			Connection conn = ConnectDB.getConnection();
			if (conn != null) {
				System.out.println("Kết nối thành công");
			} else {
				System.out.println("Kết nối thất bại");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
