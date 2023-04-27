package controller.train;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import data.train.TrainItem;
import data.train.TrainResponseResult;
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
		
		if(tr == null) {
			resp.sendRedirect("/views/trainlist?cause=error");
		}

		TrainItem[] ti = tr.getResponse().getBody().getItems().getItem();
		req.setAttribute("ti", ti);

		req.getRequestDispatcher("/WEB-INF/views/trainInfo.jsp").forward(req, resp);
	}

}
