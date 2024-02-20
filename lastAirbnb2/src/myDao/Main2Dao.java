package myDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.DBConnection;
import myVo.RepresentRoomListVo;
import myVo.RoomCategoryVo;

public class Main2Dao {
   static Connection conn = DBConnection.getConnection();
   
   // Ïπ¥ÌÖåÍ≥†Î¶¨ Î©îÏÑú?ìú
   public static ArrayList<RoomCategoryVo> getCateAll(){
      ArrayList<RoomCategoryVo> list1 = new ArrayList<RoomCategoryVo>();// Í∞ùÏ≤¥ ?Éù?Ñ±
      
      String sql = "SELECT room_category_idx,category_name,category_icon" + 
            " FROM room_category" + 
            " ORDER BY room_category_idx asc";
      try {
         PreparedStatement pstmt = conn.prepareStatement(sql); // sql?ÇΩ?ûÖ
         ResultSet rs =pstmt.executeQuery();
         while(rs.next()) {
            int roomCategoryIdx = rs.getInt("room_category_idx");
            String categoryName = rs.getString("category_name");
            String categoryIcon = rs.getString("category_icon");
            RoomCategoryVo vo = new RoomCategoryVo(roomCategoryIdx, categoryName, categoryIcon);
            list1.add(vo);
         //   System.out.println(vo.toString());
         }
         rs.close();
         pstmt.close();
      }catch(Exception e) {
         e.printStackTrace();
      }
      return list1;
   }
   
