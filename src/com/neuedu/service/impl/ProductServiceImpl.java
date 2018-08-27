package com.neuedu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.neuedu.mapper.ProductMapper;
import com.neuedu.po.Product;
import com.neuedu.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductMapper productMapper;
	
	@Override
	public List<Product> getProductsByType(Integer typeid,Integer nowPage,Integer page) {
		PageHelper.startPage(nowPage,page);
		return productMapper.getProductByType(typeid);
	}

	@Override
	public Product getProductById(Integer proid) {
		
		return productMapper.selectByPrimaryKey(proid);
	}

	@Override
	public List<Product> getSale() {
		List<Product> sales = productMapper.getSale();
		return sales;
	}

	@Override
	public List<Product> getAllProducts(Integer nowPage, Integer page) {
		PageHelper.startPage(nowPage,page);
		return productMapper.getAllProducts();
	}

	@Override
	public void saveProduct(Product product) {
		productMapper.insert(product);
		
	}

	@Override
	public void deteleById(Integer proid) {
		productMapper.deleteByPrimaryKey(proid);
		
	}

	@Override
	public void update(Product product) {
		productMapper.updateByPrimaryKey(product);
		
	}

	@Override
	public List<Product> searchByKeyWord(String keyWord,Integer nowPage,Integer page) {
		PageHelper.startPage(nowPage,page);
		return productMapper.searchByKeyWord("%"+keyWord+"%");
	}
	
	

}
