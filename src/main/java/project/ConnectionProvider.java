package project;

import java.sql.*;

public class ConnectionProvider {
	public static Connection getCon() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");  // Correct driver
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_shop", "root", "root"); // Corrected JDBC URL
			return con;
		} catch (Exception e) {
			System.out.println("Database Connection Error: " + e);
			return null;
		}
	}
}
