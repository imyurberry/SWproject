package com.sw.board;

import java.util.ArrayList;
import java.util.Scanner;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sw.dto.BoardDto;
import com.sw.service.BoardService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration( locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"} )

public class BoardServiceTest {
	@Autowired
	BoardService svc; // root-context�� ����� '��'�� �ڵ� ���� ����
	
	@Test
	public void testGetBoardListByPageNumber() throws Exception {
		ArrayList<BoardDto> list1 = svc.getBoardListByPageNumber(1);
		for(BoardDto dto : list1) {
			System.out.println(dto.getBno() + " / " + dto.getTitle() + " / " + dto.getContent() + " / " + dto.getWriter() + " / " + dto.getWritedate() + " / " + dto.getHitcount());
		}
	}
	
	@Test
	public void testGetLastPageNumber() throws Exception {
		System.out.println("������ ������ ��ȣ : " + svc.getLastPageNumber());
	}
	
	@Test
	public void testGetBoardDetail() throws Exception {
		Scanner sc = new Scanner(System.in);
		System.out.print("�۹�ȣ �Է��� : ");
		int bno = sc.nextInt();
		BoardDto dto = svc.getBoardDetail(bno);
		System.out.println(dto.getBno() + " / " + dto.getTitle() + " / " + dto.getContent() + " / " + dto.getWriter() + " / " + dto.getWritedate() + " / " + dto.getHitcount());
	}
	
	@Test
	public void testIncreaseHitcount() throws Exception {
		svc.increaseHitcount(100);
	}
	
	@Test
	public void testWriteBoard() throws Exception {
		BoardDto dto = new BoardDto(0, "SW", "��¥ ����ϰ� �;��", "�� ��¥ �����ؿ� ����", 0, null);
		svc.writeBoard(dto);
	}
	
	@Test
	public void testUpdateBoard() throws Exception {
		svc.updateBoard(105, "�̴�", "��¥����ʹ�");
	}
	
	@Test
	public void testDeleteBoard() throws Exception {
		svc.deleteBoard(124);
	}
}
