package esAction;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import esDao.PrivacyDao;

@WebServlet("/UpdatePhoneNumber")
public class UpdatePhoneNumAction implements Action {
       
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String phoneNum = request.getParameter("phone_num");
		PrivacyDao privacyDao = new PrivacyDao();
		int userIdx = (Integer)request.getSession().getAttribute("userIdx");
		
		privacyDao.updatePhoneNum(phoneNum, userIdx);
		
		request.getRequestDispatcher("privacy.jsp").forward(request, response);
	}

}
