package util;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.net.http.HttpResponse.BodyHandlers;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import com.google.gson.Gson;

import data.tour.summary.TourSummaryItem;
import data.tour.summary.TourSummaryResponseResult;

public class TourSummaryAPI {

	static TourSummaryResponseResult cachedResponseResult = null;
	static TourSummaryResponseResult ajaxCachedResponseResult = null;

	public static TourSummaryResponseResult getTourSummaryResponseResult(String code, String paramPage,
			String contentTypeId) {

		if (cachedResponseResult != null) {
			return cachedResponseResult;
		}

		try {
			String target = "http://apis.data.go.kr/B551011/KorService1/areaBasedList1";

			Map<String, String> params = new LinkedHashMap<>();
			params.put("serviceKey",
					"SeTtVLG3NcocSbzkF4EhdHQJAj8xemMsODPSqFQEaeW2INI7Mbj7FqIvchikdNkajvkkxqRU8oc6y9XLOx0nCg%3D%3D");
			params.put("_type", "json");
			params.put("contentTypeId", contentTypeId);
			params.put("pageNo", paramPage);
			params.put("numOfRows", "12");
			params.put("MobileOS", "ETC");
			params.put("MobileApp", "AppTest");
			params.put("areaCode", code);
			params.put("listYN", "Y");

			String queryString = QueryStringBuilder.build(params);
			URI uri = new URI(target + "?" + queryString);

			HttpClient client = HttpClient.newHttpClient();
			HttpRequest request = HttpRequest.newBuilder(uri).GET().build();
			HttpResponse<String> response = client.send(request, BodyHandlers.ofString());

			Gson gson = new Gson();

			TourSummaryResponseResult result = gson.fromJson(response.body(), TourSummaryResponseResult.class);
			cachedResponseResult = result;
			return result;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	public static TourSummaryResponseResult getTourSummaryResponseResult(String code) {
		
		if (ajaxCachedResponseResult != null) {
			return ajaxCachedResponseResult;
		}

		try {
			String target = "http://apis.data.go.kr/B551011/KorService1/areaBasedList1";

			Map<String, String> params = new LinkedHashMap<>();
			params.put("serviceKey",
					"SeTtVLG3NcocSbzkF4EhdHQJAj8xemMsODPSqFQEaeW2INI7Mbj7FqIvchikdNkajvkkxqRU8oc6y9XLOx0nCg%3D%3D");
			params.put("_type", "json");
			params.put("numOfRows", "2000");
			params.put("MobileOS", "ETC");
			params.put("MobileApp", "AppTest");
			params.put("areaCode", code);
			params.put("listYN", "Y");

			String queryString = QueryStringBuilder.build(params);
			URI uri = new URI(target + "?" + queryString);

			HttpClient client = HttpClient.newHttpClient();
			HttpRequest request = HttpRequest.newBuilder(uri).GET().build();
			HttpResponse<String> response = client.send(request, BodyHandlers.ofString());

			Gson gson = new Gson();

			TourSummaryResponseResult result = gson.fromJson(response.body(), TourSummaryResponseResult.class);

			ajaxCachedResponseResult = result;
			return result;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

}
