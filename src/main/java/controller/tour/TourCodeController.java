package controller.tour;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import data.area.Area;
import data.tour.summary.TourSummaryItem;
import data.tour.summary.TourSummaryResponseResult;
import util.TourSummaryAPI;

@WebServlet("/summary")
public class TourCodeController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String cityname = req.getParameter("area");

		SqlSessionFactory factory = (SqlSessionFactory) req.getServletContext().getAttribute("sqlSessionFactory");
		SqlSession sqlSession = factory.openSession();

		Area area = sqlSession.selectOne("areas.findByName", cityname);
		String code = area.getCode();

		TourSummaryResponseResult tsr = TourSummaryAPI.getTourSummaryResponseResult(code);
		TourSummaryItem[] tsi = tsr.getResponse().getBody().getItems().getItem();
		req.setAttribute("tsi", tsi);

		req.getRequestDispatcher("/WEB-INF/views/tourList.jsp").forward(req, resp);

	}

}
