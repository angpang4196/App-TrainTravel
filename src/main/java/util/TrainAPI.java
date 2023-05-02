package util;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.net.http.HttpResponse.BodyHandlers;
import java.util.LinkedHashMap;
import java.util.Map;

import com.google.gson.Gson;

import data.train.TrainResponseResult;

public class TrainAPI {

	public static TrainResponseResult getTrainResponseResult(String depPlaceId, String arrPlaceId,
			String depPlandTime) {

		try {
			String target = "http://apis.data.go.kr/1613000/TrainInfoService/getStrtpntAlocFndTrainInfo";

			Map<String, String> params = new LinkedHashMap<>();
			params.put("serviceKey",
					"pn%2BYJ4SQX3S%2B%2FgbKi30JDEXj5Wqo2HYKhhKbzU1dC9d3NcSrmyo1a4WAbD72FlI0g2dPY%2B7ngYVX7i0gmvp5pw%3D%3D");
			params.put("_type", "json");
			params.put("depPlaceId", depPlaceId);
			params.put("arrPlaceId", arrPlaceId);
			params.put("depPlandTime", depPlandTime);

			String queryString = QueryStringBuilder.build(params);
			URI uri = new URI(target + "?" + queryString);

			// HttpClient 객체를 활용하는 방식
			HttpClient client = HttpClient.newHttpClient();
			HttpRequest request = HttpRequest.newBuilder(uri).GET().build();
			HttpResponse<String> response = client.send(request, BodyHandlers.ofString());

			Gson gson = new Gson();

			TrainResponseResult result = null;

			if (gson.fromJson(response.body(), TrainResponseResult.class) != null) {
				result = gson.fromJson(response.body(), TrainResponseResult.class);

				return result;
			} else {
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public static TrainResponseResult getTrainResponseResult(String depPlaceId, String arrPlaceId, String depPlandTime,
			int totalCount) {

		try {
			String target = "http://apis.data.go.kr/1613000/TrainInfoService/getStrtpntAlocFndTrainInfo";

			Map<String, String> params = new LinkedHashMap<>();
			params.put("serviceKey",
					"pn%2BYJ4SQX3S%2B%2FgbKi30JDEXj5Wqo2HYKhhKbzU1dC9d3NcSrmyo1a4WAbD72FlI0g2dPY%2B7ngYVX7i0gmvp5pw%3D%3D");
			params.put("_type", "json");
			params.put("depPlaceId", depPlaceId);
			params.put("arrPlaceId", arrPlaceId);
			params.put("depPlandTime", depPlandTime);
			params.put("numOfRows", totalCount + "");

			String queryString = QueryStringBuilder.build(params);
			URI uri = new URI(target + "?" + queryString);

			// HttpClient 객체를 활용하는 방식
			HttpClient client = HttpClient.newHttpClient();
			HttpRequest request = HttpRequest.newBuilder(uri).GET().build();
			HttpResponse<String> response = client.send(request, BodyHandlers.ofString());

			Gson gson = new Gson();

			TrainResponseResult result = null;

			if (gson.fromJson(response.body(), TrainResponseResult.class) != null) {
				result = gson.fromJson(response.body(), TrainResponseResult.class);

				return result;
			} else {
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}
}
