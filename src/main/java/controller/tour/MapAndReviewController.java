package controller.tour;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import data.Review;
import data.tour.detail.TourDetailItem;
import data.tour.detail.TourDetailResponseResult;
import util.TourDetailAPI;

@WebServlet("/mapAndReview")
public class MapAndReviewController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		SqlSessionFactory factory = (SqlSessionFactory) req.getServletContext().getAttribute("sqlSessionFactory");
		SqlSession sqlSession = factory.openSession(true);

		String contentId = req.getParameter("contentId");

		List<Review> list = sqlSession.selectList("replys.findById", contentId);

		req.setAttribute("list", list);

		String cityname = req.getParameter("cityname");
		req.setAttribute("cityname", cityname);

		TourDetailItem tdi = TourDetailAPI.getTourDetailItem(contentId);

		req.setAttribute("contentid", contentId);
		req.setAttribute("tdi", tdi);

		req.getRequestDispatcher("/WEB-INF/views/mapAndReview.jsp").forward(req, resp);

	}

}
