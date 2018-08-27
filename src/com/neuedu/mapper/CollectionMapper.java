package com.neuedu.mapper;

import java.util.List;

import com.neuedu.po.Collection0;
import com.neuedu.po.Product;


public interface CollectionMapper {
    int deleteByPrimaryKey(Integer collectionid);

    int insert(Collection0 record);

    int insertSelective(Collection0 record);

    Collection0 selectByPrimaryKey(Integer collectionid);

    int updateByPrimaryKeySelective(Collection0 record);

    int updateByPrimaryKey(Collection0 record);
    
    
    List<Product> getProductByUserId(Integer userid);
    
    void addCollection(Collection0 collection);
    
    void subCollection(Collection0 collection);
    
    List<Product> queryCollection(Collection0 collection);
}