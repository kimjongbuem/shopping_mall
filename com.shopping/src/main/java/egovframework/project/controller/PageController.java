package egovframework.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {
	
	@RequestMapping(value = "/home.do")
	String goHome() {
		return "main/main.tiles";
	}
	
	@RequestMapping(value = "/login.do")
	String login() {
		return "login/login.tiles";
	}
}
