package util;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.net.http.HttpResponse.BodyHandlers;
import java.util.LinkedHashMap;
import java.util.Map;

import com.google.gson.Gson;

import data.areaCode.AreaCodeResponseResult;

public class AreaCodeAPI {

	public static AreaCodeResponseResult getAreaCodeResponseResult() {

		try {
			String target = "http://apis.data.go.kr/B551011/KorService1/areaCode1";

			Map<String, String> params = new LinkedHashMap<>();
			params.put("serviceKey",
					"SeTtVLG3NcocSbzkF4EhdHQJAj8xemMsODPSqFQEaeW2INI7Mbj7FqIvchikdNkajvkkxqRU8oc6y9XLOx0nCg%3D%3D");
			params.put("_type", "json");
			params.put("MobileOS", "ETC");
			params.put("MobileApp", "AppTest");
			params.put("numOfRows", "17");

			String queryString = QueryStringBuilder.build(params);
			URI uri = new URI(target + "?" + queryString);

			HttpClient client = HttpClient.newHttpClient();
			HttpRequest request = HttpRequest.newBuilder(uri).GET().build();
			HttpResponse<String> response = client.send(request, BodyHandlers.ofString());

			Gson gson = new Gson();

			AreaCodeResponseResult result = gson.fromJson(response.body(), AreaCodeResponseResult.class);
			
			return result;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

}
