package esDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import common.DBConnection;
import esVo.GetFollowerListsVo;
import esVo.GetPostReplyByPostIdx;
import esVo.GetRoomByHostIdxVo;
import esVo.PostVo;

public class ProfileTimelineDao {
	static Connection conn = DBConnection.getConnection();
	//follower ?
	public int getTotalFollower(int userIdx){
		int totalFollower = 0;
		String sql = "SELECT count(*)"
				+ " FROM following"
				+ " WHERE user_idx = ? ";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userIdx);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				totalFollower = rs.getInt(1);
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return totalFollower;
	}
	//following ?
	public int getTotalFollowing(int userIdx){
		int totalFollowing = 0;
		String sql = "SELECT count(*)"
				+ " FROM following "
				+ " WHERE follower = ? ";
	
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userIdx);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				totalFollowing = rs.getInt(1);
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return totalFollowing;
	}
	//κ²μκΈ? κ°μ
	public int getTotalPost(int userIdx) {
		int totalPost = 0;
		String sql = "SELECT count(*)"
				+ " FROM post"
				+ " WHERE user_idx = ? ";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userIdx);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				totalPost = rs.getInt(1);
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return totalPost;
	}
	//?λ‘μμΆκ?
	public void addFollowing(int userIdx , int thisUserIdx) {
		String sql = "INSERT INTO following(following_idx, user_idx, follower)"
				+ " VALUES (following_idx.nextval, ?, ?)";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, thisUserIdx);
			pstmt.setInt(2, userIdx);
			pstmt.executeUpdate();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	//κ·? ?¬?? κ²μκΈ? κ°?? Έ?€κΈ?
	public ArrayList<PostVo> getPostList(int thisUserIdx){
		String sql = "SELECT * FROM post WHERE user_idx = ? order by written_date asc";
		ArrayList<PostVo> list = new ArrayList<PostVo>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, thisUserIdx);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int postIdx = rs.getInt("post_idx");
				int userIdx = rs.getInt("user_idx");
				String content = rs.getString("content");
				String writtenDate = rs.getString("written_date");
				
				list.add(new PostVo(postIdx, userIdx, content, writtenDate));
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	//κ²μκΈ? μ’μ?κ°μ
	public int countLikeInPost(int postIdx) {
		String sql = "SELECT count(*) FROM post_like WHERE post_idx = ?";
		int cnt = 0;
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, postIdx);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) { e.printStackTrace(); }
		
		return cnt;
	}
//	?κΈ? κ°?? Έ?€κΈ?
	public ArrayList<GetPostReplyByPostIdx> getReplyLists(int postIdx){
		ArrayList<GetPostReplyByPostIdx> list = new ArrayList<GetPostReplyByPostIdx>();
		String sql = "SELECT ui.user_image, ui.user_id, pr.written_date, pr.content"
				+ " FROM user_info ui, post_reply pr "
				+ " WHERE ui.user_idx = pr.user_idx AND pr.post_idx = ? "
				+ " ORDER BY reply_idx ASC";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, postIdx);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				String userImage = rs.getString("user_image");
				String userId = rs.getString("user_id");
				String writtenDate = rs.getString("written_date");
				String content = rs.getString("content");
			
				list.add( new GetPostReplyByPostIdx(userImage, userId, writtenDate, content));
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) { e.printStackTrace(); }
		
		return list;
	}
