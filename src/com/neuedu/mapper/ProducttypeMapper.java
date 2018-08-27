package com.neuedu.mapper;

import java.util.List;

import com.neuedu.po.Producttype;

public interface ProducttypeMapper {
    int deleteByPrimaryKey(Integer typeid);

    int insert(Producttype record);

    int insertSelective(Producttype record);

    Producttype selectByPrimaryKey(Integer typeid);

    int updateByPrimaryKeySelective(Producttype record);

    int updateByPrimaryKey(Producttype record);
    
    List<Producttype> getAllType();
    
    List<Producttype> getTypes();
    
    void updateType(Producttype type);
    
    List<Producttype> findAllTypes();
}