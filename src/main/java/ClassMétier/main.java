package ClassMétier;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class main {

	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		Singleton singleton = Singleton.getInstance();
		System.out.println("Bonjour");
		try {
		  
		        String sql = "INSERT INTO rendez_vous (medcin_id, user_id, date, nom_patient, time_R, messge, tel, mail) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		        PreparedStatement ps1 = singleton.conn.prepareStatement(sql);
		        ps1.setInt(1, 1);
		        ps1.setInt(2, 2);
		        ps1.setString(3, "2023-12-09");
		        ps1.setString(4, "saber");
		        ps1.setString(5, "22:36");
		        ps1.setString(6, "kkk");
		        ps1.setString(7, "2255515");
		        ps1.setString(8, "hgvgctcf");
		        ps1.executeUpdate();
		   
		} catch (SQLException e) {
		    e.printStackTrace();
		}


}}
