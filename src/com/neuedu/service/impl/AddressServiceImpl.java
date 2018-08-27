package com.neuedu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neuedu.mapper.AddressMapper;
import com.neuedu.po.Address;
import com.neuedu.service.AddressService;
@Service
public class AddressServiceImpl implements AddressService {

	@Autowired
	private AddressMapper addressMapper;
	@Override
	public List<Address> getListByUserid(Integer userid) {
		
		List<Address> selectByUserid = addressMapper.selectByUserid(userid);
		return selectByUserid;
	}
	
	@Override
	public void deleteByPrimaryKey(Integer addressid) {
		addressMapper.deleteByPrimaryKey(addressid);
	}

	@Override
	public void insertSelective(Address record) {
		addressMapper.insertSelective(record);
		System.out.println("service");
	}

	@Override
	public void updateAddressById(Address address) {
		addressMapper.updateAddressById(address);
		
	}

	@Override
	public Address selectByPrimaryKey(Integer addressid) {
		Address address = addressMapper.selectByPrimaryKey(addressid);
		return address;
	}
	
	

}
