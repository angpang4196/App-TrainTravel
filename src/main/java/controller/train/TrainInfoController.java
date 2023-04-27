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
			TrainItem[] ti = tr.getResponse().getBody().getItems().getItem();
			req.setAttribute("ti", ti);

			req.getRequestDispatcher("/WEB-INF/views/trainInfo.jsp").forward(req, resp);
		}
	}

}
