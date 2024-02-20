package esAction;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import action.Action;
import esDao.ProfileTimelineDao;

public class DoFollowAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userIdx = Integer.valueOf(request.getParameter("userIdx"));
		int thisUserIdx = Integer.valueOf(request.getParameter("thisUserIdx"));
		ProfileTimelineDao profileTimeline = new ProfileTimelineDao();
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		
		JSONObject obj = new JSONObject();
		boolean followResult = profileTimeline.checkFollowing(userIdx, thisUserIdx);
		obj.put("followResult", followResult);
		if(followResult) {
			profileTimeline.addFollowing(userIdx , thisUserIdx);
			profileTimeline.InsertFollowingAlarm(thisUserIdx, userIdx);
		}
		out.println(obj);
	}

}
