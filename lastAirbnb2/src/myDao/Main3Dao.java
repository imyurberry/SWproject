package myDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;

import common.DBConnection;
import esVo.UserInfoVo;
import myVo.ConvenientVo;
import myVo.ReviewVo;
import myVo.RoomExplainVo;
import myVo.RoomImageVo;
import myVo.RoomInfoVo;
import myVo.RoomVo;
import myVo.StayVo;

public class Main3Dao {
   public static Connection conn= DBConnection.getConnection();
   
   //?Œ·ëª„ì ™è¹‚ë?ë±? ï§ë¶¿ê½Œï¿½ë±?
   public RoomVo getRoom(int roomIdx) {
      RoomVo roomvo = null;
System.out.println("³ªÁß¿¡ Áö¿ö¿ä Main3Dao.java) getRoom() -- roomIdx : " + roomIdx);
      String sql = "SELECT * FROM airbnb_room WHERE room_idx=?";
      try {
         PreparedStatement pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, roomIdx);
         ResultSet rs = pstmt.executeQuery();
         if(rs.next()) {
             int room_idx = rs.getInt("room_idx");
             int room_category_idx = rs.getInt("room_category_idx");
             String room_name = rs.getString("room_name");
             double room_score = rs.getDouble("room_score");
             String room_location =  rs.getString("room_location");
             int country_idx = rs.getInt("country_idx");
             double latitude = rs.getDouble("latitude");
             double longitude = rs.getDouble("longitude");
             int room_price = rs.getInt("room_price");
             int room_sale =  rs.getInt("room_sale");
             String room_type = rs.getString("room_type");
             String room_info_idx = rs.getString("room_info_idx");
             String room_info_ex = rs.getString("room_info_ex");
             int max_member =  rs.getInt("max_member");
             int bedroom = rs.getInt("bedroom");
             int bed_total = rs.getInt("bed_total");
             int bathroom = rs.getInt("bathroom");
             String pet = rs.getString("pet");
             String immediately = rs.getString("immediately");
             String self_check_in = rs.getString("self_check_in");
             int building_type = rs.getInt("building_type");
             String convenient_idx =  rs.getString("convenient_idx");
             int user_idx = rs.getInt("user_idx");
             
             roomvo = new RoomVo(room_idx, room_category_idx, room_name, room_score, room_location, country_idx, latitude, longitude, room_price, room_sale, room_type, room_info_idx, room_info_ex, max_member, bedroom, bed_total, bathroom, pet, immediately, self_check_in, building_type, convenient_idx, user_idx);
         }
         rs.close();
         pstmt.close();
      }catch(SQLException e) {
         e.printStackTrace();
      }
      System.out.println("³ªÁß¿¡ Áö¿ö¿ä Main3Dao.java) roomvo==null : " + (roomvo==null));
      
