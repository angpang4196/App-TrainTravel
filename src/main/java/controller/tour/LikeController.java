package controller.tour;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import data.User;
import data.destination.Destination;
import data.statuses.Status;
import data.tour.detail.TourDetailItem;
import util.TourDetailAPI;

@WebServlet("/like")
public class LikeController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		SqlSessionFactory factory = (SqlSessionFactory) req.getServletContext().getAttribute("sqlSessionFactory");
		SqlSession sqlSession = factory.openSession(true);

		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("logonUser");
		String userId = user.getId();

		String contentId = req.getParameter("contentid");
		
		Map<String, String> map = new HashMap<>();
		map.put("userId", userId);
		map.put("contentId", contentId);

		Status status = sqlSession.selectOne("statuses.statusCheck", contentId);

		if (status == null) {
			sqlSession.insert("statuses.status", map);
			sqlSession.update("destination.updateLikes", contentId);
		} else {
			req.setAttribute("status", status.getStatus());
		}

		Destination dt = sqlSession.selectOne("destination.findById", contentId);
		
		if (dt == null) {
			sqlSession.insert("destination.createDestination", contentId);
		}
		
		sqlSession.update("destination.updateViews", contentId);

		sqlSession.close();

		TourDetailItem tdi = TourDetailAPI.getTourDetailItem(contentId);

		req.setAttribute("contentid", contentId);
		req.setAttribute("detail", tdi);

		req.getRequestDispatcher("/WEB-INF/views/detail.jsp").forward(req, resp);
	}

}
