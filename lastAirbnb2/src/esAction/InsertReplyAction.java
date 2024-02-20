package esAction;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import action.Action;
import esDao.ProfileTimelineDao;

@WebServlet("/InsertReply")
public class InsertReplyAction implements Action {
       
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProfileTimelineDao protime = new ProfileTimelineDao();
	
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		
		int thisUserIdx = Integer.parseInt(request.getParameter("thisUserIdx"));		
		String content = request.getParameter("content");
		int postIdx = Integer.parseInt(request.getParameter("postIdx"));
		int userIdx = Integer.parseInt(request.getParameter("userIdx"));
		protime.InsertLikeAlarm(thisUserIdx, userIdx);
		
		JSONObject obj = new JSONObject();
		obj.put("replyResult", protime.insertReply(postIdx, userIdx, content));
		out.println(obj);
	}

}
