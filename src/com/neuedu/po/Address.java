package com.neuedu.po;

public class Address {
    private Integer addressid;

    private Integer userid;

    private String consignee;

    private String conphone;

    private String detailaddr;

    public Integer getAddressid() {
        return addressid;
    }

    public void setAddressid(Integer addressid) {
        this.addressid = addressid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getConsignee() {
        return consignee;
    }

    public void setConsignee(String consignee) {
        this.consignee = consignee == null ? null : consignee.trim();
    }

   

    public String getConphone() {
		return conphone;
	}

	public void setConphone(String conphone) {
		this.conphone = conphone;
	}

	public String getDetailaddr() {
        return detailaddr;
    }

    public void setDetailaddr(String detailaddr) {
        this.detailaddr = detailaddr == null ? null : detailaddr.trim();
    }

	@Override
	public String toString() {
		return "Address [addressid=" + addressid + ", userid=" + userid + ", consignee=" + consignee + ", conphone="
				+ conphone + ", detailaddr=" + detailaddr + "]";
	}
    
}