package egovframework.project.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.project.model.dto.CheckBoxCompanyDto;
import egovframework.project.model.dto.FavoriteDto;
import egovframework.project.model.dto.ProductDto;
import egovframework.project.model.dto.QnaDto;
import egovframework.project.model.dto.ReviewDto;
import egovframework.project.model.dto.UserAndProductDto;
import egovframework.project.model.entity.User;
import egovframework.project.service.CartService;
import egovframework.project.service.FavoriteService;
import egovframework.project.service.ProductService;
import egovframework.project.service.QnaService;
import egovframework.project.service.ReviewService;
import egovframework.project.service.UserService;

@Controller
public class PageController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private FavoriteService favoriteService;
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private QnaService qnaService;
	
	

	@RequestMapping(value = "/home.do")
	String goHome(Model model) {
		
		List<ProductDto> productList8 = productService.selectAllProduct(8);
		model.addAttribute("productList8", productList8);
		
		return "main/main.tiles";
	}

	// 유저 //
	
	@RequestMapping(value = "/mypage.do")
	String goMyPage(HttpServletRequest req) {
		if(req.getSession().getAttribute("id") != null) return "user/mypage.tiles";
		else return "user/login.tiles";
	}
	
	@RequestMapping(value = "/sign.do")
	String sign(HttpServletRequest req) {
		return "user/sign.tiles";
	}
	

	@RequestMapping(value = "/checkUserPassword.do")
	String checkUserPassword(HttpServletRequest req) {
		return "user/checkUserPassword.tiles";
	}
	
	@RequestMapping(value = "/checkDeletingUser.do")
	String checkDeletingUser(HttpServletRequest req) {
		return "user/checkDeletingUser.tiles";
	}
	
	@RequestMapping(value = "/updateUserPage.do")
	String goUpdateUserPage(HttpServletRequest req, Model model) {
		
		User user = userService.getUser(req);
		
		model.addAttribute("user", user);
		
		return "user/updateUser.tiles";
	}
	
	// 카트 //
	
	@RequestMapping("/cartPage.do")
	public String cartPage(HttpServletRequest req, Model model) {
		
		User user = userService.getUser(req);
		
		List<ProductDto> userCartStoreList = 
				cartService.selectAllCart(user.getId());
		
		if(userCartStoreList.size() == 0) return "cart/emptycart.tiles";

		int payment_total = 0;
		
		for(int i = 0; i < userCartStoreList.size(); i++) {
			payment_total += userCartStoreList.get(i).getTotal();
		}
		
		model.addAttribute("payment_total", payment_total);
		model.addAttribute("userCartStoreList", userCartStoreList);
		return "cart/cart.tiles";

	}
	
	// 찜 //
	
	@RequestMapping("/favPage.do")
	public String favPage(HttpServletRequest req, Model model) {
		
		User user = userService.getUser(req);
		
		List<FavoriteDto> userFavStoreList = 
				favoriteService.selectAllFav(user.getId());
		
		if(userFavStoreList.size() == 0) return "fav/emptyfav.tiles";

		model.addAttribute("userFavStoreList", userFavStoreList);
		return "fav/fav.tiles";

	}
	
	
	// 제품 //
	
	@RequestMapping(value = "/productdetail.do")
	String productdetail(HttpServletRequest req, @RequestParam("productId") long productId, Model model) {
		
		ProductDto product = productService.getProductDetail(productId);
		model.addAttribute("product", product);
		
		User user = userService.getUser(req);
		
		ReviewDto reviewDto= null;
		QnaDto qnaDto = null;
		FavoriteDto favoriteDto = null;
		
		if(user == null) {
			reviewDto = 
					ReviewDto.builder().
					userId(-1).
					productId(productId).
					build()
					;
			qnaDto = 
					QnaDto.builder().
					userId(-1).
					productId(productId).
					build()
					;
			favoriteDto = 
					FavoriteDto.builder().
					userId(-1).
					productId(productId).
					build();
			
		}else {
			reviewDto = 
					ReviewDto.builder().
					userId(user.getId()).
					productId(productId).
					build()
					;
			qnaDto = 
					QnaDto.builder().
					userId(user.getId()).
					productId(productId).
					build()
					;
			favoriteDto = 
					FavoriteDto.builder().
					userId(user.getId()).
					productId(productId).
					build();
		}
		model.addAttribute("user", user);
		
		FavoriteDto favorite = favoriteService.getProductOfFavorite(favoriteDto);
		model.addAttribute("favorite", favorite);
		
		List<ReviewDto> reviews = reviewService.getProductDetailReviews(reviewDto);
		model.addAttribute("reviews", reviews);
		
		List<QnaDto> qnas = qnaService.getProductDetailQnas(qnaDto);
		System.out.println(qnas);
		model.addAttribute("qnas", qnas);
		
		return "product/productdetail.tiles";
	}
	
	@RequestMapping("/allProduct.do")
	public String allProductPage(HttpServletRequest req, Model model) {
		
		List<ProductDto>productList = 
				productService.selectAllProduct(1000);

		model.addAttribute("productList", productList);
		
		return "product/allProduct.tiles";
	}
	
	@RequestMapping(value = "/search.do")
	String search(HttpServletRequest req, Model model) {
		
		String searchSelectValue = req.getParameter("searchSelectValue");
		String searchValue = req.getParameter("searchValue");
		List<ProductDto> productList;
		
		if(searchSelectValue.equals("product")) {
			productList = productService.selectByProductName(searchValue);
		}else {
			productList = productService.selectByCompanyName(searchValue);
		}

		model.addAttribute("productList", productList);
		
		return "product/search.tiles";
	}
	

	@RequestMapping("/checkboxSearch.do")
	public String checkboxSearch(Model model, HttpServletRequest req, HttpServletResponse res, @RequestParam(required=false) String[] companyId) throws IOException {

		if(companyId == null) return "redirect:/allProduct.do";
		
		long[] company = new long[companyId.length];
		
		for(int i = 0; i < company.length; i++) company[i] = Long.parseLong(companyId[i]);
	
		CheckBoxCompanyDto checkBoxCompanyDto = CheckBoxCompanyDto.builder().
												companyId(company).
												build();
		
		List<ProductDto> productList = productService.searchCheckedBox(checkBoxCompanyDto);
		
		model.addAttribute("productList", productList);
		
		return "product/search.tiles";
		
	}
	
	// 리뷰
	
	@RequestMapping(value = "/reviewWritePage.do")
	String reviewWritePage(HttpServletRequest req, Model model) {
		
		long productId = Long.parseLong((String)req.getParameter("productId"));

		User user = userService.getUser(req);
		
		model.addAttribute("userId", user.getId());
		model.addAttribute("userName", user.getName());
		model.addAttribute("productId", productId);
		
		return "review/reviewWrite.tiles";
	}
	
	@RequestMapping(value = "/reviewUpdatePage.do")
	String reviewUpdatePage(HttpServletRequest req, Model model) {
		
		long reviewId = Long.parseLong((String)req.getParameter("reviewId"));
		String userName = (String)req.getParameter("userName");
		
		ReviewDto reviewDto = reviewService.getReview(reviewId);
		
		model.addAttribute("userName", userName);
		model.addAttribute("review", reviewDto);
		
		return "review/reviewUpdate.tiles";
	}
	
	//qna
	@RequestMapping(value = "/qnaWritePage.do")
	String qnaWritePage(HttpServletRequest req, Model model) {
		
		long productId = Long.parseLong((String)req.getParameter("productId"));

		User user = userService.getUser(req);
		
		model.addAttribute("userId", user.getId());
		model.addAttribute("userName", user.getName());
		model.addAttribute("productId", productId);
		
		return "qna/qnaWrite.tiles";
	}
	
	@RequestMapping(value = "/qnaDetailPage.do")
	String qnaDetailPage(HttpServletRequest req, Model model) {
		
		long qnaId  = Long.parseLong((String)req.getParameter("qnaId"));
		String userName = (String)req.getParameter("userName");
		
		QnaDto qnaDto = qnaService.getQna(qnaId);
		
		model.addAttribute("userName", userName);
		model.addAttribute("qna", qnaDto);
		
		System.out.println(qnaDto);
		
		User user = userService.getUser(req);
		
		if(user != null) model.addAttribute("userId", user.getId());
		else model.addAttribute("userId", -1);
	
		return "qna/qnaDetail.tiles";
	}
	
	@RequestMapping(value = "/qnaPasswordPage.do")
	String qnaPasswordPage(HttpServletRequest req, Model model) {
		
		long qnaId = Long.parseLong((String)req.getParameter("qnaId"));
		String userName = (String)req.getParameter("userName");
		
		QnaDto qnaDto = qnaService.getQna(qnaId);
		
		model.addAttribute("userName", userName);
		model.addAttribute("qna", qnaDto);
		
		return "qna/qnaPassword.tiles";
	}
	
	@RequestMapping(value = "/qnaUpdatePage.do")
	String qnaUpdatePage(HttpServletRequest req, Model model) {
		
		long qnaId = Long.parseLong((String)req.getParameter("qnaId"));
		String userName = (String)req.getParameter("userName");
		
		QnaDto qnaDto = qnaService.getQna(qnaId);
		
		model.addAttribute("userName", userName);
		model.addAttribute("qna", qnaDto);
		
		return "qna/qnaUpdate.tiles";
	}
	
	
	// 결제
	
	@RequestMapping(value = "/checkoutPage.do")
	String checkoutPage(HttpServletRequest req, Model model) {
		
		User user = userService.getUser(req);
		model.addAttribute("user", user);
		
		long payment_total = 0;
		
		if((String)req.getParameter("productId") != null) {
			ProductDto product = productService.getProductDetail(Long.parseLong((String)req.getParameter("productId")));
			
			int qty =  Integer.parseInt((String)req.getParameter("qty"));
			
			payment_total = qty *(product.getPrice() - (product.getPrice() * product.getSale() / 100));
			
			model.addAttribute("product", product);
			model.addAttribute("payment_total", payment_total);
			
			return "checkout/onecheckout.tiles";
			
		}else {
			List<ProductDto> product = 
					cartService.selectAllCart(user.getId());
			
			for(int i = 0; i < product.size(); i++) {
				payment_total += product.get(i).getTotal();
			}

			model.addAttribute("product", product);
			model.addAttribute("payment_total", payment_total);
			
			return "checkout/allcheckout.tiles";
		}
	}
	
}
