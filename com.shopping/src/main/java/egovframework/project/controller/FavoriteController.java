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
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.project.model.dto.UserAndProductDto;
import egovframework.project.model.entity.User;
import egovframework.project.service.FavoriteService;
import egovframework.project.service.UserService;

@Controller
@RequestMapping("/fav")
public class FavoriteController {
	
	@Autowired
	private FavoriteService favoriteService;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/checkLogin.do")
	void checkLogin(HttpServletRequest req, HttpServletResponse res, Model model) throws IOException {
		
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		
		if(req.getSession().getAttribute("id") == null) {
			out.println("<script language='javascript'>");
			out.println("alert('로그인 후 이용가능합니다.')");
			out.println("location.href='/mypage.do'");
			out.println("</script>");
		}else {
			out.println("<script language='javascript'>");
			out.println("location.href='/favPage.do'");
			out.println("</script>");
		}
		
		out.flush();
	}

	@RequestMapping("/add.do")
	@ResponseBody
	public void addFav(HttpServletRequest req, HttpServletResponse res) throws IOException {
		
		HttpSession session = req.getSession();
		
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();

		if(session.getAttribute("id") == null) out.write("0");
		else {
			
			User user    = userService.getUser(req);			
			long productId = Long.parseLong((String)req.getParameter("productId"));
			
			UserAndProductDto userAndProductDto = 
					UserAndProductDto.builder()
					.userId(user.getId())
					.productId(productId)
					.build();
			
			favoriteService.addFav(userAndProductDto);
			
			out.write("1");
		}
		
		out.flush();

	}
	
	@RequestMapping("/remove.do")
	@ResponseBody
	public void removeFav(HttpServletRequest req, HttpServletResponse res) throws IOException {
		
		User user    = userService.getUser(req);			
		long productId = Long.parseLong((String)req.getParameter("productId"));
			
		UserAndProductDto userAndProductDto = 
				UserAndProductDto.builder()
				.userId(user.getId())
				.productId(productId)
				.build();
			
		favoriteService.removeFav(userAndProductDto);
	}
}
