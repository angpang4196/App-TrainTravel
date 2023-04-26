package controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import data.User;
import data.code.CodeItem;
import data.station.StationItem;
import util.CodeAPI;
import util.StationAPI;

@WebServlet("/login-task")
public class LoginTaskController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		SqlSessionFactory factory = (SqlSessionFactory) req.getServletContext().getAttribute("sqlSessionFactory");
		SqlSession sqlSession = factory.openSession();

		String id = req.getParameter("id");
		String pass = req.getParameter("pass");
		User user = sqlSession.selectOne("users.findById", id);
		
		CodeItem[] ci = CodeAPI.getCodeResponseResult().getResponse().getBody().getItems().getItems();
		StationItem[] si = StationAPI.getStationResponseResult("1").getResponse().getBody().getItems().getItem();

		if (user == null) {
			resp.sendRedirect("/user/login?cause=error");
		} else {
			if (user.getPass().equals(pass)) {
				HttpSession session = req.getSession();
				session.setAttribute("logon", true);
				session.setAttribute("logonUser", user);
				
				req.setAttribute("ci", ci);
				req.setAttribute("si", si);
				req.getRequestDispatcher("WEB-INF/views/choose.jsp").forward(req, resp);
			} else {
				resp.sendRedirect("/index?cause=error");
			}
		}
		sqlSession.close();
	}

}