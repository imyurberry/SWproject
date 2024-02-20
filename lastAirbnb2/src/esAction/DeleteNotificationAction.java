package esAction;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import esDao.NotificationDao;

@WebServlet("/DeleteNotification")
public class DeleteNotificationAction implements Action {
       
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = Integer.parseInt(request.getParameter("idx"));
		NotificationDao notiDao = new NotificationDao();
		
		notiDao.deleteNotification(idx);
		
	}

}
