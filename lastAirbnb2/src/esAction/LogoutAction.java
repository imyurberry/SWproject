package esAction;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;

@WebServlet("/Logout")
public class LogoutAction implements Action {
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().removeAttribute("userIdx");
		request.getSession().removeAttribute("userList");
		String url = request.getParameter("url");
		
		request.getRequestDispatcher("LswController?command=main2").forward(request, response);
	}

}
