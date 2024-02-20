package esDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.DBConnection;
import esVo.WishListPageVo;

public class WishListDao {
	static Connection conn = DBConnection.getConnection();
	public ArrayList<WishListPageVo> getWishListByIdx(int userIdx){
System.out.println("WARNING!!! ...");
		
		ArrayList<WishListPageVo> list = new ArrayList<WishListPageVo>();
		
//		String sql = "SELECT img1, wbl.biglist_name, (SELECT count(*) FROM wish_list WHERE user_idx = ?) AS countRoom "
//				+ " FROM wish_big_list wbl, wish_list wl, room_image ri"
//				+ " WHERE wbl.idx = wl.wish_list_idx AND ri.room_idx = wl.room_idx AND wbl.user_idx = ? ";		
//	
//		try {
//			PreparedStatement pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, userIdx);
//			pstmt.setInt(2, userIdx);
//			ResultSet rs = pstmt.executeQuery();
//			while(rs.next()) {
//				String img1 = rs.getString("img1");
//				String bigListName = rs.getString("biglist_Name");
//				int countRoom = rs.getInt("countRoom");
//				
//				list.add(new WishListPageVo(img1, bigListName, countRoom));
//			}
//			rs.close();
//			pstmt.close();
//		} catch(Exception e) {
//			e.printStackTrace();
//		}
		return list;
	}
}
