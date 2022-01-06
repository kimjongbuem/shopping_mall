package egovframework.project.utils;

import java.net.HttpURLConnection;
import java.net.URL;

public class Logout {
	public static int kakaoLogout(String kakao_token) {
		String reqURL = "https://kapi.kakao.com/v1/user/logout";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "Bearer "+ kakao_token);
			return conn.getResponseCode();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 500;
	}
}
