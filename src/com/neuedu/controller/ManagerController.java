package com.neuedu.controller;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.neuedu.po.Manager;
import com.neuedu.service.ManagerService;

@Controller
@RequestMapping("/manager")
public class ManagerController {
	
	@Autowired
	private ManagerService managerService;
	
	@RequestMapping("/showlogin")
	public String showLogin() {
		return "ManagerLogin";
	}
	
	@RequestMapping("/login")
	public String managerLogin(String username,String password,Model model,HttpSession session) {
		Manager manager = new Manager();
		manager.setPassword(password);
		manager.setUsername(username);
		Manager manager2 = managerService.getManagerByUAP(manager);
		if(manager2!=null) {
			model.addAttribute("manager", manager2);
			session.setAttribute("manager", manager2);
			return "forward:/home/show";
		}
		return "ManagerLogin";
	}
	
	@RequestMapping("/manageShopping")
	public String manageShopping() {
		return "manageShopping";
	}
	
	@RequestMapping("/escLogin")
	public String escLogin(HttpSession session) {
		session.removeAttribute("manager");
		return "forward:/home/show";
	}
}
