package egovframework.project.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.project.service.ProductService;

@Controller
@RequestMapping("/product")
public class ProductController{
	
	@Autowired
	private ProductService productService;

}
