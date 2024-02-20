import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import myDao.Main3Dao;

// 테이블 r, u 에서 
public class HelpMeYG2 {
	public static void main(String[] args) throws Exception {
		Connection conn = Main3Dao.conn;
		
		String sql = "SELECT review_idx, written_date FROM review";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			int reviewIdx = rs.getInt("review_idx");
			String writtenDate = rs.getString("written_date");
			if(writtenDate==null || writtenDate.length()<=4) continue;
			int idx1 = writtenDate.indexOf(".");
			int idx2 = writtenDate.lastIndexOf(".");
			if(idx1>0) {
				String year = writtenDate.substring(0, idx1);
				String month = writtenDate.substring(idx1+1, idx2);
				if(month.length()==1) month = "0" + month;
				String newString = year + "년 " + month + "월";
				System.out.println(newString);
				
				String sql2 = "UPDATE review SET written_date=? WHERE review_idx=?";
				PreparedStatement pstmt2 = conn.prepareStatement(sql2);
				pstmt2.setString(1, newString);
				pstmt2.setInt(2, reviewIdx);
				pstmt2.executeUpdate();
				pstmt2.close();
			}
		}
		rs.close();
		pstmt.close();
	}
}
