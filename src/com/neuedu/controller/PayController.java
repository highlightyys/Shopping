package com.neuedu.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.neuedu.po.Address;
import com.neuedu.po.User;
import com.neuedu.service.AddressService;
import com.neuedu.service.OrderService;
import com.neuedu.vo.OrderdetailVO;

@Controller
@RequestMapping("/pay")
public class PayController {

	@Autowired
	private AddressService addressService;
	@Autowired
	private OrderService orderService;
	
	@RequestMapping({"/","/show"})
	public String getList(@RequestParam(value="orderid",required=true)Integer orderid,Model model,HttpServletRequest request,@RequestParam(value="message",required=false)String message) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		
		Integer userid = user.getUserid();
		//µØÖ·
		List<Address> list = addressService.getListByUserid(userid);
		model.addAttribute("list", list);
		//orderid
	
		model.addAttribute("orderid", orderid);
		
		List<OrderdetailVO> details = orderService.getDetails(orderid);
		model.addAttribute("details", details);
		double totalprice = 0;
		for(OrderdetailVO orderdetail: details) {
			Double total = orderdetail.getTotal();
			totalprice += total;
		}
		totalprice = (double)(Math.round(totalprice*100)/100.0);
		
		model.addAttribute("totalprice",totalprice);
		model.addAttribute("message", message);
		return "/pay";

	}
	//É¾³ýµØÖ·
	@RequestMapping("/delete")
	public String delete(Integer addressid,Integer orderid,Model model) {
		addressService.deleteByPrimaryKey(addressid);
		model.addAttribute("orderid", orderid);
		return "redirect:/pay/";
	}
	
	
	
}
