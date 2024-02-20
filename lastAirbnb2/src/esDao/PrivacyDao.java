package esDao;

import java.sql.*;

import common.DBConnection;

public class PrivacyDao {
	static Connection conn = DBConnection.getConnection();
	
	public void updateName(String name, int userIdx) {
		String sql = "UPDATE user_info SET user_id = ? WHERE user_idx = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setInt(2, userIdx);
			pstmt.executeUpdate();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void updateEmail(String email, int userIdx) {
		String sql = "UPDATE user_info SET email = ? WHERE user_idx = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setInt(2, userIdx);
			pstmt.executeUpdate();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void updatePhoneNum(String phoneNum, int userIdx) {
		String sql = "UPDATE user_info SET phone_number = ? WHERE user_idx = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, phoneNum);
			pstmt.setInt(2, userIdx);
			pstmt.executeUpdate();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	public void updateAddress(String address, int userIdx) {
		String sql = "UPDATE user_info SET user_regidence = ? WHERE user_idx = ?";
	
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, address);
			pstmt.setInt(2, userIdx);
			pstmt.executeUpdate();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void updateSecondNum(String secondNum, int userIdx) {
		String sql = "UPDATE user_info SET second_number = ? WHERE user_idx = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, secondNum);
			pstmt.setInt(2, userIdx);
			pstmt.executeUpdate();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
