package controller;

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

import data.area.Area;
import data.areaCode.AreaCodeItem;
import data.areaCode.AreaCodeResponseResult;
import util.AreaCodeAPI;

@WebServlet("/index")
public class IndexController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		AreaCodeResponseResult ar = AreaCodeAPI.getAreaCodeResponseResult();
		AreaCodeItem[] ai = ar.getResponse().getBody().getItems().getItem();

		SqlSessionFactory factory = (SqlSessionFactory) req.getServletContext().getAttribute("sqlSessionFactory");
		SqlSession sqlSession = factory.openSession(true);

		
		

		req.getRequestDispatcher("/WEB-INF/index.jsp").forward(req, resp);
	}

}
