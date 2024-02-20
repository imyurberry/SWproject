package myAction;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import myDao.Main2Dao;
import myVo.RepresentRoomListVo;
import myVo.RoomCategoryVo;

public class ShowRoomListsByFilterAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int minPrice = Integer.parseInt(request.getParameter("min_price").equals("")? "0": request.getParameter("min_price"));
		int maxPrice = Integer.parseInt(request.getParameter("max_price").equals("")? "0": request.getParameter("max_price"));
		int roomCategory = Integer.parseInt(request.getParameter("category_idx"));
		
		//ħ�밪
		int bedRoom = Integer.parseInt(request.getParameter("fil3_btns"));
		System.out.println(bedRoom);
		int bedTotal = Integer.parseInt(request.getParameter("fil3_btns2"));
		int bathRoom = Integer.parseInt(request.getParameter("fil3_btns3"));
		
		Main2Dao main2Dao = new Main2Dao();
		ArrayList<RoomCategoryVo> cateList = Main2Dao.getCateAll();
		ArrayList<RepresentRoomListVo> roomListByFilter = main2Dao.showRoomListsByFilter(minPrice, maxPrice, roomCategory,bedRoom, bedTotal,bathRoom);
		
		request.setAttribute("cateIdx", roomCategory);
		request.setAttribute("list1", cateList);
		request.setAttribute("roomVo", roomListByFilter);
		
		request.getRequestDispatcher("main2.jsp").forward(request, response);
	}
	
}
