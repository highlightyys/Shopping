package com.neuedu.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.neuedu.po.Collection0;
import com.neuedu.po.Product;
import com.neuedu.po.User;
import com.neuedu.service.CollectionService;

@Controller
@RequestMapping("/collection")
public class CollectionController {
	@Autowired
	private CollectionService collectionService;
	
	@RequestMapping({"/","/show"})
	public String showCollection(HttpServletRequest request,Model model) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		
		List<Product> list = collectionService.getProductByUserId(user.getUserid());
		System.out.println(list);
		model.addAttribute("list", list);
		
		return "/collection";
	}
	
	@RequestMapping("/addcollection")
	public String addCollection(HttpServletRequest request,Collection0 collection,Model model) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		collection.setUserid(user.getUserid());
		//�ж��ղؼ����Ƿ����и���Ʒ
		if(collectionService.queryCollection(collection)) {
			model.addAttribute("message", "�Ѽ����ղؼУ������ظ����룡");
			model.addAttribute("proid", collection.getProid());
			return "redirect:/product/detail";
		}
		collectionService.addCollection(collection);
		model.addAttribute("message", "�ղسɹ���");
		model.addAttribute("proid", collection.getProid());
		return "redirect:/product/detail";
	}
	
	@RequestMapping("/subcollection")
	public String subCollection(HttpServletRequest request ,Integer proid) {
		Collection0 collection = new Collection0();
		HttpSession session = request.getSession();
		User user= (User)session.getAttribute("user");
		collection.setUserid(user.getUserid());
		collection.setProid(proid);
		System.out.println(collection);
		//����service��
		collectionService.subCollection(collection);
		
		return "forward:/collection/show";
	}
	
}






