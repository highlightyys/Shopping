package com.neuedu.service;

import java.util.List;

import com.neuedu.po.Cart;
import com.neuedu.po.Ordertable;
import com.neuedu.vo.CartVo;

public interface CartService {
	public List<CartVo> getList(Integer userid);
	
	public void deleteone(Integer cartid);
	
	public int updateByPrimaryKeySelective(Cart record);
	
	public CartVo getOrdersInfo(Integer cartid);
	
	public void saveOrders(Ordertable ordertable);
	
	public void insert(Cart cart);
	
	public boolean search(Cart cart);
	
	public Integer getCartId(Cart cart);
}
