package controller.train;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import data.code.CodeItem;
import data.station.StationItem;
import util.CodeAPI;
import util.StationAPI;

@WebServlet("/trainList")
public class TrainListController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		CodeItem[] ci = CodeAPI.getCodeResponseResult().getResponse().getBody().getItems().getItems();
		StationItem[] si = StationAPI.getStationResponseResult("1").getResponse().getBody().getItems().getItem();
     
		if (ci == null && si == null) {
			req.setAttribute("cause", "notData");
		}

		req.setAttribute("ci", ci);
		req.setAttribute("si", si);

		req.getRequestDispatcher("/WEB-INF/views/trainList.jsp").forward(req, resp);

	}

}
