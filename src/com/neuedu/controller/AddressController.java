package com.neuedu.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.authenticator.SavedRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.databind.deser.std.NumberDeserializers.IntegerDeserializer;
import com.neuedu.po.Address;
import com.neuedu.po.User;
import com.neuedu.service.AddressService;

@Controller
@RequestMapping("/address")
public class AddressController {
	
	@Autowired
	private AddressService addressService;

	@RequestMapping({"/","/list"})
	public String getList(Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		
		Integer userid = user.getUserid();
		List<Address> list = addressService.getListByUserid(userid);
		model.addAttribute("list", list);
		return "/address";
	}
	
	@RequestMapping("/delete")
	public String delete(Integer addressid) {
		
		addressService.deleteByPrimaryKey(addressid);
		return "redirect:/address/";
	}
	@RequestMapping("/save")
	public String save(Address address,HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		Integer userid = user.getUserid();
		address.setUserid(userid);
		addressService.insertSelective(address);
		return "redirect:/address/";
	}
	
	@RequestMapping("/showupdate")
	public String showupdate(Address address,Integer orderid,Model model) {
		model.addAttribute("address", address);
		model.addAttribute("orderid", orderid);
		return "updateaddress";
	}
	
	@RequestMapping("/update")
	public String updateaddress(Address address ,Model model,Integer orderid) {
		System.out.println(orderid);
		addressService.updateAddressById(address);
		model.addAttribute("orderid", orderid);
		return "redirect:/pay/show";
	}
}
