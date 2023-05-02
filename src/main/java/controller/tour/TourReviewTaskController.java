package controller.tour;

import java.io.IOException;
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
		SqlSession sqlSession = factory.openSession();

		req.setCharacterEncoding("utf-8");

		String id = req.getParameter("contentId");

		String title = req.getParameter("title");

		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("logonUser");
		String writer = user.getId();

		String content = req.getParameter("content");
		System.out.println(id);
		System.out.println(writer);
		System.out.println(content);

		Map<String, String> map = new HashMap<>();

		map.put("id", id);
		map.put("writer", writer);
		map.put("content", content);
		map.put("title", title);
		sqlSession.insert("replys.createReply", map);
		sqlSession.commit();
		sqlSession.close();
		
		Gson gson =new Gson();
		resp.setContentType("text/plain;charset=utf-8");

	}

}
