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
	BoardService svc; // root-context에 등록한 '빈'을 자동 주입 받음
	
	@Test
	public void testGetBoardListByPageNumber() throws Exception {
		ArrayList<BoardDto> list1 = svc.getBoardListByPageNumber(1);
		for(BoardDto dto : list1) {
			System.out.println(dto.getBno() + " / " + dto.getTitle() + " / " + dto.getContent() + " / " + dto.getWriter() + " / " + dto.getWritedate() + " / " + dto.getHitcount());
		}
	}
	
	@Test
	public void testGetLastPageNumber() throws Exception {
		System.out.println("마지막 페이지 번호 : " + svc.getLastPageNumber());
	}
	
	@Test
	public void testGetBoardDetail() throws Exception {
		Scanner sc = new Scanner(System.in);
		System.out.print("글번호 입력해 : ");
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
		BoardDto dto = new BoardDto(0, "SW", "진짜 취업하고 싶어요", "저 진짜 간절해요 제발", 0, null);
		svc.writeBoard(dto);
	}
	
	@Test
	public void testUpdateBoard() throws Exception {
		svc.updateBoard(105, "미뇨", "진짜보고싶다");
	}
	
	@Test
	public void testDeleteBoard() throws Exception {
		svc.deleteBoard(124);
	}
}
