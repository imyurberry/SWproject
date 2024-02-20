package com.sw.board;

import java.util.ArrayList;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sw.dao.BoardDao;
import com.sw.dto.BoardDto;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration( locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"} )
public class BoardDaoTest {
	@Autowired
	BoardDao dao; // root-context�� ����� '��'�� �ڵ� ���� ����
	
	@Test
	public void testGetAllList() throws Exception {
		ArrayList<BoardDto> list1 = dao.getAllList(1);
		for(BoardDto dto : list1) {
			System.out.println(dto.getBno() + " / " + dto.getTitle() + " / " + dto.getContent() + " / " + dto.getWriter() + " / " + dto.getWritedate() + " / " + dto.getHitcount());
		}
	}
	
	@Test
	public void testSelectAll() throws Exception {
		System.out.println("All : " + dao.getCountAll());
	}
	
	@Test
	public void testSelectOneBoard() throws Exception {
		BoardDto dto = dao.selectOneBoard(100);
		System.out.println(dto.getTitle());
		System.out.println(dto.getContent());
		System.out.println(dto.getWriter());
	}
	
	@Test
	public void testIncreaseHitcount() throws Exception {
		dao.increaseHitCount(100);
	}
	
	@Test
	public void testWriteBoard() throws Exception {
		BoardDto dto = new BoardDto(0, "SW", "�������", "�������������ƴϸ�ȵſ�����������߼ҿ�", 0, null);
		dao.write(dto);
	}
	
	@Test
	public void testUpdateBoard() throws Exception {
		dao.update(105, "�ο���", "����ʹ�");
	}
	
	@Test
	public void testDeleteBoard() throws Exception {
		dao.delete(122);
	}
}
