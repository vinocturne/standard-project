package org.standard.project.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MariaDBSelectTest {
	
	public static void main(String[] args) {
		String url = "jdbc:mysql://localhost:3306/standard";
		String user = "root";
		String password = "12345";
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			System.out.println("드라이버 검색 성공");
			Connection conn = DriverManager.getConnection(url, user, password);
			System.out.println(conn);
			String Select ="Select * from customer";
			Statement stmt= conn.createStatement();
			ResultSet rs = stmt.executeQuery(Select);
			while(rs.next()) {
			
				String id = rs.getString(1);
				String pwd = rs.getString(2);

				System.out.println(id+","+ pwd);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println("드라이버 검색 실패");
		} catch (SQLException e) {
			System.out.println("Connection Error!");
			e.printStackTrace();
		}
	}

}
