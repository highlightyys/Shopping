package com.neuedu.mapper;

import com.neuedu.po.User;

public interface UserMapper {
    int deleteByPrimaryKey(Integer userid);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer userid);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    User selectByUAP(User user);
    
    User selectByName(String username);
    
    void updateByUsername(User user);
    
    Integer getId(User user);
    
}