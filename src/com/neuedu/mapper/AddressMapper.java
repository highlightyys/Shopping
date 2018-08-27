package com.neuedu.mapper;



import java.util.List;

import com.neuedu.po.Address;

public interface AddressMapper {
    int deleteByPrimaryKey(Integer addressid);

    int insert(Address record);

    int insertSelective(Address record);

    Address selectByPrimaryKey(Integer addressid);

    int updateByPrimaryKeySelective(Address record);

    int updateByPrimaryKey(Address record);
    
    List<Address> selectByUserid(Integer userid);
    
    void updateAddressById(Address address);
}