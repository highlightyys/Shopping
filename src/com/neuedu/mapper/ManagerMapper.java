package com.neuedu.mapper;

import com.neuedu.po.Manager;

public interface ManagerMapper {
    int insert(Manager record);

    int insertSelective(Manager record);
    
    Manager getManagerByUAP(Manager manager);
}