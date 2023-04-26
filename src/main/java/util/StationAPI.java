package util;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.net.http.HttpResponse.BodyHandlers;
import java.util.LinkedHashMap;
import java.util.Map;

import com.google.gson.Gson;

import data.code.CodeResponseResult;
import data.station.StationResponseResult;

public class StationAPI {
	
	public static StationResponseResult getStationResponseResult(String cityCode) {
		try {
			String target = "http://apis.data.go.kr/1613000/TrainInfoService/getCtyAcctoTrainSttnList";

			Map<String, String> params = new LinkedHashMap<>();
			params.put("serviceKey",
					"SeTtVLG3NcocSbzkF4EhdHQJAj8xemMsODPSqFQEaeW2INI7Mbj7FqIvchikdNkajvkkxqRU8oc6y9XLOx0nCg%3D%3D");
			params.put("_type", "json");
			
			params.put("cityCode", cityCode);

			String queryString = QueryStringBuilder.build(params);
			URI uri = new URI(target + "?" + queryString);

			// HttpClient 객체를 활용하는 방식
			HttpClient client = HttpClient.newHttpClient();
			HttpRequest request = HttpRequest.newBuilder(uri).GET().build();
			HttpResponse<String> response = client.send(request, BodyHandlers.ofString());

			Gson gson = new Gson();
			System.out.println(response.body());
			StationResponseResult result = gson.fromJson(response.body(), StationResponseResult.class);
			return result;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		
		
		
		
		
		
		
	}

}
