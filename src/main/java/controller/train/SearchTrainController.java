package controller.train;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import data.code.CodeItem;
import data.code.CodeResponseResult;
import data.station.Station;
import data.station.StationResponseResult;
import util.CodeAPI;
import util.StationAPI;

@WebServlet("/searchTrain")
public class SearchTrainController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String cityCode = "1";
		StationResponseResult srt = StationAPI.getStationResponseResult(cityCode);
		Station[] station = srt.getResponse().getBody().getItems().getItem();
		List<Station> li = new ArrayList<>();
		for (Station i : station) {
			li.add(i);
		}
		req.setAttribute("li", li);

		CodeResponseResult result = CodeAPI.getCodeResponseResult();
		CodeItem[] rst = result.getResponse().getBody().getItems().getItems();
		List<CodeItem> list = new ArrayList<>();
		for (CodeItem i : rst) {
			list.add(i);
		}

		req.setAttribute("list", list);

		req.getRequestDispatcher("/WEB-INF/views/trainList.jsp").forward(req, resp);

	}

}
