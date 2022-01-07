package egovframework.project.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import egovframework.project.model.dto.QnaDto;
import egovframework.project.model.dto.ReviewDto;
import egovframework.project.service.QnaService;
import egovframework.project.utils.SHA256;

@Controller
@RequestMapping("/qna")
public class QnaController {
	
	@Autowired
	private QnaService qnaService;
	
	@RequestMapping("/checkPassword.do")
	@ResponseBody
	public void checkQnaPassword(HttpServletRequest req, HttpServletResponse res) throws IOException {
		
		String password = (String)req.getParameter("password");
		long qnaId  = Long.parseLong((String) (req.getParameter("qnaId")));
		
		QnaDto qnaDto = QnaDto.builder().
						password(password).
						id(qnaId).
						build();
		
		PrintWriter out = res.getWriter();
		out.write(qnaService.checkPassword(qnaDto)+"");
	}
	
	@RequestMapping("/remove.do")
	public String removeQna(HttpServletRequest req, RedirectAttributes redirectAttributes){

		long qnaId = Long.parseLong((String)req.getParameter("qnaId"));
		long productId = Long.parseLong((String)req.getParameter("productId"));
		
		qnaService.removeQna(qnaId);
		
		redirectAttributes.addAttribute("productId", productId);
		
		return "redirect:/productdetail.do";

	}
	
	@RequestMapping("/update.do")
	public String updateQna(HttpServletRequest req, RedirectAttributes redirectAttributes){

		long qnaId = Long.parseLong((String)req.getParameter("qnaId"));
		long productId = Long.parseLong((String)req.getParameter("productId"));
		String detail= (String)req.getParameter("detail");
		
		QnaDto qnaDto = QnaDto.builder().id(qnaId).detail(detail).build();
		
		qnaService.updateQna(qnaDto);
		
		redirectAttributes.addAttribute("productId", productId);
		
		return "redirect:/productdetail.do";

	}
	
	@RequestMapping("/write.do")
	public String writeQna(HttpServletRequest req, RedirectAttributes redirectAttributes){

		long userId = Long.parseLong((String)req.getParameter("userId"));
		long productId = Long.parseLong((String)req.getParameter("productId"));
		long optionNo = Long.parseLong((String)req.getParameter("kinds"));
		String detail = (String)req.getParameter("detail"); 
		String password = (String)req.getParameter("password");
		
		QnaDto qnaDto = QnaDto.builder().
							  userId(userId).
							  detail(detail.replaceAll("&lt(;)?(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?&gt(;)?", "")).
							  password(password).
							  productId(productId).
							  optionNo(optionNo).
							  build();
		
		qnaService.writeQna(qnaDto);
		
		redirectAttributes.addAttribute("productId", productId);
		
		return "redirect:/productdetail.do";
	}
}
