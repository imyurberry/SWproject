package esAction;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import esDao.JoinDao;

@WebServlet("/JoinServlet")
public class JoinAction implements Action {
       
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String userId = request.getParameter("user_id");
		String pw = request.getParameter("pw");
		String phoneNum = request.getParameter("phone_num");
		String userRegidence = request.getParameter("user_regidence");
		String birthday = request.getParameter("birthday");
		String email = request.getParameter("email");
		//�쉶�썝媛��엯
		JoinDao joinDao = new JoinDao();
		joinDao.newJoinUser(userId, pw, phoneNum, userRegidence, birthday, email);
		
		request.getRequestDispatcher("main2.jsp").forward(request, response);
	}

}
