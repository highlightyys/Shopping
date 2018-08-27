package com.neuedu.mapper;

import java.util.List;

import com.neuedu.po.Cart;
import com.neuedu.po.Ordertable;
import com.neuedu.vo.CartVo;

public interface CartMapper {
    int deleteByPrimaryKey(Integer cartid);

    int insert(Cart record);

    int insertSelective(Cart record);

    Cart selectByPrimaryKey(Integer cartid);

    int updateByPrimaryKeySelective(Cart record);

    int updateByPrimaryKey(Cart record);
    
    
   /*     ¼ÓµÄ        */
    List<CartVo> getListByUserId(Integer userid);
    
    List<CartVo> getOrdertableInfoByCartid(Integer cartid);
    
    List<Cart> search(Cart cart);
    
    Integer getCartId(Cart cart);
}
