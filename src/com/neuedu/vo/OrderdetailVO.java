package com.neuedu.vo;

import com.neuedu.po.Orderdetail;

public class OrderdetailVO extends Orderdetail {
	private Integer proid;
	public Integer getProid() {
		return proid;
	}
	public void setProid(Integer proid) {
		this.proid = proid;
	}
	private String proname;
	private Double priceSale;
	private String picurl;
	
	
	public String getPicurl() {
		return picurl;
	}
	public void setPicurl(String picurl) {
		this.picurl = picurl;
	}
	@Override
	public String toString() {
		return "OrderdetailVO [proname=" + proname + ", priceSale=" + priceSale + "]";
	}
	public String getProname() {
		return proname;
	}
	public void setProname(String proname) {
		this.proname = proname;
	}
	public Double getPriceSale() {
		return priceSale;
	}
	public void setPriceSale(Double priceSale) {
		this.priceSale = priceSale;
	}
	
}