      return roomvo;
   }
   
   //ï¿½ì‰¶ï¿½ìï¿½ì ™è¹‚ï¿½ ï§ë¶¿ê½Œï¿½ë±?
   public UserInfoVo getUserInfo(int hostidx) {
      UserInfoVo uservo = null;
      String sql ="SELECT * FROM user_info WHERE user_idx=?";
      
      try {
         PreparedStatement pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, hostidx);
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
             
             uservo = new UserInfoVo(user_idx, user_id, user_regidence, user_image, introduce, interact, super_host, join_date, user_school, user_job, hometown, birthday, email, phone_number, second_number, password, active);
         }
         rs.close();
         pstmt.close();
      }catch(SQLException e) {
         e.printStackTrace();
      }
      return uservo;
   
   }
   
   
   // ?Œ·ëª„ì” èª˜ëª„ï¿? ï§ë¶¿ê½Œï¿½ë±?
   public RoomImageVo getRoomImage(int roomIdx) {
      RoomImageVo imageVo = null;
      
      String sql = " SELECT * FROM room_image WHERE room_idx=?";
      try {
         PreparedStatement pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, roomIdx);
         ResultSet rs = pstmt.executeQuery();
         if(rs.next()) {
            int imgIdx = rs.getInt("img_idx");
            int roomidx = rs.getInt("room_idx");
            String img1 = rs.getString("img1");
            String img2 = rs.getString("img2");
            String img3 = rs.getString("img3");
            String img4 = rs.getString("img4");
            String img5 = rs.getString("img5");
            
            imageVo = new RoomImageVo(imgIdx, roomidx, img1, img2, img3, img4, img5);
         }
         rs.close();
         pstmt.close();
      } catch(SQLException e) {
         e.printStackTrace();
      }
      return imageVo;
   }
   // ?Œ·ëª„ê½•ï§ï¿½ 
   // select room_info_ex from airbnb_room where room_idx=8;   -- 1(3)8(90)3(7) ï¿½ì‚‰ï¿½ë’— null
   // select room_info_cate_detail from room_info where room_info_idx=8;   -- ï§¤ì’“?  ï¿½ë‹•è«›ëº¥ë¸? å¯ƒëš¯?’ªï¿½ë“ƒ ä»¥ï¿½ (((n)))%åª›ï¿½ ï¿½ìç§»ì„ë¿? è¹‚ê¾©?  5ï¿½ì ï¿½ì“£ ä»¥ï¿½ ï¿½ë‹•ï¿½ëƒ¼ï¿½ì—¯ï¿½ë•²ï¿½ë–.
   // Ex) str2 : ["1", "8", "3"]
   public ArrayList<RoomInfoVo> getRoomInfo(int roomIdx, String[] str2) {
      ArrayList<RoomInfoVo> roominfovo  = new ArrayList<RoomInfoVo>();
      
      String sql = "select * from room_info where room_info_idx=?";
      
      for(int i =0; i<str2.length; i++) {
         try {
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, Integer.valueOf(str2[i]));
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()) {
                int room_info_idx = rs.getInt("room_info_idx");
                String room_info_image = rs.getString("room_info_image");
                String room_info_category = rs.getString("room_info_category");
                String room_info_cate_detail = rs.getString("room_info_cate_detail");
                
                if(room_info_cate_detail!=null && room_info_cate_detail.contains("(((n)))")) {
                   String sql2 = "select room_info_ex from airbnb_room where room_idx=?";
                   PreparedStatement pstmt2 = conn.prepareStatement(sql2);
                   pstmt2.setInt(1, roomIdx);
                   ResultSet rs2 = pstmt2.executeQuery();
                   String infoText = "";
                   if(rs2.next()) {
                	   infoText = rs2.getString("room_info_ex"); //7(ï¿½ê¶ï¿½ë™£ï¿½ë±¶) 
                	   infoText = infoText.replace("\r\n", "\n");
                	   infoText = infoText.replace("\n", "");
                   }
                   rs2.close();
                   pstmt2.close();
                   // str2[i]  ---> "8"
                   String strNew = getInside(infoText, Integer.parseInt(str2[i])); //
                   room_info_cate_detail = room_info_cate_detail.replace("(((n)))", strNew);
                }
                
                roominfovo.add(new RoomInfoVo(room_info_idx, room_info_image, room_info_category, room_info_cate_detail));
            }
            rs.close();
            pstmt.close();
         }catch(SQLException e) {
            e.printStackTrace();
         }
      }
      return roominfovo;
   }
   
   // s : 11(Cond? Nast Traveler, Octover 2019)
   // num : 11
   // getInside() ----> getRoomInfo() ï¿½ë¿‰ï¿½ê½Œï§ï¿½ ï¿½ê¶—ï¿½ìŠœï¿½ë¸¯ï¿½ë’— ï§ë¶¿ê½Œï¿½ë±?.
   private String getInside(String s, int num) {  // ex. s:"1(3)8(90)3(7)" , room_info_ex
      String[] s2 = s.split("\\)");
      
      ArrayList<String> list1 = new ArrayList<String>();
      for(String str : s2) {
         list1.add(str.split("\\(")[0]);
         list1.add(str.split("\\(")[1]);
      }
      
      for(int i=0; i<=list1.size()-1; i+=2) {  // i: 0, 2, 4
         if(list1.get(i).equals(""+num)) {
            return list1.get(i+1);
         }
      }
      return null;
   }

   
   // ï¿½ë ªï¿½ì“½ï¿½ë–†ï¿½ê½• ï§Ÿì‡¨ì»»æ¹²ï¿?
   public ArrayList<ConvenientVo> getConvenientV2(String conv){
      ArrayList<ConvenientVo> convenientvo  = new ArrayList<ConvenientVo>();
      
      // è­°ê³—?”¤ï¿½ì‘æ¿¡ï¿½ ç§»ëŒ„?’æ?¨ì¢Š?”æºëš¯ï¿? ?•°ë¶½ï¿½ï¿½ë¹ï¿½ë¹ï¿½ë¸¯ï¿½ë’—ï§ï¿½
      String sql = "SELECT *" 
            + " FROM convenient" 
            + " WHERE convenient_idx IN (" + conv + ")"
            + " ORDER BY convenient_idx";
      
      try {
         PreparedStatement pstmt = conn.prepareStatement(sql);
         ResultSet rs = pstmt.executeQuery();
         while(rs.next()) {
             int convenientCategoryIdx = rs.getInt("convenient_category_idx");
             int convenientIdx = rs.getInt("convenient_idx");
             String convenientName = rs.getString("convenient_name");
             String convenientImage = rs.getString("convenient_image");
             String convenientEx = rs.getString("convenient_ex");
             
             convenientvo.add(new ConvenientVo(convenientCategoryIdx, convenientIdx, convenientName, convenientImage,convenientEx));
         }
         rs.close();
         pstmt.close();
      }catch(SQLException e) {
         e.printStackTrace();
      }
      return convenientvo;
   }
   
   
   // ï¿½ë ªï¿½ì“½ï¿½ë–†ï¿½ê½• ç§»ëŒ„?’æ?¨ì¢Š?”
   // Ex) 1 ---> return:"ï¿½ë¸˜?”±ê¾¨ë–ï¿½ìŠ« ï¿½ìŸ¾ï§ï¿½"
   public String getConvCate(int convCateIdx) {
      String sql = "SELECT convenient_category" 
            + " FROM convenient_cate" 
            + " WHERE convenient_category_idx=?";
      String strRet = "";
      try {
         PreparedStatement pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, convCateIdx);
         ResultSet rs = pstmt.executeQuery();
         if(rs.next()) {
            strRet = rs.getString(1);
         }
         rs.close();
         pstmt.close();
      } catch(SQLException e) {
         e.printStackTrace();
      }
      return strRet;
   }
   
   
   
    // ¼÷¹ÚÀ¯Çü
    public ArrayList<StayVo> getStay(int roomIdx){ 
    	ArrayList<StayVo> stayvo = new ArrayList<StayVo>();
    
    String sql = "select * from stay where room_idx = ?";
    
    try { 
       PreparedStatement pstmt = conn.prepareStatement(sql);
       pstmt.setInt(1,roomIdx); ResultSet rs = pstmt.executeQuery();
       while(rs.next()) { 
          int stay_idx = rs.getInt("stay_idx");
          int room_idx = rs.getInt("room_idx"); 
          String stay_img = rs.getString("stay_img"); 
          String stay_type = rs.getString("stay_type"); 
          String bed_count = rs.getString("bed_count");
    
          stayvo.add(new StayVo(stay_idx, room_idx, stay_img, stay_type, bed_count)); 
         }
       rs.close(); 
       pstmt.close(); 
       }catch(SQLException e) { e.printStackTrace(); }
    return stayvo; 
    }
    
   
   // ¸®ºä ºÒ·¯¿À´Â ¸Ş¼­µå(ÃÖ½Å¼ø)
   public ArrayList<ReviewVo> getReview(int roomIdx) {
      ArrayList<ReviewVo> reviewvo = new ArrayList<ReviewVo>();
      
      String sql = "select r.*, u.* from review r,user_info u where r.room_idx=? And r.user_idx = u.user_idx order by written_date DESC";
      
      try {
         PreparedStatement pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1,roomIdx);
         ResultSet rs = pstmt.executeQuery();
         while(rs.next()) {
             int room_idx =  rs.getInt("room_idx");
             int review_idx =  rs.getInt("review_idx");
             String review = rs.getString("review");
             int user_idx =  rs.getInt("user_idx");
             double score = rs.getDouble("score");
             String written_date = rs.getString("written_date");
             String user_id = rs.getString("user_id");
             String user_regidence = rs.getString("user_regidence");
             String user_image = rs.getString("user_image");
             
         reviewvo.add(new ReviewVo(room_idx, review_idx, review, user_idx, score, written_date, user_id, user_regidence, user_image));
         
         }
         rs.close();
         pstmt.close();
      }catch(SQLException e) {
         e.printStackTrace();
      }
      return reviewvo;
   }
   

	// ÈÄ±â°Ë»ö¾î
	public ArrayList<ReviewVo> getSearch(int roomIdx, String searchText, String searchOrderBy){ //searchOrderBy : "ÃÖ½Å¼ø", "³ôÀºÆòÁ¡¼ø"
		ArrayList<ReviewVo> reviewList = new ArrayList<ReviewVo>();
		String sql ="SELECT * FROM review r, user_info u "
				+ " WHERE r.user_idx = u.user_idx AND r.review IS NOT NULL "
				+ " AND room_idx = ? ";
		try {
			PreparedStatement pstmt =null;
			if(searchText != null && !searchText.equals("") ){ // ï¿½ì” å«„ï¿½ ?®?‡°?ˆƒ ï¿½ë¸ ï¿½êµ¹ï¿½ì‚©ï¿½ë–ï¿½ë?? ï¿½ì†¢ï§ï¿½?
				sql += " AND  review LIKE '%"+searchText.trim()+"%' ";
			}
			if("ÃÖ½Å¼ø".equals(searchOrderBy)) {
				sql += " ORDER BY written_date DESC";
			} else if("³ôÀºÆòÁ¡¼ø".equals(searchOrderBy)) {
				sql += " ORDER BY score DESC";
			}
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, roomIdx);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				System.out.print(".");
				int room_idx =  rs.getInt("room_idx");
				int review_idx =  rs.getInt("review_idx");
				String review = rs.getString("review");
				int user_idx =  rs.getInt("user_idx");
				double score = rs.getDouble("score");
				String written_date = rs.getString("written_date");
				String user_id = rs.getString("user_id");
				String user_regidence = rs.getString("user_regidence");
				String user_image = rs.getString("user_image");
				reviewList.add(new ReviewVo(room_idx, review_idx, review, user_idx, score, written_date, user_id, user_regidence, user_image));
			}         
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return reviewList;
	}
   
   // ¹æ ¼³¸í
   public RoomExplainVo getRoomExplain(int roomIdx) {
      RoomExplainVo explainvo = null;
      String sql = " SELECT * FROM room_explain WHERE room_idx=?";
      
      try {
         PreparedStatement pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, roomIdx);
         ResultSet rs = pstmt.executeQuery();
         if(rs.next()) {
             int room_idx = rs.getInt("room_idx");
             String r_explain = rs.getString("r_explain");
             String room_char = rs.getString("room_char");
             String room_place = rs.getString("room_place");
             String room_etc = rs.getString("room_etc");
             String room_register = rs.getString("room_register");
         
             explainvo = new RoomExplainVo(room_idx, r_explain, room_char, room_place, room_etc, room_register);
         }
         rs.close();
         pstmt.close();
      }catch(SQLException e) {
         e.printStackTrace();
      }
      return explainvo;
   }
   
   
   
   // ÈÄ±â°³¼ö
   public int getCountReview(int roomIdx) {
      int cnt = 0;
      try {
         String sql = " SELECT  count(*) FROM review WHERE review IS NOT NULL And room_idx=?";
         PreparedStatement pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1,roomIdx);
         ResultSet rs = pstmt.executeQuery();
         if(rs.next()) {
            cnt = rs.getInt(1);
         }
         rs.close();
         pstmt.close();
      }catch(Exception e) {
         e.printStackTrace();
      }
      return cnt;
   }
   
   // ³¯Â¥ ¸·±â --> °¡´ÉÇÑ ³¯Â¥ÀÎÁö ¸®ÅÏ(true:¿¹¾à°¡´ÉÇÔ). / date8ch = (ex.)"20240218"
   public boolean checkRoomAvailable(int roomIdx, String date8ch) {
	   int cnt = 0;
	   try {
		   String sql = "SELECT count(*) FROM room_resered WHERE room_idx=1"
			   + " AND (to_date(check_in, 'yyyymmdd') <= to_date(?, 'yyyymmdd'))"
			   + " AND (to_date(?, 'yyyymmdd') < to_date(check_out, 'yyyymmdd'))";
		   PreparedStatement pstmt = conn.prepareStatement(sql);
		   pstmt.setString(1, date8ch);
		   pstmt.setString(2, date8ch);
		   ResultSet rs = pstmt.executeQuery();
		   if(rs.next()) {
			   cnt = rs.getInt(1);
		   }
		   rs.close();
		   pstmt.close();
	   } catch(Exception e) { e.printStackTrace(); }
	   return cnt==0;
   }
   
   // ¾ÈµÇ´Â³¯Â¥ 
   public ArrayList<String> getListDate8chUnavailable(int roomIdx) {
	   ArrayList<String> listUnavailable = new ArrayList<String>();
	   // Test) 20240101 ~ 20241231.
	   Calendar cal = Calendar.getInstance();
	   cal.set(2024, 0, 1);
	   for(int i=1; i<=366; i++) {
		   String year = "" + cal.get(Calendar.YEAR);
		   String month = "" + (cal.get(Calendar.MONTH)+1);
		   if(month.length()==1) month = "0" + month;
		   String date = "" + cal.get(Calendar.DATE);
		   if(date.length()==1) date = "0" + date;
		   //System.out.println(year + month + date);
		   boolean available = checkRoomAvailable(roomIdx, year+month+date);
		   if(month.charAt(0)=='0') month = "" + month.charAt(1);
		   if(date.charAt(0)=='0') date = "" + date.charAt(1);
		   if(!available) {
			   listUnavailable.add(year + "-" + month + "-" + date);
		   }
		   cal.add(Calendar.DATE, 1);
	   }
	   return listUnavailable;
   }
}


