package com.neuedu.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.neuedu.po.Address;
import com.neuedu.po.Ordertable;
import com.neuedu.service.AddressService;
import com.neuedu.service.OrderService;

@Controller
@RequestMapping("/success")
public class SuccessController {
	@Autowired
	private OrderService orderService;
	@Autowired
	private AddressService addressService;
	
	@RequestMapping({"/","/list"})
	public String getlist(Ordertable ordertable,Model model,HttpServletRequest request) {
		
		if(ordertable.getOrderaddressid()==null) {
			model.addAttribute("message", "请选择您的收货地址");
			return "redirect:/pay/show?orderid="+ordertable.getOrderid();
		}
		
		//修改订单状态,将addressid添加到数据库ordertable表中
		
		ordertable.setOrderstatus("1");
		orderService.updateByPrimaryKeySelective(ordertable);
		
		
		//根据addressid 查询地址，保存到model
		Address address = addressService.selectByPrimaryKey(ordertable.getOrderaddressid());
		model.addAttribute("address", address);
		//将totalprice保存到model中
		model.addAttribute("totalprice", ordertable.getTotalprice());
		model.addAttribute("orderid", ordertable.getOrderid());

		return "/success";
	}
}
