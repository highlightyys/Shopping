package com.neuedu.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.neuedu.po.Product;
import com.neuedu.po.User;
import com.neuedu.service.UserService;
import com.neuedu.utils.UploadUtils;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/register")
	public String register(Model model,User user,HttpSession session) {
		userService.saveUser(user);
		model.addAttribute("message", "注册成功！为您跳转到商城首页。");
		model.addAttribute("user", user);
		Integer userid = userService.getId(user);
		user.setUserid(userid);
		session.setAttribute("user", user);
		return "forward:/home/show";
	}
	
	@RequestMapping("/login")
	public String login(Model model,User user,HttpSession session) {
		User user0 = userService.getUserByUAP(user);
		if(user0==null) {
			model.addAttribute("message", "用户名或密码错误，请重新输入！");
			return "login";
		}
		model.addAttribute("message", "登陆成功！为您跳转到商城首页。");
		model.addAttribute("user", user0);
		session.setAttribute("user", user0);
		return "forward:/home/show";
	}
	
	@RequestMapping("/escLogin")
	public String escLogin(HttpSession session) {
		session.removeAttribute("user");
		
		return "forward:/home/show";
		
	}
	
	@RequestMapping("/checkByName")
	@ResponseBody
	public String checkByName(String username) {
		User user = userService.getUserByName(username);
		if(user != null) {
			
			return "该用户名已存在";
		}
		return "";
	}
	
	@RequestMapping("/showinformation")
	public String showInformation(HttpServletRequest request,Model model) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		model.addAttribute("user", user);
		return "userinformation";
	}
	
	@RequestMapping("/updateuser")
	public String updateuser(User user,Model model,@RequestParam(value="fileurl") MultipartFile multipartFile,HttpServletRequest request) throws IllegalStateException, IOException {
		String oldname = multipartFile.getOriginalFilename();
		//去掉路径的真实文件名
		String realName = UploadUtils.getRealName(oldname);
		//获得一个随机的UUID的名字
		String uuidName = UploadUtils.getUUIDName(realName);
		String basePath = request.getRealPath("/static/touxiang");
		String dir = UploadUtils.getDir();
		File filedir = new File(basePath+dir);
		if(!filedir.exists()) {
			filedir.mkdirs();
		}
		File file = new File(filedir,uuidName);
		multipartFile.transferTo(file);
		String userpicurl = dir+"/"+uuidName;
		user.setUserpicurl(userpicurl);
		userService.updateUserByName(user);
		HttpSession session = request.getSession();
		User user0 = (User) session.getAttribute("user");
		user.setUserid(user0.getUserid());
		session.removeAttribute("user");
		session.setAttribute("user", user);
		model.addAttribute("message", "修改成功！");
		return "forward:/user/showinformation";
	
	}
	
}
