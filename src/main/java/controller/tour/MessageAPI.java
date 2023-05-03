package controller.tour;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.google.gson.Gson;

import data.Review;

@WebServlet("/message")
public class MessageAPI extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		SqlSessionFactory factory = (SqlSessionFactory) req.getServletContext().getAttribute("sqlSessionFactory");
		SqlSession sqlSession = factory.openSession(true);

		Gson gson = new Gson();

		resp.setContentType("text/plain;charset=utf-8");

		String contentId = req.getParameter("contentId");

		List<Review> list = sqlSession.selectList("replys.findById", contentId);

		PrintWriter out = resp.getWriter();

		out.print(gson.toJson(list));
	}

}
