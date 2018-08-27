package com.neuedu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neuedu.mapper.CollectionMapper;
import com.neuedu.po.Collection0;
import com.neuedu.po.Product;
import com.neuedu.service.CollectionService;

@Service
public class CollectionServiceImpl implements CollectionService{

	@Autowired
	private CollectionMapper collectionMapper;
	
	@Override
	public void addCollection(Collection0 collection) {
		collectionMapper.addCollection(collection);
		
	}

	@Override
	public List<Product> getProductByUserId(Integer userid) {
		
		return collectionMapper.getProductByUserId(userid);
	}

	@Override
	public void subCollection(Collection0 collection) {
		collectionMapper.subCollection(collection);
		
	}

	@Override
	public boolean queryCollection(Collection0 collection) {
		List<Product> list = collectionMapper.queryCollection(collection);
		
		if(list.size()!=0) {
			return true;
		}
		return false;
	}

}
