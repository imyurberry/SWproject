package swAction;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import swDao.CollectionDao;
import swDao.ExperienceDao;
import swVo.ExpCollectionVo;
import swVo.ExpReviewVo;
import swVo.ExperienceVo;

public class CollectionAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ExpCollectionVo expcollectionVO = null;
		int cIdx = Integer.parseInt(request.getParameter("collection_idx"));
		ExpReviewVo expreviewVO = null;
		
		CollectionDao cDao = new CollectionDao();
		expcollectionVO = cDao.getExpCollection(cIdx);
		ArrayList<ExperienceVo> listColExp = cDao.getCollectionExp(cIdx);
		ExperienceDao eDao = new ExperienceDao();
		// expreviewVO = eDao.getExpReview((Integer)(request.getAttribute("exp_idx")));
		
		request.setAttribute("cIdx", cIdx);
		request.setAttribute("expcollectionVO", expcollectionVO);
		request.setAttribute("listColExp", listColExp);
		RequestDispatcher rd = request.getRequestDispatcher("Collection.jsp");
		rd.forward(request, response);
	}

}
