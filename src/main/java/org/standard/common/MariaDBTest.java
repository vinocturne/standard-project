package org.standard.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MariaDBTest {

		public static void main(String[] args) {
			String url = "jdbc:mysql://localhost/jdbc2?createDatabaseIfNotExist=true";
			String user = "root";
			String password = "12345";
			try {
				Class.forName("org.mariadb.jdbc.Driver");
				System.out.println("드라이버 검색 성공");
				Connection conn = DriverManager.getConnection(url, user, password);
				System.out.println(conn);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
				System.out.println("드라이버 검색 실패");
			} catch (SQLException e) {
				System.out.println("Connection Error!");
				e.printStackTrace();
			}
			
			
			

		}

	
}
