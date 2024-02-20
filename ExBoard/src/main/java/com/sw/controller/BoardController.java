package com.sw.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sw.dto.BoardDto;
import com.sw.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	BoardService bService;
	
	@RequestMapping("/list")
	public String boardList(HttpServletRequest request) {
		int page = 1;
		try {
			page = Integer.parseInt(request.getParameter("page"));
		} catch(Exception e) { e.printStackTrace(); }
		
		ArrayList<BoardDto> listBoard = bService.getBoardListByPageNumber(page);
		
		int p = (page/5)*5 - (page%5==0 ? 5 : 0);
		int startPNum = p + 1;
		int endPNum = p + 5;
		int lastPageNum = bService.getLastPageNumber();
		
		request.setAttribute("listBoard", listBoard);
		request.setAttribute("pageNum", page);
		request.setAttribute("startPNum", startPNum);
		request.setAttribute("endPNum", endPNum);
		request.setAttribute("lastPageNum", lastPageNum);
		
		return "board_list";
	}
	
	@RequestMapping("/detail")
	public String boardDetail(HttpServletRequest request) {
		int bno = Integer.parseInt(request.getParameter("bno"));
		BoardDto dto = bService.getBoardDetail(bno);
		bService.increaseHitcount(bno);
		request.setAttribute("BoardDto", dto);
		return "board_detail";
	}
	
	@RequestMapping("/write")
	public String boardWrtieForm() {
		return "board_write";
	}
	
	@RequestMapping("/write/action")
	public String boardWriteAction(BoardDto dto) {
		bService.writeBoard(dto);
		return "forward:/board/list";
	}
	
	@RequestMapping("/modify")
	public String boardModifyForm(int bno, Model model) {
		BoardDto dto = bService.getBoardDetail(bno);
		model.addAttribute("dto", dto);
		return "board_modify";
	}
	
	@RequestMapping("/modify/action")
	public String boardModifyAction(int bno, String title, String content) {
		bService.updateBoard(bno, title, content);
		return "forward:/board/detail?bno="+bno;
	}
	
	@RequestMapping("/delete/action")
	public String boardDeleteAction(int bno) {
		bService.deleteBoard(bno);
		return "forward:/board/list";
	}
}
