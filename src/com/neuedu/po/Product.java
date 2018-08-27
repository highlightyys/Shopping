package com.neuedu.po;

public class Product {
    private Integer proid;

    private String proname;

    private Double priceSale;

	private Double priceAvg;

	private String descript;

    private String picurl;

    private Integer typeid;

    private Integer stock;
    
    private Integer salecount;

  public Product() {}

	public Product(Integer proid, String proname, Double priceSale, Double priceAvg, String descript, String picurl,
			Integer typeid, Integer stock) {
		super();
		this.proid = proid;
		this.proname = proname;
		this.priceSale = priceSale;
		this.priceAvg = priceAvg;
		this.descript = descript;
		this.picurl = picurl;
		this.typeid = typeid;
		this.stock = stock;
	}
	



	public Product(String proname, Double priceSale, Double priceAvg, String descript, String picurl, Integer typeid,
			Integer stock) {
		super();
		this.proname = proname;
		this.priceSale = priceSale;
		this.priceAvg = priceAvg;
		this.descript = descript;
		this.picurl = picurl;
		this.typeid = typeid;
		this.stock = stock;
	}




	public Integer getProid() {
		return proid;
	}



	public void setProid(Integer proid) {
		this.proid = proid;
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



	public Double getPriceAvg() {
		return priceAvg;
	}



	public void setPriceAvg(Double priceAvg) {
		this.priceAvg = priceAvg;
	}



	public String getDescript() {
		return descript;
	}



	public void setDescript(String descript) {
		this.descript = descript;
	}



	public String getPicurl() {
		return picurl;
	}



	public void setPicurl(String picurl) {
		this.picurl = picurl;
	}



	public Integer getTypeid() {
		return typeid;
	}



	public void setTypeid(Integer typeid) {
		this.typeid = typeid;
	}



	public Integer getStock() {
		return stock;
	}



	public void setStock(Integer stock) {
		this.stock = stock;
	}



	public Integer getSalecount() {
		return salecount;
	}



	public void setSalecount(Integer salecount) {
		this.salecount = salecount;
	}



	@Override
	public String toString() {
		return "Product [proid=" + proid + ", proname=" + proname + ", priceSale=" + priceSale + ", priceAvg="
				+ priceAvg + ", descript=" + descript + ", picurl=" + picurl + ", typeid=" + typeid + ", stock="
				+ stock + "]";
	}
 
}