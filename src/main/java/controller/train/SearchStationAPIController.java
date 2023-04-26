package controller.train;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import data.station.StationItem;
import data.station.StationResponseResult;
import util.StationAPI;

@WebServlet("/api/search/station")
public class SearchStationAPIController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String citycode = req.getParameter("citycode");

		StationResponseResult sr = StationAPI.getStationResponseResult(citycode);
		StationItem[] st = sr.getResponse().getBody().getItems().getItem();

		Gson gson = new Gson();

		resp.setContentType("text/plain;charset=utf-8");

		PrintWriter out = resp.getWriter();

		out.print(gson.toJson(st));
	}

}
