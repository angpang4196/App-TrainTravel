package controller.tour;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import data.tour.detail.TourDetailItem;
import data.tour.detail.TourDetailResponseResult;
import util.TourDetailAPI;

@WebServlet("/mapAndReview")
public class MapAndReviewController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String contentId = req.getParameter("contentid");

		TourDetailItem tdi = TourDetailAPI.getTourDetailItem(contentId);

		req.setAttribute("contentid", contentId);
		req.setAttribute("tdi", tdi);

		req.getRequestDispatcher("/WEB-INF/views/mapAndReview.jsp").forward(req, resp);

	}

}
