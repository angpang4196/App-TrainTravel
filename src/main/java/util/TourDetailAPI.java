package util;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.net.http.HttpResponse.BodyHandlers;
import java.util.LinkedHashMap;
import java.util.Map;

import com.google.gson.Gson;

import data.tour.detail.TourDetailItem;
import data.tour.detail.TourDetailResponseResult;

public class TourDetailAPI {
	public static TourDetailItem getTourDetailItem(String contentid) {
		try {
			String target = "http://apis.data.go.kr/B551011/KorService1/detailCommon1";

			Map<String, String> params = new LinkedHashMap<>();
			params.put("serviceKey",
					"SeTtVLG3NcocSbzkF4EhdHQJAj8xemMsODPSqFQEaeW2INI7Mbj7FqIvchikdNkajvkkxqRU8oc6y9XLOx0nCg%3D%3D");
			params.put("_type", "json");
			params.put("MobileApp", "AppTest");
			params.put("MobileOS", "ETC");
			params.put("contentId", contentid);
			params.put("defaultYN", "Y");
			params.put("addrinfoYN", "Y");
			params.put("mapinfoYN", "Y");
			params.put("overviewYN", "Y");
			params.put("firstImageYN", "Y");

			String queryString = QueryStringBuilder.build(params);
			URI uri = new URI(target + "?" + queryString);

			HttpClient client = HttpClient.newHttpClient();
			HttpRequest request = HttpRequest.newBuilder(uri).GET().build();
			HttpResponse<String> response = client.send(request, BodyHandlers.ofString());

			Gson gson = new Gson();

			TourDetailResponseResult result = gson.fromJson(response.body(), TourDetailResponseResult.class);
			TourDetailItem[] tdi =result.getResponse().getBody().getItems().getItem();
			System.out.println(tdi[0].getAddr1());
			System.out.println(tdi[0].getMapx());
			System.out.println(tdi[0].getMapy());
			
			return tdi[0];

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

}
