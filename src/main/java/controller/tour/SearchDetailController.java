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
import data.area.Area;
import data.destination.Destination;
import data.statuses.Status;
import data.tour.detail.TourDetailItem;
import data.tour.summary.TourSummaryItem;
import data.tour.summary.TourSummaryResponseResult;
import util.TourDetailAPI;
import util.TourSummaryAPI;

@WebServlet("/searchDetail")
public class SearchDetailController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");

		SqlSessionFactory factory = (SqlSessionFactory) req.getServletContext().getAttribute("sqlSessionFactory");
		SqlSession sqlSession = factory.openSession(true);
		HttpSession session = req.getSession();

		String contentName = req.getParameter("contentName");
		
		String cityname = req.getParameter("cityname");
		req.setAttribute("cityname", cityname);

		User user = (User) session.getAttribute("logonUser");
		String userId = user.getId();

		Map<String, String> map = new HashMap<>();

		map.put("userId", userId);

		Area area = sqlSession.selectOne("areas.findByName", cityname);
		String code = area.getCode();

		TourSummaryResponseResult result = TourSummaryAPI.getTourSummaryResponseResult(code);
		TourSummaryItem[] items = result.getResponse().getBody().getItems().getItem();

		String contentId = "";
		
		for (TourSummaryItem tsi : items) {
			if (tsi.getTitle().equals(contentName)) {
				contentId = tsi.getContentid();
			}
		}
		
		Status status = sqlSession.selectOne("statuses.statusCheck", contentId);
		if (status == null) {
			req.setAttribute("status", 0);
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
