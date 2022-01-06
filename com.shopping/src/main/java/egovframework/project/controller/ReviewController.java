package egovframework.project.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import egovframework.project.model.dto.ReviewDto;
import egovframework.project.service.ReviewService;


@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;

	@RequestMapping("/remove.do")
	public String removeReview(HttpServletRequest req, HttpServletResponse res, RedirectAttributes redirectAttributes){

		long reviewId = Long.parseLong((String)req.getParameter("reviewId"));
		long productId = Long.parseLong((String)req.getParameter("productId"));
		
		ReviewDto reviewDto = ReviewDto.builder().
							  id(reviewId).
							  build();
		
		reviewService.removeReview(reviewDto);
		
		redirectAttributes.addAttribute("productId", productId);
		
		res.setContentType("text/html; charset=UTF-8");
		
		return "redirect:/productdetail.do";
	}
	
	@RequestMapping("/update.do")
	public String ModifyReview(HttpServletRequest req, RedirectAttributes redirectAttributes){

		long reviewId = Long.parseLong((String)req.getParameter("reviewId"));
		long productId = Long.parseLong((String)req.getParameter("productId"));
		String detail = (String)req.getParameter("detail"); 
		
		ReviewDto reviewDto = ReviewDto.builder().
							  id(reviewId).
							  detail(detail).
							  build();
		
		reviewService.modifyReview(reviewDto);
		
		redirectAttributes.addAttribute("productId", productId);
		
		return "redirect:/productdetail.do";
	}
	
	@RequestMapping("/write.do")
	public String writeReview(HttpServletRequest req, RedirectAttributes redirectAttributes){

		long productId = Long.parseLong((String)req.getParameter("productId"));
		long userId = Long.parseLong((String)req.getParameter("userId"));
		String name = (String)req.getParameter("name");
		String detail = (String)req.getParameter("detail");
		
		
		ReviewDto reviewDto = ReviewDto.builder().
							  userId(userId).
							  detail(detail).
							  name(name).
							  productId(productId).	
							  build();
		
		reviewService.writeReview(reviewDto);
		
		redirectAttributes.addAttribute("productId", productId);
		
		return "redirect:/productdetail.do";
	}
}
