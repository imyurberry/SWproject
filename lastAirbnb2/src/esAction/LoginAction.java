package esAction;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import esDao.LoginDao;

@WebServlet("/Login")
public class LoginAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String phoneNum = request.getParameter("phone_num");
		String pw = request.getParameter("pw");
		LoginDao loginDao = new LoginDao();
		String url = request.getParameter("url");
		
		int userIdx = loginDao.getIdxByPw(phoneNum);
		boolean checkLogin = loginDao.getLoginByPw(phoneNum, pw);
		int howManyAlarm = loginDao.getCountAlarm(userIdx);
		
		request.setAttribute("howManyAlarm", howManyAlarm);
		request.getSession().setAttribute("userIdx", userIdx);
		request.getSession().setMaxInactiveInterval(30*60);	//Session占쎌뱽 30�겫占� 占쎈츟占쎈퓠 占쎌읈�겫占� �뜮袁⑹뒲占쎈뼄.
		request.setAttribute("checkLogin", checkLogin);
		request.getRequestDispatcher(url).forward(request, response);
	}

}
