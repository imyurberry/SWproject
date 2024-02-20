package com.sw.dao;

import java.util.ArrayList;

import com.sw.dto.BoardDto;

public interface BoardDao {
	ArrayList<BoardDto> getAllList(int pageNum);
	int getCountAll(); // 마지막 페이지 번호를 리턴
	BoardDto selectOneBoard(int bno); // bno → BoardDto 객체를 리턴
	void increaseHitCount(int bno);
	void write(BoardDto dto);
	void update(int bno, String title, String content);
	void delete(int bno);
}
