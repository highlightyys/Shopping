package com.neuedu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.neuedu.po.Product;
import com.neuedu.po.Producttype;
import com.neuedu.service.ProTypeService;
import com.neuedu.service.ProductService;

@Controller
@RequestMapping("/home")
public class HomeController {
	
	
	
	@Autowired
	private ProTypeService proTypeService;
	
	@Autowired
	private ProductService productService;
	
	
	@RequestMapping("/show")
	public String show(Model model) {
		List<Producttype> types = proTypeService.getAllType();
		List<Product> sales = productService.getSale();
		model.addAttribute("sales", sales);//获得热销商品
		model.addAttribute("types", types);
		return "home";
	}
	
	@RequestMapping("/showLogin")
	public String showLogin() {
		return "login";
	}
	
	@RequestMapping("/showRegister")
	public String showRegister() {
		return "register";
	}
	
}
