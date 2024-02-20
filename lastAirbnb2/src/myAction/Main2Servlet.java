package myAction;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import myDao.Main2Dao;
import myVo.RepresentRoomListVo;
import myVo.RoomCategoryVo;

@WebServlet("/Main2")
public class Main2Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Main2Dao dao = new Main2Dao();
	      int cateIdx = 1; // �뼨轅명�∽옙沅싨뤆�룆占썬굤�맟�뜝�럩�젧
	      try {
	         cateIdx = Integer.parseInt(request.getParameter("cate"));
	      } catch(NumberFormatException e) {
	         e.printStackTrace();
	      }
//	      System.out.println(cateIdx);'
	      //�뇖�궠�샑占쎈�ㅿ옙�뫁伊볩옙遊� �뜝�럩逾좑옙逾녑뜝占� �뜝�럥�냱�뜝�럩逾ф쾬�꼶梨멱땻節놁뿉�뜝占� �뛾�룇猷꾤뵳占�
	       // list1�뜝�럥�뱺 �뇖�궠�샑占쎈�ㅿ옙�뫁伊볩옙遊뷴뜝�럡���뜝�럩�뮔 �뜝�럥堉뽫뼨�먯삕
	       ArrayList<RoomCategoryVo> list1 = Main2Dao.getCateAll();
	       ArrayList<RepresentRoomListVo> roomVo = dao.getRoom(cateIdx);
	      
	      
	      request.setAttribute("list1", list1);
	      request.setAttribute("cateIdx", cateIdx); 
	      request.setAttribute("roomVo",roomVo);
	      RequestDispatcher rd = request.getRequestDispatcher("main2.jsp");
	      rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
