package controller.train;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import data.code.CodeItem;
import data.code.CodeResponseResult;
import data.station.StationItem;
import data.station.StationResponseResult;
import util.CodeAPI;
import util.StationAPI;

@WebServlet("/searchTrain")
public class SearchTrainController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String cityCode = req.getParameter("citycode");
		StationResponseResult srt = StationAPI.getStationResponseResult(cityCode);
		StationItem[] station = srt.getResponse().getBody().getItems().getItem();

		req.setAttribute("st", station);

		CodeResponseResult result = CodeAPI.getCodeResponseResult();
		CodeItem[] ci = result.getResponse().getBody().getItems().getItems();

		req.setAttribute("ci", ci);

		req.getRequestDispatcher("/WEB-INF/views/trainList.jsp").forward(req, resp);

	}

}
