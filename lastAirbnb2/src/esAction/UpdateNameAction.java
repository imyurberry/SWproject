package esAction;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import esDao.PrivacyDao;

@WebServlet("/UpdateName")
public class UpdateNameAction implements Action {
       
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("last_name") + request.getParameter("first_name");
		int	userIdx = (Integer)request.getSession().getAttribute("userIdx");
		PrivacyDao privacyDao = new PrivacyDao();
		privacyDao.updateName(name, userIdx);
		
		request.getRequestDispatcher("privacy.jsp").forward(request, response);
	}

}
