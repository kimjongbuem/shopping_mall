package egovframework.project.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.project.controller.api.CrudController;
import egovframework.project.model.entity.User;

@Controller
@RequestMapping(value = "/user")
public class UserController extends CrudController<User>{


	// 회원가입 //
	@Override
	@RequestMapping(value = "/create.do")
	public String create(HttpServletRequest req) {
		// TODO Auto-generated method stub
		return null;
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
