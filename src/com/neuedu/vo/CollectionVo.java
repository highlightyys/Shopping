package com.neuedu.vo;

import com.neuedu.po.Collection0;
import com.neuedu.po.Product;

public class CollectionVo extends Product{
	private Integer userid;
	private Integer Collectionid;
	
	
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public Integer getCollectionid() {
		return Collectionid;
	}
	public void setCollectionid(Integer collectionid) {
		Collectionid = collectionid;
	}
	
}
