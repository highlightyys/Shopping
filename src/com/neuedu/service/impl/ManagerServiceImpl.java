package com.neuedu.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.neuedu.mapper.ManagerMapper;
import com.neuedu.po.Manager;
import com.neuedu.service.ManagerService;

@Service
public class ManagerServiceImpl implements ManagerService {

	
	@Autowired
	private ManagerMapper managerMapper;
	
	@Override
	public Manager getManagerByUAP(Manager manager) {
		return managerMapper.getManagerByUAP(manager);
	}

}
