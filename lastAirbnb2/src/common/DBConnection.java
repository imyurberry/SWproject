package common;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	static Connection conn; 
	

//	static String driver = "oracle.jdbc.driver.OracleDriver";
//	static String url = "jdbc:oracle:thin:@localhost:1521:xe";
//	static String dbId = "airbnb";
//	static String dbPw = "1234";

//	static String driver = "oracle.jdbc.driver.OracleDriver";
//	static String url = "jdbc:oracle:thin:@localhost:1521:xe";
//	static String dbId = "airbnbOwn";
//	static String dbPw = "1234";
	

	static String driver = "oracle.jdbc.driver.OracleDriver";
	static String url = "jdbc:oracle:thin:@localhost:1521:xe";
	static String dbId = "airbnbtest";
	static String dbPw = "123123";

//	static String driver = "oracle.jdbc.driver.OracleDriver";
//	static String url = "jdbc:oracle:thin:@localhost:1521:xe";
//	static String dbId = "airbnbtest";
//	static String dbPw = "123123";

	
	public static Connection getConnection() {
		if(conn==null) {
			try {
				Class.forName(driver);
				conn = DriverManager.getConnection(url,dbId, dbPw);
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return conn;
	}
}


