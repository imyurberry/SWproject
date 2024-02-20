package myDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.DBConnection;
import swVo.WishlistVo;

public class WishlistDao {
	public ArrayList<WishlistVo> getWishlistVoByUserIdx(int userIdx) {
		String sql = "SELECT w.*, wi.*, ri.img1, e.exp_img1"
				+ " FROM wishlist w, wishlist_item wi, room_image ri, experience e"
				+ " WHERE w.wishlist_idx = wi.wishlist_idx "
				+ " AND wi.room_idx = ri.room_idx(+)"
				+ " AND wi.exp_idx = e.exp_idx(+)"
				+ " AND user_idx=? "
				+ " ORDER BY w.wishlist_idx ASC";
		
		Connection conn = DBConnection.getConnection();
		ArrayList<WishlistVo> listRet = new ArrayList<WishlistVo>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userIdx);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int wishlistIdx = rs.getInt("wishlist_idx");
				String biglistName = rs.getString("big_list_name");
				int roomIdx = rs.getInt("room_idx");
				int expIdx = rs.getInt("exp_idx");
				String img1 = rs.getString("img1");
				String expImg1 = rs.getString("exp_img1");
				
				WishlistVo vo = new WishlistVo(wishlistIdx, userIdx, biglistName, roomIdx, expIdx, img1, expImg1);
				listRet.add(vo);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch(SQLException e) { e.printStackTrace(); }
		
		return listRet;
	}
	
	
}
