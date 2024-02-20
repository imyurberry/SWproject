package esAction;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import esDao.PrivacyDao;

@WebServlet("/UpdateAddress")
public class UpdateAddressAction implements Action {
       
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String state = request.getParameter("state");
		String city = request.getParameter("city");
		String streetAddress = request.getParameter("street_address");
		int userIdx = (Integer)request.getSession().getAttribute("userIdx");
		String url = request.getParameter("url");
		
		String address = state +" "+ city +" "+ streetAddress;
		PrivacyDao privacyDao = new PrivacyDao();
		
		privacyDao.updateAddress(address, userIdx);
		
		request.getRequestDispatcher(url).forward(request, response);
	}

}
