package com.neuedu.service;

import org.apache.coyote.http11.filters.VoidInputFilter;

import com.neuedu.po.User;

public interface UserService {
	public void saveUser(User user);
	
	public User getUserByUAP(User user);
	
	public User getUserByName(String username);
	
	public void updateUserByName(User user);
	
	public Integer getId(User user);
}
