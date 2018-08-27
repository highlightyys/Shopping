package com.neuedu.mapper;

import java.util.List;

import com.neuedu.po.Product;

public interface ProductMapper {
    int deleteByPrimaryKey(Integer proid);

    int insert(Product record);

    int insertSelective(Product record);

    Product selectByPrimaryKey(Integer proid);

    int updateByPrimaryKeySelective(Product record);

    int updateByPrimaryKey(Product record);
    
    List<Product> getProductByType(Integer typeid);
    
    List<Product> getSale();
    
    List<Product> getAllProducts();
    
    List<Product> searchByKeyWord(String keyWord);
}