package controller.tour;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import data.area.Area;
import data.cate.Cate;
import data.db.tour.DBTourList;
import data.tour.summary.TourSummaryItem;
import data.tour.summary.TourSummaryResponseResult;
import util.TourSummaryAPI;

@WebServlet("/summary")
public class TourCodeController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		SqlSessionFactory factory = (SqlSessionFactory) req.getServletContext().getAttribute("sqlSessionFactory");
		SqlSession sqlSession = factory.openSession(true);

		String cate = req.getParameter("cate");

		if (cate == null) {
			cate = "관광지";
		}

		req.setAttribute("cate", cate);

		Cate c = sqlSession.selectOne("cates.findByType", cate);
		String contentTypeId = c.getCode();

		List<Cate> li = sqlSession.selectList("cates.findAll");
		req.setAttribute("cateAll", li);

		String cityname = req.getParameter("area");
		req.setAttribute("cityname", cityname);

		String paramPage = req.getParameter("page");
		int p;
		if (paramPage == null) {
			p = 1;
		} else {
			p = Integer.parseInt(paramPage);
		}
		Area area = sqlSession.selectOne("areas.findByName", cityname);
		String code = area.getCode();

//		TourSummaryResponseResult tsr = TourSummaryAPI.getTourSummaryResponseResult(code, paramPage, contentTypeId);
//		TourSummaryItem[] tsi = tsr.getResponse().getBody().getItems().getItem();

		String flag = req.getParameter("flag");
		Map<String, String> map = new HashMap<>();
		map.put("areaCode", code);
		map.put("contentTypeId", contentTypeId);
		map.put("flag", flag);

		List<DBTourList> list = new ArrayList<>();

		if (flag == null || flag.equals("asc")) {
			list = sqlSession.selectList("tourlist.findByContentIdAndArea", map);
		} else if (flag.equals("views")) {
			list = sqlSession.selectList("destination.orderByViews", map);
		} else {
			list = sqlSession.selectList("destination.orderByLikes", map);
		}
		System.out.println(list.get(0).getTitle());
		List<DBTourList> sendList = new ArrayList<>();

		int end = p * 12;
		if (list.size() < 12) {
			end = list.size();
		}

		for (int i = 12 * (p - 1); i < end; i++) {
			sendList.add(list.get(i));
		}

		int total = list.size();

		int lastPage = total / 12 + (total % 12 > 0 ? 1 : 0);

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

		req.setAttribute("tsi", sendList);

		req.getRequestDispatcher("/WEB-INF/views/tourList.jsp").forward(req, resp);

	}

}
