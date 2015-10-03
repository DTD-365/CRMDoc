package com.ebook.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBUtil {

	public static Connection getConnection() {

		String driverName = "com.mysql.jdbc.Driver";
		String strUrl = "jdbc:mysql://localhost:3306/ebook?userUnicode=true&characterEncoding=GBK&user=root&password=root";
		String userName = "root";
		String password = "root";
		Connection conn = null;

		try {
			Class.forName(driverName);
			conn = DriverManager.getConnection(strUrl, userName, password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}

	//close query connection
	public static void close(PreparedStatement pst, Connection conn,
			ResultSet rs) {
		try {

			if (pst != null) {
				pst.close();
			}
			if (conn != null && !conn.isClosed()) {
				conn.close();
			}
			if (rs != null) {
				rs.close();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	//close update connection
	public static void close(Statement st, Connection conn) {
		try {

			if (st != null) {
				st.close();
			}
			if (conn != null && !conn.isClosed()) {
				conn.close();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
