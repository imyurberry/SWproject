package myAction;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import myDao.Main2Dao;
import myDao.RealWishlistDao;
import myVo.RepresentRoomListVo;
import myVo.RoomCategoryVo;
import swVo.WishlistListVo;

public class main2Action implements Action{
   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   HttpSession session = request.getSession();
	   int userIdx = 1;   // TODO : 세션으로부터 가져와야 돼.
	   
      Main2Dao dao = new Main2Dao();
      RealWishlistDao wDao = new RealWishlistDao();
      
      int cateIdx = 1; 
      try {
    	  cateIdx = Integer.parseInt(request.getParameter("cate"));
      } catch(NumberFormatException e) {}
//    System.out.println(cateIdx);'

      ArrayList<RoomCategoryVo> list1 = Main2Dao.getCateAll();
      ArrayList<RepresentRoomListVo> roomVo = dao.getRoom(cateIdx);
      
      ArrayList<WishlistListVo> listWish = wDao.getWishlistListVo(userIdx);
      
      request.setAttribute("list1", list1);
      request.setAttribute("cateIdx", cateIdx); 
      request.setAttribute("roomVo",roomVo);
      request.setAttribute("listWish", listWish);
      RequestDispatcher rd = request.getRequestDispatcher("main2.jsp");
      rd.forward(request, response);
   }

}