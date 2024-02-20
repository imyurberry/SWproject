package swDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.DBConnection;
import swVo.ExpCollectionVo;
import swVo.ExpReviewVo;
import swVo.ExperienceVo;

public class CollectionDao {
	static Connection conn = DBConnection.getConnection();
	public ArrayList<ExpCollectionVo> getExpCollectionList() {
		ArrayList<ExpCollectionVo> listRet = new ArrayList<ExpCollectionVo>();
		
		String sql = "SELECT collection_idx, collection_name, img FROM exp_collection ORDER BY collection_idx asc";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int collectionIdx = rs.getInt("collection_idx");
				String collectionName = rs.getString("collection_name");
				String img = rs.getString("img");
				
				listRet.add(new ExpCollectionVo(collectionIdx, collectionName, img));
			}
			rs.close();
			pstmt.close();
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		return listRet;
	}
	
	public ExpCollectionVo getExpCollection(int cIdx) {
		ExpCollectionVo vo = null;
		
		String sql = "SELECT * FROM exp_collection WHERE collection_idx=?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cIdx);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int collectionIdx = rs.getInt("collection_idx");
				String collectionName = rs.getString("collection_name");
				String img = rs.getString("img");
				
				vo = new ExpCollectionVo(collectionIdx, collectionName, img);
			}
			rs.close();
			pstmt.close();
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		return vo;
	}
	
	public ArrayList<ExperienceVo> getCollectionExp(int cIdx) {
		ArrayList<ExperienceVo> listRet = new ArrayList<ExperienceVo>();
		
		String sql = "SELECT * FROM experience WHERE collection_idx=?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cIdx);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int expCateIdx = rs.getInt("exp_cate_idx");
				int expIdx = rs.getInt("exp_idx");
				String expName = rs.getString("exp_name");
				String expLocation = rs.getString("exp_location");
				String time = rs.getString("time");
				String language = rs.getString("language");
				double score = rs.getDouble("score");
				String expHostId = rs.getString("exp_host_id");
				String expType = rs.getString("exp_type");
				String hostImage = rs.getString("host_image");
				String expInfo = rs.getString("exp_info");
				String expInfoEx = rs.getString("exp_info_ex");
				String expExplain = rs.getString("exp_explain");
				String expJoin = rs.getString("exp_join");
				String materialImage = rs.getString("material_image");
				String material = rs.getString("material");
				int age = rs.getInt("age");
				int n = rs.getInt("n");
				String hostIntro = rs.getString("host_intro");
				String hostYear = rs.getString("host_year");
				int cautionIdx = rs.getInt("caution_idx");
				String expImg1 = rs.getString("exp_img1");
				String expImg2 = rs.getString("exp_img2");
				String expImg3 = rs.getString("exp_img3");
				String expImg4 = rs.getString("exp_img4");
				String expImg5 = rs.getString("exp_img5");
				String confirm = rs.getString("confirm");
				int expPrice = rs.getInt("exp_price");
				String expMember = rs.getString("exp_member");
				String lowest = rs.getString("lowest");
				int collectionIdx = rs.getInt("collection_idx");
				
				ExperienceVo vo = new ExperienceVo(expCateIdx, expIdx, expName, expLocation, time, language, score, expHostId, expType, hostImage, expInfo, expInfoEx, expExplain, expJoin, materialImage, material, age, n, hostIntro, hostYear, cautionIdx, expImg1, expImg2, expImg3, expImg4, expImg5, confirm, expPrice, expMember, lowest, collectionIdx);
				listRet.add(vo);
			}
			rs.close();
			pstmt.close();
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		return listRet;
	}
	
	public ExpReviewVo getColExpReview(int idx) {
		ExpReviewVo vo = null;
		
		String sql = "SELECT r.*, "
				+ " (SELECT count(*) FROM exp_review WHERE exp_idx=?) cnt,"
				+ " (SELECT ROUND(avg(score),2) FROM exp_review WHERE exp_idx=?) avg"
				+ " FROM exp_review r"
				+ " WHERE exp_idx = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.setInt(2, idx);
			pstmt.setInt(3, idx);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int expIdx = rs.getInt("exp_idx");
				int reviewIdx = rs.getInt("review_idx");
				String review = rs.getString("review");
				String userImage = rs.getString("user_image");
				String userName = rs.getString("user_name");
				double score = rs.getDouble("score");
				String writtenDate = rs.getString("written_date");
				int cnt = rs.getInt("cnt");
				double avg = rs.getDouble("avg");
				
				vo = new ExpReviewVo(expIdx, reviewIdx, review, userImage, userName, score, writtenDate, cnt, avg);
			}
			rs.close();
			pstmt.close();
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		return vo;
	}
}
