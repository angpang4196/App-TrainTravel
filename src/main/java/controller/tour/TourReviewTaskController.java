package controller.tour;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.google.gson.Gson;

import data.User;

@WebServlet("/reply-task")
public class TourReviewTaskController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		SqlSessionFactory factory = (SqlSessionFactory) req.getServletContext().getAttribute("sqlSessionFactory");
		SqlSession sqlSession = factory.openSession(true);

		req.setCharacterEncoding("utf-8");

		String cityname = req.getParameter("cityname");

		String contentId = req.getParameter("contentId");

		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("logonUser");
		String writer = user.getId();

		String content = req.getParameter("content");

		Map<String, String> map = new HashMap<>();
		map.put("contentId", contentId);
		map.put("writer", writer);
		map.put("content", content);

		sqlSession.insert("replys.createReply", map);
		sqlSession.close();

		//resp.sendRedirect("/summary?area=" + URLEncoder.encode(cityname,"utf-8"));
		resp.sendRedirect("/mapAndReview?contentId="+contentId);
		

	}

}
