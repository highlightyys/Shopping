package com.neuedu.mapper;

import java.util.List;

import com.neuedu.po.Orderdetail;
import com.neuedu.vo.OrderdetailVO;

public interface OrderdetailMapper {
    int deleteByPrimaryKey(Integer detailid);

    int insert(Orderdetail record);

    int insertSelective(Orderdetail record);

    Orderdetail selectByPrimaryKey(Integer detailid);

    int updateByPrimaryKeySelective(Orderdetail record);

    int updateByPrimaryKey(Orderdetail record);
    
    List<OrderdetailVO> selectByOrderid(Integer orderid);
    
    int deleteByOrderid(Integer orderid);
    
    
}