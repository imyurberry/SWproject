package esAction;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import action.Action;
import esDao.MessageDao;
import esVo.ChatDetailVo;

@WebServlet("/ShowChatAction")
public class ShowChatAction implements Action {
       
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		MessageDao messDao = new MessageDao();
		
		int userIdx = Integer.parseInt(request.getParameter("userIdx"));
		int msgListIdx = Integer.parseInt(request.getParameter("msgListIdx"));
		
		ArrayList<ChatDetailVo> chatList = messDao.showChatList(userIdx, msgListIdx);
		
		JSONArray arr = new JSONArray();
		for(ChatDetailVo vo : chatList) {
			JSONObject obj = new JSONObject();
			obj.put("userId", vo.getUserId());
			obj.put("userImage", vo.getUserImage());
			obj.put("msgListIdx", vo.getMsgListIdx());
			obj.put("userIdx", vo.getUserIdx());
			obj.put("msg", vo.getMsg());
			obj.put("dateTime", vo.getDateTime());
			obj.put("msgIdx", vo.getMsg_idx());
			
			arr.add(obj);
		}
		out.println(arr);
		
	}

}
