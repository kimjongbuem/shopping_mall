package egovframework.project.model.dto;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
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
public class NaverDto {
	
	private String access_token;
	private String refresh_token;
	private String token_type;
	private Integer expires_in;
	private String error;
	private String error_description;
	
	public static NaverDto getNaverDto(String code, HttpServletRequest request) throws IOException {

		String urlSource = "https://nid.naver.com/oauth2.0/token?";
		String grant_type = "authorization_code"; // 발급:authorization_code / 갱신:refresh_token / 삭제:delete
		String client_id = "d4BcRxztvP9WnHjtDwh5";
		String client_secret = "h2T2rvcxaN";
		String state = request.getParameter("state");
		StringBuffer sb = new StringBuffer();
		sb.append(urlSource);
		sb.append("grant_type="+grant_type);
		sb.append("&client_id="+client_id);
		sb.append("&client_secret="+client_secret);
		sb.append("&code="+code);
		sb.append("&state="+state);
		String reqURL = sb.toString();
		String result = "";
		String input = "";
		
		URL url = new URL(reqURL);
		
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		
		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		
		Gson gson = new Gson();
		
		while ((input = br.readLine()) != null) {
			result += input;
		}
		NaverDto naverDto = gson.fromJson(result, NaverDto.class);
		
		return naverDto;
	}
}
