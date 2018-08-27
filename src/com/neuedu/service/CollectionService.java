package com.neuedu.service;

import java.util.List;

import com.neuedu.po.Collection0;
import com.neuedu.po.Product;

public interface CollectionService {

	public void addCollection(Collection0 collection);
	public List<Product> getProductByUserId(Integer userid);
	public void subCollection(Collection0 collection);
	public boolean queryCollection(Collection0 collection);
	
}
