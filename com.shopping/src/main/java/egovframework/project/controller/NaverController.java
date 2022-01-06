package egovframework.project.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
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
import egovframework.project.model.dto.NaverDto;
import egovframework.project.model.entity.User;
import egovframework.project.model.entity.naver.NaverUser;
import egovframework.project.service.NaverService;

@Controller
public class NaverController {
	
	@Autowired
	private NaverService naverService;
	
	@RequestMapping(value = "/naver_oauth.do")
	public String oauthNaver(HttpServletRequest request, @RequestParam(value = "code", required =false) String code) throws IOException {
		
		HttpSession session = request.getSession();
		
		NaverDto naverDto = NaverDto.getNaverDto(request.getParameter("code"), request);
		session.setAttribute("naver_token", naverDto.getAccess_token());
		
		NaverUser naverUser = getUserInfo(naverDto.getAccess_token());
		
		System.out.println(naverUser);
		
		String naverId = naverUser.getId();
		User userEntity = naverService.loginNaver(naverId);
		if (userEntity == null) {
			request.setAttribute("naverId", naverUser.getId());
			request.setAttribute("name", naverUser.getName());
			request.setAttribute("email", naverUser.getEmail());
			request.setAttribute("mobile", naverUser.getMobile());
			return "user/naverJoin.tiles";
		} else {
			session.setAttribute("id", naverUser.getId()+"");
			return "main/intersection_main.tiles";
		}
	}
	
	private NaverUser getUserInfo(String access_token) throws IOException {
		String reqURL = "https://openapi.naver.com/v1/nid/me";
		URL url = new URL(reqURL);
		String line = "";
		String result = "";
		
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestProperty("Authorization", "Bearer "+ access_token);

		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		while ((line = br.readLine()) != null) {
			result += line;
		}
		System.out.println(result);
		Gson gson = new Gson();
		JsonParser parser = new JsonParser();
        JsonElement element = parser.parse(result);
        
        JsonObject properties = element.getAsJsonObject().get("response").getAsJsonObject();

		NaverUser naverUser = gson.fromJson(properties, NaverUser.class);

		return naverUser;
	}
}
