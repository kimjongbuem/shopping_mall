package egovframework.project.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import egovframework.project.model.dto.KakaoDto;
import egovframework.project.model.entity.User;
import egovframework.project.model.entity.kakao.KakaoUser;
import egovframework.project.service.KakaoService;



@Controller
public class KakaoController{
	
	@Autowired
	KakaoService kakaoService;

	@RequestMapping(value = "/oauth_kakao.do")
	public String oauthKakao(HttpServletRequest request, @RequestParam(value = "code", required =false) String code) throws IOException {
		
		HttpSession session = request.getSession();
		
		KakaoDto kakaoDto = KakaoDto.getKakaoDto(request.getParameter("code"), request);
		session.setAttribute("kakao_token", kakaoDto.getAccess_token());
		
		KakaoUser kakaoUser = getUserInfo(kakaoDto.getAccess_token());
		
		long kakaoId = kakaoUser.getId();
		User userEntity = kakaoService.loginKakao(kakaoId);
		if (userEntity == null) {
			request.setAttribute("kakaoId", kakaoUser.getId());
			request.setAttribute("name", kakaoUser.getNickname());
			return "user/kakaoJoin.tiles";
		} else return "main/main.tiles";
	}
	
	public KakaoUser getUserInfo (String access_token) throws IOException {
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		String result = "";
		String line = "";
		URL url = new URL(reqURL);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("POST");
		conn.setRequestProperty("Authorization", "Bearer " + access_token);
		
		int responseCode = conn.getResponseCode();
		
		System.out.println(responseCode);
		
		//TODO: 수정
		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		while ((line = br.readLine()) != null) {
			result += line;
		}
		
		System.out.println(result);
		
		Gson gson = new Gson();
		JsonParser parser = new JsonParser();
        JsonElement element = parser.parse(result);
        
        int id = element.getAsJsonObject().get("id").getAsInt();
        JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
        KakaoUser kakaoUser = gson.fromJson(properties, KakaoUser.class);
        kakaoUser.setId(id);
        
        return kakaoUser;
	}

}
