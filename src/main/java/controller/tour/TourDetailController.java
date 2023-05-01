package controller.tour;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import data.tour.detail.TourDetailItem;
import data.tour.detail.TourDetailResponseResult;
import data.tour.summary.TourSummaryResponseResult;
import util.TourDetailAPI;

@WebServlet("/detail")
public class TourDetailController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String contentId = req.getParameter("contentId");

		TourDetailItem tdi  = TourDetailAPI.getTourDetailItem(contentId);
		
		req.setAttribute("contentid", contentId);
		req.setAttribute("detail", tdi);

		req.getRequestDispatcher("/WEB-INF/views/detail.jsp").forward(req, resp);
	}

}
