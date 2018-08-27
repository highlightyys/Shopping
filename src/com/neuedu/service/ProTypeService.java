package com.neuedu.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.neuedu.po.Producttype;

public interface ProTypeService {
	public List<Producttype> getAllType();
	
	public List<Producttype> getTypes(Integer nowPage);
	
	public void addType(Producttype type);
	
	public void deteleType(Integer typeid);
	
	public void updateType(Producttype type);
	
	public List<Producttype> findAllTypes();
}
