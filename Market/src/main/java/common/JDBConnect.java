package common;

import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class JDBConnect{

	public ResultSet 			rs;
	public Statement 			stmt;
	public Connection 			con;
	public PreparedStatement	psmt;
	
	public JDBConnect() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url 		= "jdbc:mysql://localhost:3306/jspWebMarket";
			String user 	= "root";
			String password = "1234";
			con = DriverManager.getConnection(url, user, password);
			System.out.println("DB 연결 성공");
		} 
		catch(Exception e) {
			System.out.println("DB 연결 실패");
			e.printStackTrace();
		}
	}
	
	public void close() {
		try {
			if (rs != null)		rs.close();
			if (con != null)	con.close();
			if (stmt != null)	stmt.close();
			if (psmt != null)	psmt.close();
			System.out.println("DB 연결 닫기 성공\n");
		} 
		catch (Exception e) {
			System.out.println("DB 연결 닫기 실패\n");
			e.printStackTrace();
		}
	}
}