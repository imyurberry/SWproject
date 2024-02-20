package com.sw.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sw.dao.BoardDao;
import com.sw.dto.BoardDto;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	BoardDao bDao;
	
	@Override
	public ArrayList<BoardDto> getBoardListByPageNumber(int page) {
		return bDao.getAllList(page);
	}

	@Override
	public int getLastPageNumber() {
		int cnt = bDao.getCountAll();
		if(cnt%20==0) return cnt/20;
		return cnt/20+1;
	}

	@Override
	public BoardDto getBoardDetail(int bno) {
		return bDao.selectOneBoard(bno);
	}

	@Override
	public void increaseHitcount(int bno) {
		bDao.increaseHitCount(bno);
	}

	@Override
	public void writeBoard(BoardDto dto) {
		bDao.write(dto);
	}

	@Override
	public void updateBoard(int bno, String title, String content) {
		bDao.update(bno, title, content);
	}

	@Override
	public void deleteBoard(int bno) {
		bDao.delete(bno);
	}
	
}
