package util;

import java.lang.invoke.StringConcatFactory;
import java.util.HashMap;
import java.util.Map;

public class QueryStringBuilder {
	public static String build(Map<String, String> params) {
		// 요청인자를 보내기 위한 쿼리스트링을 만들떄

		

		String str = params.toString();
		str = str.replaceAll(", ", "&");
		
		str.substring(1,str.length()-1);

		return str.substring(1,str.length()-1);
	}

}
