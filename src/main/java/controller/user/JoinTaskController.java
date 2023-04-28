package controller.user;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import data.User;

@WebServlet("/join-task")
public class JoinTaskController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		SqlSessionFactory factory = (SqlSessionFactory) req.getServletContext().getAttribute("sqlSessionFactory");
		SqlSession sqlSession = factory.openSession();

		String id = req.getParameter("id");
		String pass = req.getParameter("pass");

		User user = sqlSession.selectOne("users.findById", id);
		if (user == null) {
			Map<String, String> map = new HashMap<>();
			map.put("id", id);
			map.put("pass", pass);
			sqlSession = factory.openSession(true);
			sqlSession.insert("users.join", map);

			req.getRequestDispatcher("/WEB-INF/views/trainList.jsp").forward(req, resp);
		} else {
			resp.sendRedirect("/views/join?cause=existId");
		}
		sqlSession.close();

	}

}
