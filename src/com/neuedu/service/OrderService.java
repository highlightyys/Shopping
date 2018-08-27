package com.neuedu.service;

import java.util.List;

import org.apache.ibatis.type.IntegerTypeHandler;

import com.neuedu.po.Orderdetail;
import com.neuedu.po.Ordertable;
import com.neuedu.vo.OrderVo;
import com.neuedu.vo.OrderdetailVO;

public interface OrderService {
	public List<OrderdetailVO> getDetails(Integer orderid);
	
	public int selectOrderidByOrdernum(String ordernum);
	
	public void insertSelective(Orderdetail orderdetail);
	
	public List<Ordertable> selectAllOrders();
	
	public List<OrderVo> selectOrderInfo(Integer userid);
	
	public void updateByPrimaryKeySelective(Ordertable ordertable);
	
	public void deleteByPrimaryKey(Integer orderid);
	
	public void deleteByOrderid(Integer orderid);
	
	public String selectStatusByOrderid(Integer orderid);
	
	public Ordertable selectByPrimaryKey(Integer orderid);
}
