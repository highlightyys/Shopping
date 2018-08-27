package com.neuedu.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.neuedu.po.Ordertable;
import com.neuedu.po.User;
import com.neuedu.service.OrderService;
import com.neuedu.vo.OrderVo;
import com.neuedu.vo.OrderdetailVO;

@Controller
@RequestMapping("/order")
public class OrderController {
	@Autowired
	private OrderService orderService;
	@RequestMapping({"/","/list"})
	public String getlist(Model model,HttpServletRequest request) {
		//查询所有订单信息
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		List<OrderVo> orders = orderService.selectOrderInfo(user.getUserid());
		
		System.out.println(orders);
		
		List<OrderVo> unpay = new ArrayList<>();
		List<OrderVo> unsend = new ArrayList<>();
		List<OrderVo> unreceice = new ArrayList<>();
		List<OrderVo> receiced = new ArrayList<>();
		for(int i=0;i<orders.size();i++) {
			if("0".equals(orders.get(i).getOrderstatus())) {
				unpay.add(orders.get(i));
			}
			if("1".equals(orders.get(i).getOrderstatus())) {
				unsend.add(orders.get(i));
			}
			if("2".equals(orders.get(i).getOrderstatus())) {
				unreceice.add(orders.get(i));
			}
			if("3".equals(orders.get(i).getOrderstatus())) {
				receiced.add(orders.get(i));
			}
		}
		model.addAttribute("unpay", unpay);
		model.addAttribute("unsend", unsend);
		model.addAttribute("unreceice", unreceice);
		model.addAttribute("receiced", receiced);
		
		return "/order";
	}
	
	@RequestMapping("/cancel")
	public String cancelOrder(Integer orderid) {
		//根据orderid删除订单信息，订单表，订单详情表
		orderService.deleteByOrderid(orderid);
		orderService.deleteByPrimaryKey(orderid);
		
		return "redirect:/order/";
	}
	@RequestMapping("/updatestatus")
	public String updatestatus(Integer orderid) {
		//根据orderid获取当前状态
		String orderstatus = orderService.selectStatusByOrderid(orderid);
		//修改当前状态
		if(orderstatus.equals("1")) {
			orderstatus = "2";
		}else if (orderstatus.equals("2")) {
			orderstatus = "3";
		}
	
		 Ordertable ordertable = new Ordertable();
		 ordertable.setOrderid(orderid);
		 ordertable.setOrderstatus(orderstatus);
		 orderService.updateByPrimaryKeySelective(ordertable);
		
		return "redirect:/order/";
	}
}
