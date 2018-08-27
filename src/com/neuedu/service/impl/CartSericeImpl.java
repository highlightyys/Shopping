package com.neuedu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neuedu.mapper.CartMapper;
import com.neuedu.mapper.OrdertableMapper;
import com.neuedu.po.Cart;
import com.neuedu.po.Ordertable;
import com.neuedu.service.CartService;
import com.neuedu.vo.CartVo;
@Service
public class CartSericeImpl implements CartService {
	@Autowired
	private CartMapper cartMapper;
	@Autowired
	private OrdertableMapper ordertableMapper;
	
	@Override
	public List<CartVo> getList(Integer userid) {
		List<CartVo> cartList = cartMapper.getListByUserId(userid);
		return cartList;

	}

	@Override
	public void deleteone(Integer cartid) {
		cartMapper.deleteByPrimaryKey(cartid);
	}

	@Override
	public int updateByPrimaryKeySelective(Cart record) {
		cartMapper.updateByPrimaryKeySelective(record);
		return 0;
	}

	@Override
	public CartVo getOrdersInfo(Integer cartid) {
		List<CartVo> list = cartMapper.getOrdertableInfoByCartid(cartid);
		return list.get(0);
	}

	@Override
	public void saveOrders(Ordertable ordertable) {
		ordertableMapper.insertSelective(ordertable);
	}

	@Override
	public void insert(Cart cart) {
		System.out.println(cartMapper.insert(cart));
		
	}

	@Override
	public boolean search(Cart cart) {
		if(cartMapper.search(cart).size()!=0) {
			return true;
		}
		return false;
	}

	@Override
	public Integer getCartId(Cart cart) {
		
		return cartMapper.getCartId(cart);
	}

	
}