   // Ïπ¥ÌÖåÍ≥†Î¶¨Î≥ÑÎ°ú ?àô?ÜåÎ∂àÎü¨?ò§Í∏?
   public static ArrayList<RepresentRoomListVo> getRoom(int cateIdx){
	   ArrayList<RepresentRoomListVo> list2 = new ArrayList<RepresentRoomListVo>(); //arraylistÍ∞ùÏ≤¥?Éù?Ñ±
      
      String sql= " SELECT i.img1, r.room_name, r.room_score,r.room_price, r.room_idx, r.longitude, r.latitude"  
            + " FROM airbnb_room r, room_image i"  
            + " WHERE r.room_category_idx = ? AND i.room_idx = r.room_idx";
      try {
         PreparedStatement pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, cateIdx);
         ResultSet rs = pstmt.executeQuery();
         while(rs.next()) {
            String roomImg1 = rs.getString("img1");
            int roomIdx = rs.getInt("room_idx");
            String roomName = rs.getString("room_name");
            double roomScore = rs.getDouble("room_score");
            int roomPrice = rs.getInt("room_price");
            double latitude = rs.getDouble("latitude");
            double longitude = rs.getDouble("longitude");
            list2.add(new RepresentRoomListVo(roomImg1, roomName, roomScore, roomPrice, latitude, longitude, roomIdx));
         }
         rs.close();
         pstmt.close();
      }catch(Exception e) {
         e.printStackTrace();
      }
      return list2;
   }
   
   // ∞≈∏Æ±∏«œ±‚
   public double checkDistance(double currentLatitude , double currentLongitude , double roomLatitude, double roomLongitude) {
      double Abstractlongitude = currentLongitude - roomLongitude;
      double distance = (Math.sin(3.14*(currentLatitude)) * Math.sin(3.14*(roomLatitude)))
            + (Math.cos(3.14*(currentLongitude)) * Math.cos(3.14*(roomLongitude)));
      distance = Math.acos(distance);            
      distance = Math.toDegrees(2)*distance;
      distance = distance * 60 * 1.1515;
      distance *= 1.609344;
      return Math.round(distance);
   }
   
   public double checkDistance1(double currentLatitude , double currentLongitude , double roomLatitude, double roomLongitude) {
      if(currentLatitude > 0&& roomLatitude > 0) {
         currentLatitude *= -1;
      }
      if(currentLongitude > 0 && roomLongitude > 0) {
         currentLongitude *= -1;
      }
      if(currentLongitude < 0&& roomLongitude < 0) {
         currentLongitude *= -1;
      }
      if(currentLatitude < 0 && roomLatitude < 0) {
         currentLatitude *= -1;
      }
      
      double distance = Math.sqrt(Math.pow(currentLatitude + roomLatitude, 2) + Math.pow(currentLongitude+roomLongitude, 2));
      return Math.round(distance);
   }
   //« ≈Õø° ∏¬¥¬ º˜º“µÈ ∞°¡Æø¿±‚
   public ArrayList<RepresentRoomListVo> showRoomListsByFilter(int minPrice,int maxPrice,int roomCategory,int bedRoom, int bedTotal, int bathRoom ){
//	   if(maxPrice==0) maxPrice = Integer.MAX_VALUE;
	   
	   ArrayList<RepresentRoomListVo> list = new ArrayList<RepresentRoomListVo>();
	   String sql = "SELECT i.img1, r.room_name, r.room_score,r.room_price, r.room_idx, r.longitude, r.latitude " + 
	   		" FROM airbnb_room r, room_image i" + 
	   		" WHERE r.room_category_idx = ? AND i.room_idx = r.room_idx AND r.room_price BETWEEN ? AND ?" +
	   		" AND r.bedroom =? AND bed_total =? AND bathroom =?";
	   
	   try {
		   PreparedStatement pstmt = conn.prepareStatement(sql);
		   pstmt.setInt(1, roomCategory);
		   pstmt.setInt(2, minPrice);
		   pstmt.setInt(3, maxPrice);
		   pstmt.setInt(4, bedRoom);
		   pstmt.setInt(5, bedTotal);
		   pstmt.setInt(6, bathRoom);
		   ResultSet rs = pstmt.executeQuery();
		   while(rs.next()) {
			   String roomImg1 = rs.getString("img1");
	            int roomIdx = rs.getInt("room_idx");
	            String roomName = rs.getString("room_name");
	            double roomScore = rs.getDouble("room_score");
	            int roomPrice = rs.getInt("room_price");
	            double latitude = rs.getDouble("latitude");
	            double longitude = rs.getDouble("longitude");
	            list.add(new RepresentRoomListVo(roomImg1, roomName, roomScore, roomPrice, latitude, longitude, roomIdx));
		   }
//		   System.out.println(pstmt.getConnection().toString());
		   System.out.println(list);
		   rs.close();
		   pstmt.close();
	   } catch(Exception e) { e.printStackTrace(); }
	   
	   return list;
	   
   }
   
   
   // ªı ¿ßΩ√∏ÆΩ∫∆Æ ∏∏µÈ±‚(¿Ø¿˙æ∆¿Ãµ, ªı ¿ßΩ√∏ÆΩ∫∆Æ ¿Ã∏ß)
   public void makeWishList(int userIdx,String makeWishName) {
	   String sql = "INSERT INTO wishlist(wishlist_idx,user_idx,biglist_name)" +
			   		"VALUES(WISH_MAKE_CATE.nextval,?,?)";
	   try {
		   PreparedStatement pstmt = conn.prepareStatement(sql);
		   pstmt.setInt(1, userIdx);
		   pstmt.setString(2, makeWishName);
		   pstmt.executeLargeUpdate();
		   pstmt.close();
	   }catch(SQLException e) {
		   e.printStackTrace();
	   }
   }
   // «œ∆ÆªË¡¶«“∂ß
   public void deleteWishLish(int roomIdx) {
	 try {
		  String sql = "DELETE FROM wish_list WHERE room_idx=?";
		  PreparedStatement pstmt = conn.prepareStatement(sql);
		  pstmt.setInt(1, roomIdx);
		  pstmt.executeUpdate();
		  pstmt.close();
	 }catch(Exception e) {
		 e.printStackTrace();
	 }
   }
   
}