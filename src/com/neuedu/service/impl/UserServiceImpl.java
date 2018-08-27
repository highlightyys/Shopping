package com.neuedu.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.neuedu.mapper.UserMapper;
import com.neuedu.po.User;
import com.neuedu.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;
	
	@Override
	public void saveUser(User user) {
		userMapper.insert(user);
	}

	@Override
	public User getUserByUAP(User user) {
		return userMapper.selectByUAP(user);
		
	}

	@Override
	public User getUserByName(String username) {
		
		return userMapper.selectByName(username);
	}

	@Override
	public void updateUserByName(User user) {
		userMapper.updateByUsername(user);
		
	}

	@Override
	public Integer getId(User user) {
		
		return userMapper.getId(user);
	}
	
	
	
	
}
