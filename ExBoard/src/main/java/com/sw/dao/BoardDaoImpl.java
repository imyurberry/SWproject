package com.sw.dao;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sw.dto.BoardDto;

@Repository
public class BoardDaoImpl implements BoardDao {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public ArrayList<BoardDto> getAllList(int pageNum) {
		ArrayList<BoardDto> listRet = new ArrayList<BoardDto>();
		
		int endRnum = pageNum * 20;
		int startRnum = endRnum - 19;
		
		HashMap<String, Integer> hmap = new HashMap<String, Integer>();
		
		hmap.put("startRnum", startRnum);
		hmap.put("endRnum", endRnum);
		
		List<BoardDto> list1 = sqlSession.selectList("BoardMapper.selectAll", hmap);
		listRet.addAll(list1);
		
		return listRet;
	}
	
	public int getCountAll() {
		return sqlSession.selectOne("BoardMapper.selectCountAll");
	}

	@Override
	public BoardDto selectOneBoard(int bno) {
		return sqlSession.selectOne("BoardMapper.selectOneBoard", bno);
	}

	@Override
	public void increaseHitCount(int bno) {
		sqlSession.update("BoardMapper.increaseHitcountPlusOne", bno);
	}

	@Override
	public void write(BoardDto dto) {
		sqlSession.insert("BoardMapper.insertBoard", dto);
	}

	@Override
	public void update(int bno, String title, String content) {
		HashMap<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("bno", bno);
		hMap.put("title", title);
		hMap.put("content", content);
		sqlSession.update("BoardMapper.updateBoard", hMap);
	}

	@Override
	public void delete(int bno) {
		sqlSession.delete("BoardMapper.deleteBoard", bno);
	}
	
	/*
	public void write(String title, String content, String writer) {
		Connection conn = DBConnection.getConnection();
		
		String sql = "INSERT INTO board1(bno, title, content, writer, writedate)"
				+ " VALUES(SEQ_BOARD1_BNO.nextval, ?, ?, ?, sysdate)";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, writer);
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}

	public void delete(int bno) {
		Connection conn = DBConnection.getConnection();
		try {
			String sql = "DELETE FROM board1 WHERE bno=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	public void update(BoardDto vo) {
		Connection conn = DBConnection.getConnection();
		try {
			String sql = "UPDATE board1 SET title=?, content=? WHERE bno=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setInt(3, vo.getBno());
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	*/
}
