package com.neuedu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.neuedu.po.Address;
import com.neuedu.po.Ordertable;
import com.neuedu.service.AddressService;
import com.neuedu.service.OrderService;
import com.neuedu.vo.OrderdetailVO;

@Controller
@RequestMapping("/orderinfo")
public class OrderInfoController {
	
	@Autowired
	private OrderService orderService;
	@Autowired
	private AddressService addressService;
	
	@RequestMapping({"/","/list"})
	public String getlist(Model model,Integer orderid,Integer addressid) {
		List<OrderdetailVO> list = orderService.getDetails(orderid);
		model.addAttribute("list", list);
		Address address = addressService.selectByPrimaryKey(addressid);
		model.addAttribute("address", address);
		
		Ordertable orders = orderService.selectByPrimaryKey(orderid);
		model.addAttribute("orders", orders);
		return "/orderinfo";
	}
}
