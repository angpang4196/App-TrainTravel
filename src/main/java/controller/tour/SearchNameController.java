package controller.tour;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.google.gson.Gson;

import data.area.Area;
import data.tour.summary.TourSummaryItem;
import data.tour.summary.TourSummaryResponseResult;
import util.TourSummaryAPI;

@WebServlet("/api/search")
public class SearchNameController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		SqlSessionFactory factory = (SqlSessionFactory) req.getServletContext().getAttribute("sqlSessionFactory");
		SqlSession sqlSession = factory.openSession();

		String q = req.getParameter("q");
		String cityname = req.getParameter("cityname");

		Area area = sqlSession.selectOne("areas.findByName", cityname);
		String code = area.getCode();
		resp.setContentType("text/plain;charset=utf-8");

		TourSummaryResponseResult result = TourSummaryAPI.getTourSummaryResponseResult(code);
		TourSummaryItem[] items = result.getResponse().getBody().getItems().getItem();

		List<String> names = new ArrayList<>();
		
		for(TourSummaryItem tsi : items) {
			names.add(tsi.getTitle());
		}

		List<String> complete = new ArrayList<>();
		for (String s : names) {
			if(q.length() == 2) {
				if (s.contains(q)) {
					complete.add(s);
				}
			}
		}
		
		Gson gson = new Gson();

		PrintWriter out = resp.getWriter();

		out.println(gson.toJson(complete));
	}

}
