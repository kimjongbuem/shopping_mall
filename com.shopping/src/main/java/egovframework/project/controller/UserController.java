package egovframework.project.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import egovframework.project.controller.api.CrudController;
import egovframework.project.model.entity.User;
import egovframework.project.service.UserService;
import egovframework.project.utils.SHA256;

@Controller
@RequestMapping(value = "/user")
public class UserController extends CrudController<User>{

	@Autowired
	private UserService userService;
	
	private final short KAKAO = 0;
	private final short NAVER = 0;
	private final short GENERAL = 0;
		
	// 회원가입 //
	@Override
	@RequestMapping(value = "/create.do")
	public String create(HttpServletRequest req) {
		
		int loginNum = Integer.parseInt(req.getParameter("login"));
		int signUp = 0;
		
		User user = null;
		
		if(loginNum == KAKAO) {
			
			 user = User.builder()
					.kakaoId(Long.parseLong(req.getParameter("kakaoId")))
					.name(req.getParameter("name"))
					.email(req.getParameter("email"))
					.phone(req.getParameter("phone"))
					.address(req.getParameter("address"))
					.password(SHA256.encrypt(req.getParameter("password")))
					.build();
		}
		
		signUp = userService.create(user);
		
		if(signUp == 0) return "cmmn/error.jsp"; 

		System.out.println("login success!");
		
		return "main/main.tiles";
	}

	// 회원가입 수정 //
	@Override
	@RequestMapping(value = "/update.do")
	public String update(HttpServletRequest req) {
		// TODO Auto-generated method stub
		return null;
	}

	// 회원불러오기 : 로그인 //
	@Override
	@RequestMapping(value = "/login.do")
	public String read(HttpServletRequest req) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@RequestMapping(value = "/delete.do")
	public String delete(HttpServletRequest req) {
		// TODO Auto-generated method stub
		return null;
	}
}
