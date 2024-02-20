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

@WebServlet("/ClickLikeInTimeline")
public class ClickLikeInTimelineAction implements Action {
       
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int thisUserIdx = Integer.parseInt(request.getParameter("thisUserIdx"));
		int postIdx = Integer.parseInt(request.getParameter("postIdx"));
		String checkLike = request.getParameter("checkLike");
		ProfileTimelineDao protime = new ProfileTimelineDao();
		int userIdx = (Integer)request.getSession().getAttribute("userIdx");
		
		if(checkLike.equals("block")) {
			protime.InsertLikeAlarm(thisUserIdx, userIdx);
			protime.InsertPostLike(postIdx, userIdx);
		} else {
			protime.DeletePostLike(postIdx, userIdx);
		}
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		
		JSONObject obj = new JSONObject();
		obj.put("likeCount", protime.countLikeInPost(postIdx));
		out.println(obj);
	}

}
