package com.neuedu.service;

import java.util.List;

import com.neuedu.po.Address;

public interface AddressService {
	public List<Address> getListByUserid(Integer userid);
	
	public void deleteByPrimaryKey(Integer addressid);
	
	public void insertSelective(Address record);
	
	public void updateAddressById(Address address);
	
	public Address selectByPrimaryKey(Integer addressid);
}
