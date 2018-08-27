package com.neuedu.mapper;

import java.util.List;

import com.neuedu.po.Ordertable;
import com.neuedu.vo.OrderVo;
import com.neuedu.vo.OrderdetailVO;

public interface OrdertableMapper {
    int deleteByPrimaryKey(Integer orderid);

    int insert(Ordertable record);

    int insertSelective(Ordertable record);

    Ordertable selectByPrimaryKey(Integer orderid);

    int updateByPrimaryKeySelective(Ordertable record);

    int updateByPrimaryKey(Ordertable record);
    
    //×Ô¼ºÐ´µÄ
    int selectOrderidByOrdernum(String ordernum);
    
    List<Ordertable> selectAllOrders();
    
    List<OrderVo> selectOrderInfo(Integer userid);
    
    String selectStatusByOrderid(Integer orderid);
}