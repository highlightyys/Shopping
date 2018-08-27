package com.neuedu.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.neuedu.commons.Commons;
import com.neuedu.po.Product;
import com.neuedu.po.Producttype;
import com.neuedu.service.ProTypeService;
import com.neuedu.service.ProductService;
import com.neuedu.utils.UploadUtils;

@Controller
@RequestMapping("/product")
public class ProductController {

	@Autowired
	private ProductService productService;
	
	@Autowired
	private ProTypeService typeService;
	
	@RequestMapping("/list")
	public String proList(Integer typeid,Model model,@RequestParam(value="nowPage",required=false,defaultValue="1")Integer nowPage) {
		List<Product> products = productService.getProductsByType(typeid,nowPage,Commons.page);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("products", products);
		return "search";
	}
	
	@RequestMapping("/detail")
	public String proDetail(Integer proid,Model model,String message) {
		Product product = productService.getProductById(proid);
		model.addAttribute("product", product);
		model.addAttribute("message", message);
		return "introduction";
	}
	
	@RequestMapping("/products")
	public String products(Model model,@RequestParam(value="nowPage",required=false,defaultValue="1")Integer nowPage) {
		List<Product> products = productService.getAllProducts(nowPage,8);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("products", products);
		return "manageProduct";
	}
	
	@RequestMapping("/showadd")
	public String showAdd(Model model) {
		List<Producttype> types = typeService.findAllTypes();
		model.addAttribute("types", types);
		return "addProduct";
	}
	
	@RequestMapping("/add")
	public String saveProduct(Model model,Product product,@RequestParam(value="fileurl") MultipartFile multipartFile,HttpServletRequest request) throws IllegalStateException, IOException {
		String oldname = multipartFile.getOriginalFilename();
		//去掉路径的真实文件名
		String realName = UploadUtils.getRealName(oldname);
		//获得一个随机的UUID的名字
		String uuidName = UploadUtils.getUUIDName(realName);
		String basePath = request.getRealPath("/static/img");
		String dir = UploadUtils.getDir();
		File filedir = new File(basePath+dir);
		if(!filedir.exists()) {
			filedir.mkdirs();
		}
		File file = new File(filedir,uuidName);
		multipartFile.transferTo(file);
		String picurl = dir+"/"+uuidName;
		product.setPicurl(picurl);
		productService.saveProduct(product);
		model.addAttribute("message", "添加成功！");
		return "forward:/product/products";
	}

	@RequestMapping("/detele")
	public String detele(Integer proid,Model model) {
		productService.deteleById(proid);
		model.addAttribute("message", "删除成功！");
		return "forward:/product/products";
	}
	
	@RequestMapping("/showUpdate")
	public String showUpdate(Product product,Model model) {
		List<Producttype> types = typeService.findAllTypes();
		model.addAttribute("types", types);
		model.addAttribute("product", product);
		return "updateProduct";
	}
	
	@RequestMapping("/update")
	public String update(Product product,Model model,@RequestParam(value="fileurl") MultipartFile multipartFile,HttpServletRequest request) throws IllegalStateException, IOException {
		String oldname = multipartFile.getOriginalFilename();
		//去掉路径的真实文件名
		String realName = UploadUtils.getRealName(oldname);
		//获得一个随机的UUID的名字
		String uuidName = UploadUtils.getUUIDName(realName);
		String basePath = request.getRealPath("/static/img");
		String dir = UploadUtils.getDir();
		File filedir = new File(basePath+dir);
		if(!filedir.exists()) {
			filedir.mkdirs();
		}
		File file = new File(filedir,uuidName);
		multipartFile.transferTo(file);
		String picurl = dir+"/"+uuidName;
		product.setPicurl(picurl);
		productService.update(product);
		model.addAttribute("message", "更改成功！");
		return "forward:/product/products";
	}
	
	@RequestMapping("/search")
	public String search(String keyWord,Model model,@RequestParam(value="nowPage",required=false,defaultValue="1")Integer nowPage) {
		List<Product> products = productService.searchByKeyWord(keyWord, nowPage, Commons.page);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("products", products);
		model.addAttribute("keyWord", keyWord);
		return "searchByKeyWord";
		
	}
	
}
