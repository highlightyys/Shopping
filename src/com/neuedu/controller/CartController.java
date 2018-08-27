package com.neuedu.controller;

import java.io.Reader;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.neuedu.po.Cart;
import com.neuedu.po.Orderdetail;
import com.neuedu.po.Ordertable;
import com.neuedu.po.User;
import com.neuedu.service.CartService;
import com.neuedu.service.OrderService;
import com.neuedu.utils.MakeOrderNumUtil;
import com.neuedu.vo.CartVo;

@Controller
@RequestMapping("/cart")
public class CartController {
	
	@Autowired
	private CartService cartService;
	@Autowired
	private OrderService orderService;
	
	
	@RequestMapping("/add")
	public String addCart(HttpServletRequest request,Integer count,Integer proid,Model model) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		Cart cart = new Cart();
		cart.setCount(count);
		cart.setUserid(user.getUserid());
		cart.setProid(proid);
		if(cartService.search(cart)) {
			model.addAttribute("message", "����Ʒ���ﳵ�Ѵ��ڣ������ظ���ӣ�");
			model.addAttribute("proid", proid);
			return "redirect:/product/detail";
		}
		cartService.insert(cart);
		model.addAttribute("message", "��ӳɹ���");
		model.addAttribute("proid", proid);
		return "redirect:/product/detail";
	}
	
	@RequestMapping({"/","/show"})
	public String showLogin(Model model,HttpServletRequest request,String message) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		
		Integer userid = user.getUserid();
		List<CartVo> list = cartService.getList(userid);
		model.addAttribute("list", list);
		model.addAttribute("user", user);
		model.addAttribute("message",message);
		return "/cart";
	}
	
	@RequestMapping("/deleteone")
	public String deleteone(Integer cartid) {
		cartService.deleteone(cartid);
		return "redirect:/cart/";
	}
	
	@RequestMapping("/updatecount")
	public String subcount(Cart cart) {
		if(cart.getCount() <= 0) {
			cartService.deleteone(cart.getCartid());
			return "redirect:/cart/";
		}
		cartService.updateByPrimaryKeySelective(cart);
		return "redirect:/cart/";
	}
	
	
	@RequestMapping("/createorders")
	public String createorders(@RequestParam(value="cartid",required=false)Integer[] cartid,HttpServletRequest request,Model model) throws ParseException {	
		
		if(cartid == null) {
			model.addAttribute("message", "��ѡ����Ҫ�������Ʒ");
			return "redirect:/cart/";
		}

		/**
		 * 1.���涩����Ϣ
		 */
		//userid��username
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		int userid = user.getUserid();
		String username = user.getUsername();
		//�ܼ�
		double totalprice = 0;
		for(int i = 0; i < cartid.length; i++) {
			CartVo ordersInfo = cartService.getOrdersInfo(cartid[i]);
			double singleprice = (double)(Math.round(ordersInfo.getPriceSale()*ordersInfo.getCount()*100)/100.0);
			totalprice += singleprice;
		}
		//������ţ�����
		String ordernum = MakeOrderNumUtil.makeOrderNum(username);
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd"); 
		Date time = df.parse(df.format(new Date()));
		
		Ordertable ordertable = new Ordertable();
		ordertable.setOrdernum(ordernum);	
		ordertable.setTime(time);
		ordertable.setTotalprice(totalprice);
		ordertable.setUserid(userid);
		
		cartService.saveOrders(ordertable);
				
		/**
		 *  2.���涩��������Ϣ
		 */
		
		//��ѯ����id
		int orderid = orderService.selectOrderidByOrdernum(ordernum);
		model.addAttribute("orderid", orderid);
		
		//��ѯ��Ʒid���������ܼۣ����涩��������Ϣ
		for(int i = 0; i < cartid.length; i++) {
			CartVo ordersInfo = cartService.getOrdersInfo(cartid[i]);
			double total = (double)(Math.round(ordersInfo.getPriceSale()*ordersInfo.getCount()*100)/100.0);
			int count = ordersInfo.getCount();
			int proid = ordersInfo.getProid();
			
			Orderdetail orderdetail = new Orderdetail();
			orderdetail.setCount(count);
			orderdetail.setOrderid(orderid);
			orderdetail.setProid(proid);
			orderdetail.setTotal(total);
			orderService.insertSelective(orderdetail);
			
		}
		
		/**
		 * 3.�ڹ��ﳵ��ɾ��
		 */
		
		for(int i = 0; i < cartid.length; i++) {
			deleteone(cartid[i]);
		//	System.out.println("ɾ��"+cartid[i]);
		}

		return "redirect:/pay/";
	}
	
	@RequestMapping("/buy")
	public String buy(Double priceSale,Integer proid,Integer count,HttpServletRequest request,Model model) throws ParseException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		/*Cart cart = new Cart();
		cart.setCount(count);
		cart.setUserid(user.getUserid());
		cart.setProid(proid);
		cartService.insert(cart);
		Integer cartid = cartService.getCartId(cart);*/
		double totalprice = count * priceSale;
		String ordernum = MakeOrderNumUtil.makeOrderNum(user.getUsername());
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd"); 
		Date time = df.parse(df.format(new Date()));
		Ordertable ordertable = new Ordertable();
		ordertable.setOrdernum(ordernum);	
		ordertable.setTime(time);
		ordertable.setTotalprice(totalprice);
		ordertable.setUserid(user.getUserid());
		cartService.saveOrders(ordertable);
		int orderid = orderService.selectOrderidByOrdernum(ordernum);
		model.addAttribute("orderid", orderid);
		
		Orderdetail orderdetail = new Orderdetail();
		orderdetail.setCount(count);
		orderdetail.setOrderid(orderid);
		orderdetail.setProid(proid);
		orderdetail.setTotal(totalprice);
		orderService.insertSelective(orderdetail);
		
		
		return "redirect:/pay/";
	}

}
 