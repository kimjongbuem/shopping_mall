package egovframework.project.controller;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import egovframework.project.controller.api.CrudController;
import egovframework.project.model.entity.User;
import egovframework.project.service.UserService;
import egovframework.project.utils.Logout;
import egovframework.project.utils.SHA256;

@Controller
@RequestMapping(value = "/user")
public class UserController extends CrudController<User>{

	@Autowired
	private UserService userService;

	
	private final short KAKAO = 0;
	private final short NAVER = 1;
	private final short GENERAL = 2;
	
	// 회원가입 //
	@RequestMapping(value = "/create.do")
	public String createUser(HttpServletRequest req, HttpServletResponse res) {
		
		int loginNum = Integer.parseInt(req.getParameter("login"));
		
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
			 req.getSession().setAttribute("id", user.getKakaoId());
			 userService.createKakaoUser(user);
		}
		else if(loginNum == NAVER) {
			user = User.builder()
				.naverId((req.getParameter("naverId")))
				.name(req.getParameter("name"))
				.email(req.getParameter("email"))
				.phone(req.getParameter("phone"))
				.address(req.getParameter("address"))
				.password(SHA256.encrypt(req.getParameter("password")))
				.build();
			req.getSession().setAttribute("id", user.getNaverId());
			userService.createNaverUser(user);
		}
			
		else if(loginNum == GENERAL) {
				user = User.builder()
					.userid((req.getParameter("userid")))
					.name(req.getParameter("name"))
					.email(req.getParameter("email"))
					.phone(req.getParameter("phone"))
					.address(req.getParameter("address"))
					.password(SHA256.encrypt(req.getParameter("password")))
					.build();
			userService.create(user);
		}
		
		return "redirect:/home.do";
	}

	// 회원가입 수정 //	
	@RequestMapping(value = "/update.do")
	public void updateUser(HttpServletRequest req, HttpServletResponse res) throws IOException {
		
		String id = (String) req.getSession().getAttribute("id");
		
		User user = User.builder().
					userid(id).
					email(req.getParameter("email")).
					phone(req.getParameter("phone")).
					address(req.getParameter("address")).
					password(req.getParameter("password")).
					build();		
		
		res.setContentType("text/html; charset=UTF-8");
		
        userService.updateUser(user);

		PrintWriter out = res.getWriter();
		out.println("<script language='javascript'>");
		out.println("alert('회원정보가 수정되었습니다!');");
		out.println("location.href='/mypage.do'");
		out.println("</script>");

	}
	
	// 회원불러오기 : 로그인 //
	@RequestMapping(value = "/login.do")
	public void login(HttpServletRequest req, HttpServletResponse res) throws IOException {
		
		HttpSession session = req.getSession();
		
		User user = User.builder()
				.userid(req.getParameter("userid"))
				.password(SHA256.encrypt(req.getParameter("password"))).build();
		
		user = userService.login(user);
		session.setAttribute("id", user.getUserid());
		
		 res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		out.println("<script language='javascript'>");
		out.println("alert('로그인 성공!');");
		out.println("location.href='/home.do'");
		out.println("</script>");
	}
	
	@RequestMapping(value = "/loginCheck.do")
	public void loginCheck(HttpServletRequest req, HttpServletResponse res) throws IOException {
		
		User user = User.builder()
				.userid(req.getParameter("userid"))
				.password(SHA256.encrypt(req.getParameter("password"))).build();
		
		PrintWriter out = res.getWriter();
		out.write(userService.loginCheck(user)+"");
	}

	@RequestMapping(value = "/delete.do")
	public void deleteUser(HttpServletRequest req, HttpServletResponse res) throws IOException {
		
		User user = userService.getUser(req);
		
		userService.delete(user.getId());
		req.getSession().removeAttribute("id");
		
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();

		out.println("<script language='javascript'>");
		out.println("alert('회원탈퇴가 완료되었습니다!');");
		out.println("location.href='/mypage.do'");
		out.println("</script>");

		out.flush();
	}
	
	@RequestMapping(value = "/logout.do")
	public void logout(HttpServletRequest req, HttpServletResponse res) throws IOException {
		HttpSession session = req.getSession();
		int result = 500;
		// 카카오 로그아웃 시작
		if (session.getAttribute("kakao_token") != null) {
			String kakao_token = (String) session.getAttribute("kakao_token");
			result = Logout.kakaoLogout(kakao_token);
			System.out.println("kakaoId : " + result);
			System.out.println("카카오 로그아웃 응답코드 : " + result);
		}// 카카오 로그아웃 끝
		
		
		session.invalidate();
		
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		
		out.println("<script language='javascript'>");
		out.println("alert('로그아웃이 완료되었습니다!');");
		out.println("location.href='/home.do'");
		out.println("</script>");

		out.flush();
	}
	
	@RequestMapping(value = "/checkUserPassword.do")
	public void checkUserPassword(HttpServletRequest req, HttpServletResponse res) throws IOException{
		
		String password = SHA256.encrypt(req.getParameter("password"));
		String id = (String) req.getSession().getAttribute("id");
		
		User user = User.builder().userid(id).password(password).build();
		
		PrintWriter out = res.getWriter();
		out.write(userService.checkUserPassword(user)+"");
		
	}
	
	@RequestMapping(value = "/checkId.do")
	public void checkId(HttpServletRequest req, HttpServletResponse res) throws IOException{
		
		String userid = req.getParameter("userid");
		
		PrintWriter out = res.getWriter();
		out.write(userService.searchId(userid)+"");
		
	}

	@RequestMapping(value = "/checkPassword.do")
	public void checkPassword(HttpServletRequest req, HttpServletResponse res) throws IOException{
		
		String password = req.getParameter("password");
		
		PrintWriter out = res.getWriter();
		out.write(userService.checkPassword(password)+"");
		
	}
	
}
