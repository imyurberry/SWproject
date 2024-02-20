package myAction;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import esVo.UserInfoVo;
import myDao.Main3Dao;
import myVo.ConvenientVo;
import myVo.ReviewVo;
import myVo.RoomExplainVo;
import myVo.RoomImageVo;
import myVo.RoomInfoVo;
import myVo.RoomVo;
import myVo.StayVo;


@WebServlet("/Main3")
public class Main3Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 Main3Dao dao3 = new Main3Dao();

		 int roomIdx = Integer.parseInt(request.getParameter("roomIdx"));
	      RoomVo roomvo = dao3.getRoom(roomIdx);
	      int hostidx = roomvo.getUser_idx();
	      
	      
	      String str = roomvo.getRoom_info_idx(); //1,2,3
	      String[] str2 = str.split(",");
	      
	      String conv = roomvo.getConvenient_idx();
	      

	                                                
	      int countReview = dao3.getCountReview(roomIdx);
	      RoomImageVo imagevo = dao3.getRoomImage(roomIdx);
	      UserInfoVo uservo = dao3.getUserInfo(hostidx);
	      RoomExplainVo explainvo = dao3.getRoomExplain(roomIdx);
	      ArrayList<RoomInfoVo> roominfovo = dao3.getRoomInfo(roomIdx,str2);
	      ArrayList<ConvenientVo> convenientvo = dao3.getConvenientV2(conv);
	      ArrayList<ReviewVo> reviewvo = dao3.getReview(roomIdx);
	      ArrayList<StayVo> stayvo = dao3.getStay(roomIdx);
	      

	      
	      request.setAttribute("roomvo",roomvo);
	      request.setAttribute("countReview",countReview);
	      request.setAttribute("imagevo",imagevo);
	      request.setAttribute("uservo",uservo);
	      request.setAttribute("explainvo",explainvo);
	      request.setAttribute("roominfovo",roominfovo);
	      request.setAttribute("reviewvo",reviewvo);
	      request.setAttribute("convenientvo",convenientvo);
	      request.setAttribute("stayvo",stayvo);
//	      for(StayVo vo : stayvo) {
//	    	  if(vo.getStay_img().contains("svg")){
//	    		  System.out.println(vo.getStay_img());
//	    	  }else {
//	    		  System.out.println(vo.getStay_img());
//	    	  }
//	      }
//	      
	      
	      
	      RequestDispatcher rd = request.getRequestDispatcher("main3.jsp");
	      rd.forward(request, response);
	   }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
