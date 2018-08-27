package com.neuedu.vo;

import java.util.List;

import com.neuedu.po.Ordertable;

public class OrderVo extends Ordertable{

	private List<OrderdetailVO> orderdetaillist ;

	public List<OrderdetailVO> getOrderdetaillist() {
		return orderdetaillist;
	}

	public void setOrderdetaillist(List<OrderdetailVO> orderdetaillist) {
		this.orderdetaillist = orderdetaillist;
	}

	@Override
	public String toString() {
		super.toString();
		return "OrderVo [orderdetaillist=" + orderdetaillist + "]"+super.toString();
	}
	
	
	
}
