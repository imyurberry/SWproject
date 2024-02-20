package myDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.DBConnection;
import swVo.WishlistListVo;
import swVo.WishlistVo;

public class RealWishlistDao {
	static Connection conn = DBConnection.getConnection();
	
	public ArrayList<WishlistListVo> getWishlistListVo(int userIdx) {
      String sql = "SELECT w.*," + 
      		"    NVL( (SELECT img1 FROM room_image WHERE room_idx in ( " + 
      		"        (SELECT min(room_idx) FROM wishlist_item WHERE wishlist_idx=w.wishlist_idx)" + 
      		"    )),(SELECT exp_img1 FROM experience WHERE exp_idx in ( " + 
      		"        (SELECT min(exp_idx) FROM wishlist_item WHERE wishlist_idx=w.wishlist_idx)" + 
      		"    ))) img, " + 
      		"    (SELECT count(*) FROM wishlist_item WHERE wishlist_idx=w.wishlist_idx) cnt" + 
      		" FROM wishlist w" + 
      		" WHERE user_idx=?" + 
      		" ORDER BY w.wishlist_idx ";
      
     
      ArrayList<WishlistListVo> listRet = new ArrayList<WishlistListVo>();
      try {
         PreparedStatement pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, userIdx);
         ResultSet rs = pstmt.executeQuery();
         while(rs.next()) {
    		int wishlistIdx = rs.getInt("wishlist_idx");
    		String biglistName = rs.getString("biglist_name");
    		String img = rs.getString("img");
    		int cnt = rs.getInt("cnt");

    		WishlistListVo vo = new WishlistListVo(wishlistIdx, userIdx, biglistName, img, cnt);
            listRet.add(vo);
         }
         rs.close();
         pstmt.close();
      } catch(SQLException e) { e.printStackTrace(); }
      return listRet;
   }

	
   public ArrayList<WishlistVo> getWishlistVoByUserIdxDetail(int userIdx, int wishlistIdx) {
      String sql = "SELECT w.*, wi.*, ri.img1, e.exp_img1"
            + " FROM wishlist w, wishlist_item wi, room_image ri, experience e"
            + " WHERE w.wishlist_idx = wi.wishlist_idx "
            + " AND wi.room_idx = ri.room_idx(+)"
            + " AND wi.exp_idx = e.exp_idx(+)"
            + " AND user_idx=? AND wishlist_idx=?"
            + " ORDER BY w.wishlist_idx ASC";
      
      ArrayList<WishlistVo> listRet = new ArrayList<WishlistVo>();
      try {
         PreparedStatement pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, userIdx);
         ResultSet rs = pstmt.executeQuery();
         while(rs.next()) {
            //int wishlistIdx = rs.getInt("wishlist_idx");
            String biglistName = rs.getString("biglist_name");
            int roomIdx = rs.getInt("room_idx");
            int expIdx = rs.getInt("exp_idx");
            String img1 = rs.getString("img1");
            String expImg1 = rs.getString("exp_img1");
            
            WishlistVo vo = new WishlistVo(wishlistIdx, userIdx, biglistName, roomIdx, expIdx, img1, expImg1);
            listRet.add(vo);
         }
         rs.close();
         pstmt.close();
      } catch(SQLException e) { e.printStackTrace(); }
      return listRet;
   }
   
//   public int getCountByWishlistIdx(int wishlistIdx) {
//	   Connection conn = DBConnection.getConnection();
//	   String sql = "SELECT count(*) FROM wishlist_item WHERE wishlist_idx=?";
//	   int cnt = 0;
//	   try {
//		   PreparedStatement pstmt = conn.prepareStatement(sql);
//	       pstmt.setInt(1, wishlistIdx);
//	       ResultSet rs = pstmt.executeQuery();
//	       if(rs.next()) {
//	    	   cnt = rs.getInt(1);
//	       }
//	       rs.close();
//	       pstmt.close();
//	       conn.close();
//	   } catch(SQLException e) { e.printStackTrace(); }
//	   return cnt;
//   }
}

