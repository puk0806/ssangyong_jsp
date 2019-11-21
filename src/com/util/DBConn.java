package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConn {
	
	private static Connection connection = null;
	private DBConn() {}
	
	public static Connection getConnection() {
		if( connection == null ) {
			String className = "oracle.jdbc.driver.OracleDriver";
			String url = "jdbc:oracle:thin:@localhost:1521:xe"; // Type 4
			String user = "scott";
			String password = "tiger";
			
			try {
				Class.forName(className);
				connection = DriverManager.getConnection(url, user, password);
			} catch (ClassNotFoundException | SQLException e) { 
				e.printStackTrace();
			}
		} // if 닫기
		return connection;
	} // getConnection 닫기
	
	public static Connection getConnection(
			String url,
			String user, 
			String password) {
		if( connection == null ) {
			String className = "oracle.jdbc.driver.OracleDriver";
			
			try {
				Class.forName(className);
				connection = DriverManager.getConnection(url, user, password);
			} catch (ClassNotFoundException | SQLException e) { 
				e.printStackTrace();
			}
		} // if 닫기
		return connection;
	} // getConnection 닫기
	
	public static void close() {
		if( connection != null ) {
			try {
				connection.close();
			} catch (SQLException e) { 
				e.printStackTrace();
			}			
			connection = null;  // (기억)
		} // if 닫기
	} // close 닫기

} // class 닫기
