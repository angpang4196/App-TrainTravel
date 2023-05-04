package controller.train;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import data.code.CodeItem;
import data.station.StationItem;
import data.train.TrainItem;
import data.train.TrainResponseResult;
import util.CodeAPI;
import util.StationAPI;
import util.TrainAPI;

@WebServlet("/trainInfo")
public class TrainInfoController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		resp.setContentType("text/html;charset=utf-8");

		String a = req.getParameter("depPlaceId");
		String b = req.getParameter("arrPlaceId");
		String c = req.getParameter("depPlandTime");

		if (a != null || b != null) {
			if (a.equals("출발지를 선택해주세요") || b.equals("")) {
				resp.sendRedirect("/trainList?error=1");
				return;
			}
		}

		String arrInfo = req.getParameter("arrPlaceId");
		String[] arrInfos = arrInfo.split("&");
		String arrCode = arrInfos[0];
		String arrName = arrInfos[1];
		req.setAttribute("arrName", arrName);

		String depPlaceId = req.getParameter("dep");
		String arrPlaceId = req.getParameter("arr");
		String depPlandTime = req.getParameter("depPlandTime");

		depPlandTime = depPlandTime.replaceAll("-", "");

		TrainResponseResult tr = TrainAPI.getTrainResponseResult(depPlaceId, arrPlaceId, depPlandTime);

		CodeItem[] ci = CodeAPI.getCodeResponseResult().getResponse().getBody().getItems().getItems();
		StationItem[] si = StationAPI.getStationResponseResult("1").getResponse().getBody().getItems().getItem();

		if (tr == null) {
			req.setAttribute("ci", ci);
			req.setAttribute("si", si);

			req.setAttribute("cause", "notData");
			req.getRequestDispatcher("/WEB-INF/views/trainList.jsp").forward(req, resp);
		} else {
			int totalCount = tr.getResponse().getBody().getTotalCount();
			tr = TrainAPI.getTrainResponseResult(depPlaceId, arrPlaceId, depPlandTime, totalCount);
			TrainItem[] ti = tr.getResponse().getBody().getItems().getItem();

			req.setAttribute("ti", ti);
			req.setAttribute("arrName", arrName);

			req.getRequestDispatcher("/WEB-INF/views/trainInfo.jsp").forward(req, resp);
		}
	}

}
