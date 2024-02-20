package com.sw.dao;

import java.util.ArrayList;

import com.sw.dto.BoardDto;

public interface BoardDao {
	ArrayList<BoardDto> getAllList(int pageNum);
	int getCountAll(); // ������ ������ ��ȣ�� ����
	BoardDto selectOneBoard(int bno); // bno �� BoardDto ��ü�� ����
	void increaseHitCount(int bno);
	void write(BoardDto dto);
	void update(int bno, String title, String content);
	void delete(int bno);
}
