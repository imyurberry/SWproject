package esAction;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import esDao.PrivacyDao;

@WebServlet("/UpdateSecondNum")
public class UpdateSecondNumAction implements Action {
       
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String secondNum = request.getParameter("secondNum");
		int userIdx = (Integer)request.getSession().getAttribute("userIdx"); 
		String url = request.getParameter("url");
		
		PrivacyDao privacyDao = new PrivacyDao();
		
		privacyDao.updateSecondNum(secondNum, userIdx);
	
		request.getRequestDispatcher(url).forward(request, response);
	}

}
