package esAction;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import action.Action;
import esDao.ProfileTimelineDao;
import esVo.GetPostReplyByPostIdx;
import esVo.PostVo;
import esVo.TotalPostVo;

public class ShowNextTimelinePageAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProfileTimelineDao protime = new ProfileTimelineDao();
		
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		int thisUserIdx = Integer.parseInt(request.getParameter("thisUserIdx"));
		//ArrayList<ArrayList<PostVo>> totalLists = new ArrayList();
		ArrayList<TotalPostVo> totalLists = new ArrayList<TotalPostVo>();
		ArrayList<PostVo> postLists = protime.getPostList(thisUserIdx);
		ArrayList<GetPostReplyByPostIdx> replyLists = protime.getReplyLists(thisUserIdx);
		
		for(PostVo vo : postLists) {
			ArrayList<GetPostReplyByPostIdx> replyList = protime.getReplyLists(vo.getPostIdx());
			int totalCountLike = protime.countLikeInPost(vo.getPostIdx());
			int totalCountReply = protime.getCountReply(vo.getPostIdx());
			totalLists.add(new TotalPostVo(vo, replyList, totalCountLike, totalCountReply));
		}
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		
		JSONArray postList = new JSONArray();
		for(TotalPostVo vo : totalLists) {
			JSONObject obj = new JSONObject();
			obj.put("postList" , vo.getPostList());
			obj.put("replyList", vo.getReplyList());
			obj.put("totalCountReply", vo.getTotalCountReply());
			obj.put("totalCountLike", vo.getTotalCountLike());
			postList.add(obj);
		}
		out.println(postList);
	
	}
	
}
