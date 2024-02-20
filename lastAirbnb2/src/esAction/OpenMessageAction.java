package esAction;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import esDao.MessageDao;
import esVo.ChatListVo;
import esVo.EmojiVo;

public class OpenMessageAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MessageDao messDao = new MessageDao();
		int userIdx = (Integer)(request.getSession().getAttribute("userIdx"));
		int thisUserIdx = 0;
		try {
			thisUserIdx = Integer.parseInt(request.getParameter("thisUserIdx"));
		} catch(NumberFormatException e) {  }
		boolean checkChatList = messDao.checkChatList(userIdx, thisUserIdx);
		//기존채팅방에 없을 때 추가하기
		if(checkChatList && thisUserIdx > 0) {
			messDao.addChatList(userIdx, thisUserIdx);
			messDao.addChatList(thisUserIdx, userIdx);
		}
		//채팅창 이모티콘목록 받기
		ArrayList<EmojiVo> listEmojiVo = messDao.getAllEmoji();
		//채팅목록 가져오기
		ArrayList<ChatListVo> chatList = messDao.getChatList(userIdx);
		
		request.setAttribute("chatList", chatList);
		request.setAttribute("listEmojiVo", listEmojiVo);
		request.getRequestDispatcher("message.jsp").forward(request, response);
	}

}