//	?κΈ? κ°??
	public int getCountReply(int postIdx) {
		int cnt = 0;
		String sql = "SELECT count(*) FROM post_reply WHERE post_idx = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, postIdx);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) { e.printStackTrace(); }
		
		return cnt;
	}
	//?¬?©?κ°? ?Έ?€?Έ?Έ ??λ¦¬μ€?Έ 2κ°? κ°?? Έ?€κΈ?
	public List<GetRoomByHostIdxVo> getRoomByHostIdx(int hostIdx){
		String sql = "SELECT ar.room_name, ar.room_location, ar.room_score, ri.img1"
				+ " FROM airbnb_room ar, room_image ri "
				+ " WHERE ar.room_idx = ri.room_idx AND ar.user_idx = ? AND ROWNUM <= 2";
	
		List<GetRoomByHostIdxVo> list = new ArrayList<>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, hostIdx);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				String roomName = rs.getString("room_name");
				String roomLocation = rs.getString("room_location");
				double roomScore = rs.getDouble("room_score");
				String img1 = rs.getString("img1");
			
				list.add(new GetRoomByHostIdxVo(roomName, roomLocation, roomScore, img1));
			}
			rs.close();
			pstmt.close();
		}	catch(Exception e) { e.printStackTrace(); }
		
		return list;
	}
	//μ’μ? ?λ¦?
	public void InsertLikeAlarm(int thisUserIdx,int userIdx){
		String sql = "INSERT INTO notification(notification_idx, user_idx, txt, when_time, receiver)\r\n"
				+ "VALUES(notification_idx.nextval, ?, '(((user_id)))??΄ ???? κ²μκΈ?? μ’μ?©??€.', sysdate, ?)";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userIdx);
			pstmt.setInt(2, thisUserIdx);
			pstmt.executeUpdate();
			pstmt.close();
		} catch(Exception e) { e.printStackTrace(); }
	}
	//?λ‘μ ?λ¦?
		public void InsertFollowingAlarm(int thisUserIdx,int userIdx){
			String sql = "INSERT INTO notification(notification_idx, user_idx, txt, when_time, receiver)\r\n"
					+ "VALUES(notification_idx.nextval, ?, '(((user_id)))??΄ ???? ?λ‘μ°?©??€.', sysdate, ?)";
			
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, userIdx);
				pstmt.setInt(2, thisUserIdx);
				pstmt.executeUpdate();
				pstmt.close();
			} catch(Exception e) { e.printStackTrace(); }
		}
	//μ’μ??λ₯΄κΈ°
	public void InsertPostLike(int postIdx, int userIdx){
		String sql = "INSERT INTO post_like VALUES( ? , ? )";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, postIdx);
			pstmt.setInt(2, userIdx);
			pstmt.executeUpdate();
			pstmt.close();
		} catch(Exception e) { e.printStackTrace(); } 
	}
	//μ’μ? μ·¨μ
	public void DeletePostLike(int postIdx, int userIdx) {
		String sql = "DELETE FROM post_like WHERE post_idx = ? AND user_idx = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, postIdx);
			pstmt.setInt(2, userIdx);
			pstmt.executeUpdate();
			pstmt.close();
		} catch(Exception e) { e.printStackTrace(); }
	}
	//follower?¬??€ λͺ©λ‘
	public List<GetFollowerListsVo> getFollowerLists(int thisUserIdx){
		List<GetFollowerListsVo> list = new ArrayList<GetFollowerListsVo>();
		String sql = "SELECT ui.user_image, ui.user_id"
				+ " FROM following f, user_info ui"
				+ " WHERE f.follower = ui.user_idx AND f.user_idx = ? " ;
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, thisUserIdx);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				String userImage = rs.getString("user_image");
				String userId = rs.getString("user_id");
				
				list.add(new GetFollowerListsVo(userImage, userId));
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) { e.printStackTrace(); } 
	
		return list;
	}
	//following?¬??€ λͺ©λ‘
	public List<GetFollowerListsVo> getFollowingLists(int thisUserIdx){
		List<GetFollowerListsVo> list = new ArrayList<GetFollowerListsVo>();
		String sql = "SELECT ui.user_image, ui.user_id"
				+ " FROM following f, user_info ui"
				+ " WHERE f.user_idx = ui.user_idx AND f.follower = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, thisUserIdx);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				String userImage = rs.getString("user_image");
				String userId = rs.getString("user_id");
				
				list.add(new GetFollowerListsVo(userImage, userId));
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) { e.printStackTrace(); } 
		return list;
	}
	//?΄ ?¬?? ?λ‘μ??μ§? ?¬λΆ?λ₯? λ°κ³  ?λ‘μλ°μ?Όλ©? ?λ‘μλ²νΌ ???Όλ©? ?λ‘μ°λ²νΌ
//	public boolean checkFollowing(int thisUserIdx, int userIdx) {
//	}
	//?κΈ??¬κΈ?
	public boolean insertReply(int postIdx, int userIdx, String content){
		String sql = "INSERT INTO post_reply(reply_idx, user_idx, content, written_date, post_idx)"
				+ " VALUES (reply_idx.nextval, ?, ?, sysdate, ?)";
	
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userIdx);
			pstmt.setString(2, content);
			pstmt.setInt(3, postIdx);
			pstmt.executeUpdate();
			pstmt.close();
		} catch(Exception e) { return false; }
		
		return true;
	} 
	//?΄ ?¬?? ?λ‘μ°??μ§? μ²΄ν¬
	public boolean checkFollowing(int userIdx, int thisUserIdx) {
		String sql = "SELECT count(*) FROM following WHERE user_idx = ? AND follower = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, thisUserIdx);
			pstmt.setInt(2, userIdx);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				int check = rs.getInt(1);

				if(check == 0) {
					return true;
				}
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) { e.printStackTrace(); }
	
		return false;
	}
	//?λ‘μ° μ·¨μ
	public void cancelFollowing(int userIdx, int thisUserIdx) {
		String sql = "DELETE FROM following WHERE user_idx = ? AND follower = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, thisUserIdx);
			pstmt.setInt(2, userIdx);
			pstmt.executeUpdate();
			pstmt.close();
		} catch(Exception e) { e.printStackTrace(); }
	
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
