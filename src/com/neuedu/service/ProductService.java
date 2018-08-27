package com.neuedu.service;

import java.util.List;

import com.neuedu.po.Product;
import com.sun.org.apache.xml.internal.resolver.helpers.PublicId;

public interface ProductService {
	public List<Product> getProductsByType(Integer typeid,Integer nowPage,Integer page);
	
	public Product getProductById(Integer proid);
	
	public List<Product> getSale();
	
	public List<Product> getAllProducts(Integer nowPage,Integer page);
	
	public void saveProduct(Product product);
	
	public void deteleById(Integer proid);
	
	public void update(Product product);
	
	public List<Product> searchByKeyWord(String keyWord,Integer nowPage,Integer page);
}
