package controller.tour;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.google.gson.Gson;

import data.area.Area;
import data.cate.Cate;
import data.db.tour.DBTourList;

@WebServlet("/api/search")
public class SearchNameController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		SqlSessionFactory factory = (SqlSessionFactory) req.getServletContext().getAttribute("sqlSessionFactory");
		SqlSession sqlSession = factory.openSession();

		String q = req.getParameter("q");
		String cityname = req.getParameter("cityname");

		Area area = sqlSession.selectOne("areas.findByName", cityname);
		String areaCode = area.getCode();
		resp.setContentType("text/plain;charset=utf-8");

//		TourSummaryResponseResult result = TourSummaryAPI.getTourSummaryResponseResult(code);
//		TourSummaryItem[] items = result.getResponse().getBody().getItems().getItem();

		Map<String, String> map = new HashMap<>();
		map.put("areaCode", areaCode);
		map.put("q", q);

		if (q.length() >= 2) {
			List<DBTourList> list = sqlSession.selectList("tourlist.findByArea", map);

			List<String> names = new ArrayList<>();

			for (DBTourList tsi : list) {
				names.add(tsi.getTitle());
			}

			List<String> complete = new ArrayList<>();
			for (String s : names) {
				if (s.contains(q)) {
					complete.add(s);
				}
			}
			Gson gson = new Gson();

			PrintWriter out = resp.getWriter();

			out.println(gson.toJson(complete));
		}
	}

}
