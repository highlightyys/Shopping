package com.neuedu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neuedu.mapper.OrderdetailMapper;
import com.neuedu.mapper.OrdertableMapper;
import com.neuedu.po.Orderdetail;
import com.neuedu.po.Ordertable;
import com.neuedu.service.OrderService;
import com.neuedu.vo.OrderVo;
import com.neuedu.vo.OrderdetailVO;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderdetailMapper orderdetailMapper;
	@Autowired
	private OrdertableMapper ordertableMapper;
	@Override
	public List<OrderdetailVO> getDetails(Integer orderid) {
		
		return orderdetailMapper.selectByOrderid(orderid);
	}

	@Override
	public int selectOrderidByOrdernum(String ordernum) {
		int orderid = ordertableMapper.selectOrderidByOrdernum(ordernum);
		
		return orderid;
	}

	@Override
	public void insertSelective(Orderdetail orderdetail) {
		 orderdetailMapper.insertSelective(orderdetail);
	}

	@Override
	public List<Ordertable> selectAllOrders() {
		List<Ordertable> orderslist = ordertableMapper.selectAllOrders();
		return orderslist;
	}

	@Override
	public List<OrderVo> selectOrderInfo(Integer userid) {
		List<OrderVo> orders = ordertableMapper.selectOrderInfo(userid);
		return orders;
	}

	@Override
	public void updateByPrimaryKeySelective(Ordertable ordertable) {
		ordertableMapper.updateByPrimaryKeySelective(ordertable);
		
	}

	@Override
	public void deleteByPrimaryKey(Integer orderid) {
		ordertableMapper.deleteByPrimaryKey(orderid);
		
	}

	@Override
	public void deleteByOrderid(Integer orderid) {
		orderdetailMapper.deleteByOrderid(orderid);
		
	}

	@Override
	public String selectStatusByOrderid(Integer orderid) {
		String orderstatus = ordertableMapper.selectStatusByOrderid(orderid);
		return orderstatus;
	}

	@Override
	public Ordertable selectByPrimaryKey(Integer orderid) {
		 Ordertable orders = ordertableMapper.selectByPrimaryKey(orderid);
		return orders;
	}

}
