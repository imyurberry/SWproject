package esDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import common.DBConnection;
import esVo.UserInfoVo;

public class LoginDao {
	static Connection conn = DBConnection.getConnection();
	public boolean getLoginByPw(String phoneNum, String pw) {
		String sql = "SELECT password FROM user_info WHERE phone_number = ?";
		String password = "";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, phoneNum);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				password = rs.getString("password");
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return (password.equals(pw));
	}
	
	public int getIdxByPw(String phone_number) {
		String sql = "SELECT user_idx FROM user_info WHERE phone_number = ?";
		int idx = 0;
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, phone_number);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				idx = rs.getInt("user_idx");
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return idx;
	}
	
	public UserInfoVo getUserInfoBy(int userIdx){
		String sql = "SELECT * FROM user_info WHERE user_idx = ?";
		UserInfoVo list1 = null;
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userIdx);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				 int user_idx = rs.getInt("user_idx");
				 String user_id = rs.getString("user_id");
				 String user_regidence = rs.getString("user_regidence");
				 String user_image = rs.getString("user_image");
				 String introduce = rs.getString("introduce");
				 String interact = rs.getString("interact");
				 String super_host = rs.getString("super_host");
				 String join_date = rs.getString("join_date");
				 String user_school = rs.getString("user_school");
				 String user_job = rs.getString("user_job");
				 String hometown = rs.getString("hometown");
				 String birthday = rs.getString("birthday");
				 String email = rs.getString("email");
				 String phone_number = rs.getString("phone_number");
				 String second_number = rs.getString("second_number");
				 String password = rs.getString("password");
				 String active = rs.getString("active");
				 
				 list1 = new UserInfoVo(user_idx, user_id, user_regidence, user_image, introduce, interact, super_host, join_date, user_school, user_job, hometown, birthday, email, phone_number, second_number, password, active);
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) { e.printStackTrace(); }
		return list1;
	}
	
	public int getCountAlarm(int userIdx) {
		String sql = "SELECT count(*) FROM notification WHERE user_idx= ?";
		int howManyAlarm = 0;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userIdx);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				howManyAlarm = rs.getInt(1);
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return howManyAlarm;
	}
	
}



























