package com.neuedu.po;

public class Cart {
    private Integer cartid;

    private Integer userid;

    private Integer proid;

    private Integer count;

    public Integer getCartid() {
        return cartid;
    }

    public void setCartid(Integer cartid) {
        this.cartid = cartid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getProid() {
        return proid;
    }

    public void setProid(Integer proid) {
        this.proid = proid;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

	@Override
	public String toString() {
		return "Cart [cartid=" + cartid + ", userid=" + userid + ", proid=" + proid + ", count=" + count + "]";
	}
    
}