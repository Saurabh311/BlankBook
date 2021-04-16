package database;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import beans.UserBean;

public class SQLcon {

	static Connection userCon = null;
	static Connection storyCon = null;
	static PreparedStatement stmt = null;
	static ResultSet rs = null;

	public static boolean connectSQL() {

		try {

			// driver setup
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (Exception ex) {
			// handle the error
			System.out.println("Exception Driver: " + ex);
			return false;
		}

		try {
			userCon = DriverManager.getConnection("jdbc:mysql://localhost:3306/users?serverTimezone=UTC",
					DatabaseLogin.getuName(), DatabaseLogin.getuPass());
			
			storyCon = DriverManager.getConnection("jdbc:mysql://localhost:3306/story?serverTimezone=UTC",
					DatabaseLogin.getuName(), DatabaseLogin.getuPass());
			return true;

		} catch (SQLException ex) {
			// handle any errors
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());
			return false;
		}

	}

	public static boolean userSQL(UserBean bean) {
		
		// test a query
		try {
			String requestQuery = "SELECT * FROM users WHERE email = ? and password = ?";

			stmt = userCon.prepareStatement(requestQuery);

			stmt.setString(1, bean.getEmail());
			stmt.setString(2, bean.getPassword());

			rs = stmt.executeQuery();
			// ResultSet return
			while (rs.next()) {

				// print them
				System.out.println(rs.getInt(1) + "  " + rs.getString(2) + "  " + rs.getString(3));

				bean.setName(rs.getString("fullname"));
				return true;
			}
			userCon.endRequest();
			userCon.close();

		} catch (SQLException ex) {
			// TODO Auto-generated catch block
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());

		}
		return false;

	}
	
	public static void addStoryToSql(String hashTag, String story, String creator) {
		try {
			
			String requestQuery = "INSERT INTO `story`(`hashTag`, `story`, `creator`) VALUES (?,?,?)";

			stmt = storyCon.prepareStatement(requestQuery);

			stmt.setString(1, hashTag);
			stmt.setString(2, story);
			stmt.setString(3, creator);

			stmt.executeUpdate();
			
			storyCon.endRequest();
			
		} catch (SQLException e) {
			System.out.println("addStoryToSql");
			System.out.println("SQLException: " + e.getMessage());
			System.out.println("SQLState: " + e.getSQLState());
			System.out.println("VendorError: " + e.getErrorCode());
		}
	}
	
	public static ResultSet getStoryFromSql() {
		try {
			
			String requestQuery = "SELECT * FROM story";

			stmt = storyCon.prepareStatement(requestQuery);
			rs = stmt.executeQuery();
			storyCon.endRequest();			
			
			return rs;
			
		} catch (SQLException e) {
			System.out.println("getStoryFromSql");
			System.out.println("SQLException: " + e.getMessage());
			System.out.println("SQLState: " + e.getSQLState());
			System.out.println("VendorError: " + e.getErrorCode());
		}
		return null;
	}
	
	public static void stopStoryConnectionSql() {
		
		try {
			storyCon.close();			
		} catch (SQLException e) {
			System.out.println("stopStoryConnectionSql");
			System.out.println("SQLException: " + e.getMessage());
			System.out.println("SQLState: " + e.getSQLState());
			System.out.println("VendorError: " + e.getErrorCode());
		}
	}    
		

}
