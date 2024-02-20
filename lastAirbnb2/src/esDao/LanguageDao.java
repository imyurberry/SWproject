package esDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.DBConnection;
import esVo.LanguageVo;

public class LanguageDao {
	static Connection conn = DBConnection.getConnection();
	public ArrayList<esVo.LanguageVo> getLanguage() {
		ArrayList<esVo.LanguageVo> langdao = new ArrayList<LanguageVo>();
		String sql = "SELECT language_idx, location, language"
				+ " FROM language";
		
		System.out.println(conn);
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);	
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				String language_idx = rs.getString("language_idx");
				String location = rs.getString("location");
				String language = rs.getString("language");
				
				LanguageVo vo = new LanguageVo(language_idx, location, language);
				langdao.add(vo);
			}
			rs.close();
			pstmt.close();
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		
		
		return langdao;
	}
}
