package egovframework.project.model.dto;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;

import com.google.gson.Gson;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class KakaoDto {
	private String token_type;
	private String access_token;
	private Integer expires_in;
	private String refresh_token;
	private Integer refresh_token_expires_in;
	private String scope;
	
	
	public static KakaoDto getKakaoDto(String authorize_code, HttpServletRequest request) throws IOException{
		
		BufferedReader br;
		
		String client_id = "7db2d9e7eeee1cd77fb3bb5eed95e3a8";
		String redirect_uri = "http://localhost:8080/oauth_kakao.do";
		String code = authorize_code;

		StringBuilder sb = new StringBuilder();
		sb.append("grant_type=authorization_code");
		sb.append("&client_id="+client_id);
		sb.append("&redirect_uri="+redirect_uri);
		sb.append("&code="+code);
		
		final String AUTH_HOST = "https://kauth.kakao.com";
		final String tokenRequestURL = AUTH_HOST + "/oauth/token";
		
		URL url = new URL(tokenRequestURL);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("POST");
		conn.setDoOutput(true);
		
		BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
		writer.write(sb.toString());
		writer.flush();
		
		int respCode = conn.getResponseCode();
		
		if (respCode == 200) {
			br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		
		Gson gson = new Gson();
		KakaoDto kakaoDto = gson.fromJson(br.readLine(), KakaoDto.class);
		
		return kakaoDto;
	}
	
}
