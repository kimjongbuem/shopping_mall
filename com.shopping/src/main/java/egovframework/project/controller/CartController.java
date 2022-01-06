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

import egovframework.project.model.dto.CartDto;
import egovframework.project.model.dto.ProductTotalDto;
import egovframework.project.model.dto.UserAndProductDto;
import egovframework.project.model.entity.User;
import egovframework.project.service.CartService;
import egovframework.project.service.UserService;

@Controller
@RequestMapping("/cart")
public class CartController {
	
	private final int NOT_EXIST = 0;
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/checkLogin.do")
	void cart(HttpServletRequest req, HttpServletResponse res, Model model) throws IOException {
		
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		
		if(req.getSession().getAttribute("id") == null) {
			out.println("<script language='javascript'>");
			out.println("alert('로그인 후 이용가능합니다.')");
			out.println("location.href='/mypage.do'");
			out.println("</script>");
		}else {
			out.println("<script language='javascript'>");
			out.println("location.href='/cartPage.do'");
			out.println("</script>");
		}
		
		out.flush();
	}
	

	
	@RequestMapping("/add.do")
	@ResponseBody
	public void addCart(HttpServletRequest req, HttpServletResponse res) throws IOException {
		HttpSession session = req.getSession();
		
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		
		String id = (String)session.getAttribute("id");
		
		if(id == null) out.write("0");
		else {
			
			User user    = userService.getUser(req);			
			long productId = Long.parseLong((String)req.getParameter("productId"));
			
			UserAndProductDto userAndProductDto = 
					UserAndProductDto.builder()
					.userId(user.getId())
					.productId(productId)
					.build();
			
			int exist = cartService.existProductInCart(userAndProductDto);
			
			int qty = 1;
			if(req.getParameter("qty") != null) qty = Integer.parseInt(req.getParameter("qty"));
			
			CartDto cartDto = CartDto.builder().
								userId(user.getId()).
								productId(productId).
								qty(qty).
								build();
			
			if(exist == NOT_EXIST) cartService.insertCart(cartDto);
			else cartService.addProductQtyInCart(cartDto);
			

			out.write("1");
		}

		out.flush();
	}
	
	@RequestMapping("/modifyOptionQty.do")
	@ResponseBody
	public void modifyOptionQty(HttpServletRequest req, HttpServletResponse res) throws IOException {
		
		User user    = userService.getUser(req);			
		long productId = Long.parseLong((String)req.getParameter("productId"));
		int qty = Integer.parseInt((String)req.getParameter("qty"));
	
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		
		CartDto cartDto = CartDto.builder().
				userId(user.getId()).
				productId(productId).
				qty(qty).
				build();
		
		cartService.addProductQtyInCart(cartDto);
		
		ProductTotalDto productTotalDto = ProductTotalDto.builder()
											.userId(user.getId())
											.productId(productId)
											.qty(qty)
											.build();
		
		out.write(cartService.modifyOptionQty(productTotalDto)+"");
	}
	
	@RequestMapping("/deleteProduct.do")
	@ResponseBody
	public void deleteProduct(HttpServletRequest req, HttpServletResponse res) throws IOException {
		
		User user    = userService.getUser(req);			
		long productId = Long.parseLong((String)req.getParameter("productId"));
	
		res.setContentType("text/html; charset=UTF-8");
	
		CartDto cartDto = CartDto.builder()
							.userId(user.getId())
							.productId(productId)
							.build();
		
		cartService.deleteProduct(cartDto);
	}
	
	@RequestMapping("/deleteAllProduct.do")
	@ResponseBody
	public void deleteAllProduct(HttpServletRequest req, HttpServletResponse res) throws IOException {
		
		User user    = userService.getUser(req);			

		cartService.deleteAllProduct(user.getId());
	}
	
}
