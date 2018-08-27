package com.neuedu.vo;

import com.neuedu.po.Product;

public class CartVo extends Product {
	private int count;
	private int cartid;
	
	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getCartid() {
		return cartid;
	}

	public void setCartid(int cartid) {
		this.cartid = cartid;
	}

	@Override
	public String toString() {
		return "CartVo [count=" + count + ", cartid=" + cartid + "]";
	}
	
	
	
}
