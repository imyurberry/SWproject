package myAction;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import myDao.Main3Dao;
import myVo.RoomImageVo;
import myVo.RoomVo;

public class RoomPaymentAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Main3Dao dao = new Main3Dao();
		
		int roomIdx = Integer.parseInt(request.getParameter("roomIdx"));
		String guest = request.getParameter("guest");
		String dates = request.getParameter("dates");
		RoomVo roomvo = dao.getRoom(roomIdx);
		int countReview = dao.getCountReview(roomIdx);
		RoomImageVo imagevo = dao.getRoomImage(roomIdx);
		
		
	    request.setAttribute("roomvo",roomvo);
	    request.setAttribute("countReview",countReview);
	    request.setAttribute("imagevo",imagevo);
	    request.setAttribute("guest", guest);
	    request.setAttribute("dates", dates);
	    
	    
	    RequestDispatcher rd = request.getRequestDispatcher("RoomPayment.jsp");
	     rd.forward(request, response);
	}



}
