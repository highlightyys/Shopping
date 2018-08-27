package com.neuedu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.neuedu.mapper.ProducttypeMapper;
import com.neuedu.po.Producttype;
import com.neuedu.service.ProTypeService;

@Service
public class ProTypeServiceImpl implements ProTypeService {

	@Autowired
	ProducttypeMapper proTypeMapper;
	
	
	@Override
	public List<Producttype> getAllType() {
		
		return proTypeMapper.getAllType();
	}


	@Override
	public List<Producttype> getTypes(Integer nowPage) {
		PageHelper.startPage(nowPage,10);
		List<Producttype> types = proTypeMapper.getTypes();
		return types;
	}


	@Override
	public void addType(Producttype type) {
		proTypeMapper.insert(type);
		
	}


	@Override
	public void deteleType(Integer typeid) {
		proTypeMapper.deleteByPrimaryKey(typeid);
	}


	@Override
	public void updateType(Producttype type) {
		proTypeMapper.updateType(type);
		
	}


	@Override
	public List<Producttype> findAllTypes() {
		return proTypeMapper.findAllTypes();
	}
	
	

}
