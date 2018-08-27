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
			model.addAttribute("message", "��ѡ�������ջ���ַ");
			return "redirect:/pay/show?orderid="+ordertable.getOrderid();
		}
		
		//�޸Ķ���״̬,��addressid��ӵ����ݿ�ordertable����
		
		ordertable.setOrderstatus("1");
		orderService.updateByPrimaryKeySelective(ordertable);
		
		
		//����addressid ��ѯ��ַ�����浽model
		Address address = addressService.selectByPrimaryKey(ordertable.getOrderaddressid());
		model.addAttribute("address", address);
		//��totalprice���浽model��
		model.addAttribute("totalprice", ordertable.getTotalprice());
		model.addAttribute("orderid", ordertable.getOrderid());

		return "/success";
	}
}
