package com.neuedu.po;

import java.util.Date;

public class Ordertable {
    private Integer orderid;

    private Date time;

    private Double totalprice;

    private String orderstatus;

    private Integer orderaddressid;

    private Integer userid;

    private String ordernum;

    public Integer getOrderid() {
        return orderid;
    }

    public void setOrderid(Integer orderid) {
        this.orderid = orderid;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Double getTotalprice() {
        return totalprice;
    }

    public void setTotalprice(Double totalprice) {
        this.totalprice = totalprice;
    }

    public String getOrderstatus() {
        return orderstatus;
    }

    public void setOrderstatus(String orderstatus) {
        this.orderstatus = orderstatus == null ? null : orderstatus.trim();
    }

    public Integer getOrderaddressid() {
        return orderaddressid;
    }

    public void setOrderaddressid(Integer orderaddressid) {
        this.orderaddressid = orderaddressid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getOrdernum() {
        return ordernum;
    }

    public void setOrdernum(String ordernum) {
        this.ordernum = ordernum;
    }

	@Override
	public String toString() {
		return "Ordertable [orderid=" + orderid + ", time=" + time + ", totalprice=" + totalprice + ", orderstatus="
				+ orderstatus + ", orderaddressid=" + orderaddressid + ", userid=" + userid + ", ordernum=" + ordernum
				+ "]";
	}
    
    
}