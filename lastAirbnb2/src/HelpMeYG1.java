import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import myDao.Main3Dao;

// 테이블 r, u 에서 
public class HelpMeYG1 {
	public static void main(String[] args) throws Exception {
		Connection conn = Main3Dao.conn;
		
		String sql = "SELECT review_idx, written_date FROM review";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			int reviewIdx = rs.getInt("review_idx");
			String writtenDate = rs.getString("written_date");
			if(writtenDate==null || writtenDate.length()<=4) continue;
			if(writtenDate.contains("년") && !writtenDate.contains("년 ")) continue;
			if(writtenDate.contains("\n")) continue;
			
			System.out.print(reviewIdx + " / " + writtenDate + " --> ");
			
			String newWrittenDate = "";
			if(!writtenDate.contains(".")) {
				if(writtenDate.charAt(7)=='월') {
					newWrittenDate += writtenDate.substring(0,6);  // [0] ~ [5]
					newWrittenDate += "0";
					newWrittenDate += writtenDate.substring(6);   // [6] ~ 끝까지.
				}
			} 
			if(newWrittenDate.equals("")) {
				newWrittenDate = writtenDate;
			}
			System.out.println(newWrittenDate);
			
			String sql2 = "UPDATE review SET written_date=? WHERE review_idx=?";
			PreparedStatement pstmt2 = conn.prepareStatement(sql2);
			pstmt2.setString(1, newWrittenDate);
			pstmt2.setInt(2, reviewIdx);
			pstmt2.executeUpdate();
			pstmt2.close();
		}
		rs.close();
		pstmt.close();
	}
}
