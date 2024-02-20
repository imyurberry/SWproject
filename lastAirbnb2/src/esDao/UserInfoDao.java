package esDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.DBConnection;
import esVo.UserInfoVo;

public class UserInfoDao {
	public UserInfoVo getUserInfoByUserIdx(int userIdx) {
		UserInfoVo voRet = null;
		String sql = "SELECT * FROM user_info WHERE user_idx=?";
		
		Connection conn = DBConnection.getConnection();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userIdx);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				int user_idx = rs.getInt("user_idx");
				String user_idString = rs.getString("user_id");
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
				voRet = new UserInfoVo(user_idx, user_idString, user_regidence, user_image, introduce, interact, super_host, join_date, user_school, user_job, hometown, birthday, email, phone_number, second_number, password, active);
			}
			rs.close();
			pstmt.close();
			//conn.close();
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return voRet;
	}
}
