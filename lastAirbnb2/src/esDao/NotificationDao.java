package esDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.DBConnection;
import esVo.NotificationVo;

public class NotificationDao {
	public ArrayList<NotificationVo> getAllList(int receiverIdx) {
		ArrayList<NotificationVo> listRet = new ArrayList<NotificationVo>();
		
		String sql = "SELECT notification_idx, user_idx, txt, when_time"
					+ " FROM notification"
					+ " WHERE receiver = ?"
					+ " ORDER BY when_time desc";
		
		Connection conn = DBConnection.getConnection();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, receiverIdx);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int notificationIdx = rs.getInt("notification_idx");
				int userIdx = rs.getInt("user_idx");
				String txt = rs.getString("txt");
				String whenTime = rs.getString("when_time");
				NotificationVo vo = new NotificationVo(notificationIdx, userIdx, txt, whenTime);
				listRet.add(vo);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return listRet;
	}
	//?•Œ?žŒ ì§??š°ê¸?
	public void deleteNotification(int notification_idx) {
		String sql = "DELETE FROM notification"
				+ " WHERE notification_idx = ?";
		
		Connection conn = DBConnection.getConnection();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, notification_idx);
			pstmt.executeUpdate();
			pstmt.close();
		} catch(Exception e) {
				e.printStackTrace();
		}
		
	}
	
}
