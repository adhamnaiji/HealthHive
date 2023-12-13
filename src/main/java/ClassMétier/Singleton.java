package ClassMétier;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public final class Singleton {
	private static Singleton instance;
	public static Connection conn;
	private Singleton(Connection conn){
		this.conn=conn;
	}
	public static Singleton getInstance() {
		if (instance == null){ 
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");	
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafes", "root", "");
				instance = new Singleton(conn);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return instance;
	}
}
