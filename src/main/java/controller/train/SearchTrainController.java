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
import data.train.TrainItem;
import data.train.TrainResponseResult;
import util.CodeAPI;
import util.StationAPI;
import util.TrainAPI;

@WebServlet("/searchTrain")
public class SearchTrainController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


	
		
	
		    
		
	

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
