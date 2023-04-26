package util;

import java.net.URI;
import java.net.URLEncoder;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.net.http.HttpResponse.BodyHandlers;
import java.util.LinkedHashMap;
import java.util.Map;

import com.google.gson.Gson;

import data.train.TrainResponseResult;

public class TrainAPI {

	public static TrainResponseResult getTrainResponseResult(String citycode) {
		try { 
			String target = "http://apis.data.go.kr/1613000/TrainInfoService/getStrtpntAlocFndTrainInfo";

			Map<String, String> params = new LinkedHashMap<>();
			params.put("serviceKey",
					"SeTtVLG3NcocSbzkF4EhdHQJAj8xemMsODPSqFQEaeW2INI7Mbj7FqIvchikdNkajvkkxqRU8oc6y9XLOx0nCg%3D%3D");
			params.put("cityCode", citycode);
			
			String queryString = QueryStringBuilder.build(params);
			URI uri = new URI(target + "?" + queryString);

			// HttpClient 객체를 활용하는 방식
			HttpClient client = HttpClient.newHttpClient();
			HttpRequest request = HttpRequest.newBuilder(uri).GET().build();
			HttpResponse<String> response = client.send(request, BodyHandlers.ofString());

			Gson gson = new Gson();
			System.out.println(response.body());
			TrainResponseResult result = gson.fromJson(response.body(), TrainResponseResult.class);
			return result;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

}
