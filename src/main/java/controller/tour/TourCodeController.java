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

		String paramPage = req.getParameter("page");
		int p;
		if (paramPage == null) {
			p = 1;
		} else {
			p = Integer.parseInt(paramPage);
		}

		SqlSessionFactory factory = (SqlSessionFactory) req.getServletContext().getAttribute("sqlSessionFactory");
		SqlSession sqlSession = factory.openSession();

		System.out.println(cityname);
		Area area = sqlSession.selectOne("areas.findByName", cityname);
		String code = area.getCode();

		TourSummaryResponseResult tsr = TourSummaryAPI.getTourSummaryResponseResult(code, paramPage);
		TourSummaryItem[] tsi = tsr.getResponse().getBody().getItems().getItem();

		int total = tsr.getResponse().getBody().getTotalCount();
		int page = total / 10 + (total % 10 > 0 ? 1 : 0);

		int lastPage = total / 6 + (total % 6 > 0 ? 1 : 0);

		int last = (int) Math.ceil(p / 5.0) * 5;
		int start = last - 4;

		last = last > lastPage ? lastPage : last;
		req.setAttribute("start", start);
		req.setAttribute("last", last);

		boolean existNext = lastPage > last;
		boolean existPrev = p >= 6;
		req.setAttribute("existPrev", existPrev);
		req.setAttribute("existNext", existNext);
		req.setAttribute("area", cityname);

		req.setAttribute("tsi", tsi);

		req.getRequestDispatcher("/WEB-INF/views/tourList.jsp").forward(req, resp);

	}

}
