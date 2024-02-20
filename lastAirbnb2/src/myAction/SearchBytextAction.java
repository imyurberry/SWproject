package myAction;

import java.io.IOException;  
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import action.Action;
import myDao.Main3Dao;
import myVo.ReviewVo;

public class SearchBytextAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String orderBy = request.getParameter("orderby");  // "최신순", "높은평점순"
		String searchText = request.getParameter("searchText");
		int roomIdx = Integer.valueOf(request.getParameter("roomIdx")); 
		System.out.println(searchText);
		System.out.println(roomIdx);
		
		Main3Dao dao = new Main3Dao();
System.out.println("orderBy : " + orderBy);		
		ArrayList<ReviewVo> reviewList = dao.getSearch(roomIdx, searchText, orderBy);

		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json"); // MIME , 응답형식지정
		PrintWriter out = response.getWriter(); //pritwirter 객체얻음
		JSONArray array = new JSONArray();
		
		for(ReviewVo vo : reviewList) {
			JSONObject obj = new JSONObject();
			obj.put("room_idx",vo.getRoom_idx());
			obj.put("review_idx",vo.getReview_idx());
			obj.put("review",vo.getReview());
			obj.put("user_idx",vo.getUser_idx());
			obj.put("score",vo.getScore());
			obj.put("written_date",vo.getWritten_date());
			obj.put("user_id",vo.getUser_id());
			obj.put("user_regidence",vo.getUser_regidence());
			obj.put("user_image",vo.getUser_image());
			array.add(obj);
		}
		out.print(array);
	}
	
}
