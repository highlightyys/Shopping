package com.neuedu.controller;

import java.io.Reader;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.neuedu.commons.Commons;
import com.neuedu.po.Product;
import com.neuedu.po.Producttype;
import com.neuedu.service.ProTypeService;

@Controller
@RequestMapping("/type")
public class TypeController {
	@Autowired
	private ProTypeService proTypeService;
	
	@RequestMapping("/list")
	public String getAllType(Model model,@RequestParam(value="nowPage",required=false,defaultValue="1")Integer nowPage) {
		if(nowPage<1) {
			nowPage = 1;
		}
		List<Producttype> types = proTypeService.getTypes(nowPage);
		model.addAttribute("types", types);
		model.addAttribute("nowPage", nowPage);
		return "manageType";
	}
	
	@RequestMapping("/addType")
	public String addType(String typename,Integer selection,Model model) {
		Producttype type = new Producttype();
		type.setTypename(typename);
		type.setSelection(selection);
		proTypeService.addType(type);
		model.addAttribute("message", "添加成功！");
		return "forward:/type/list";
	}
	
	@RequestMapping("/detele")
	public String deleteType(Integer typeid,Model model) {
		proTypeService.deteleType(typeid);
		model.addAttribute("message", "删除成功！");
		return "forward:/type/list";
	}
	
	@RequestMapping("/modify")
	public String modify(Producttype type,Model model) {
		proTypeService.updateType(type);
		model.addAttribute("message", "编辑成功!");
		return "forward:/type/list";
	}
}
