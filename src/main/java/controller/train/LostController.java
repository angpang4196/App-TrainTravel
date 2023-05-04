package controller.train;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import data.LostItem;

@WebServlet("/lost")
public class LostController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		SqlSessionFactory factory = (SqlSessionFactory) req.getServletContext().getAttribute("sqlSessionFactory");
		SqlSession sqlSession = factory.openSession(true);
		
		
		
		List<LostItem> li = sqlSession.selectList("losts.findAll");
		System.out.println(li + "k");
		req.setAttribute("lostItem", li);

		String spell = req.getParameter("spell");
		if (spell == null) {
			spell = "가";
		}

		LostItem item = sqlSession.selectOne("losts.findBySpell", spell);
		
		req.setAttribute("item", item);
		
		sqlSession.close();
		
		req.getRequestDispatcher("/WEB-INF/views/lost.jsp").forward(req, resp);
	}

}
