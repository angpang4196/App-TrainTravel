package controller.train;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import data.station.Station;
import data.station.StationResponseResult;
import util.StationAPI;

@WebServlet("/api/search/station")
public class SearchStationAPIController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		

		String citycode = req.getParameter("citycode");

		StationResponseResult sr = StationAPI.getStationResponseResult(citycode);
		Station[] st = sr.getResponse().getBody().getItems().getItem();
//		System.out.println(st.toString());
//		List<Station> li = new ArrayList<>();
//		for (Station s : st) {
//			li.add(s);
//		}
//		req.setAttribute("li", st);
		Gson gson = new Gson();

		resp.setContentType("text/plain;charset=utf-8");

		PrintWriter out = resp.getWriter();
		
		out.print(gson.toJson(st));
	}

}
