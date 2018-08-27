package com.neuedu.po;

public class Collection0 {
    private Integer collectionid;

    private Integer userid;

    private Integer proid;

    public Collection0() {}
    public Collection0(Integer collectionid, Integer userid, Integer proid) {
		super();
		this.collectionid = collectionid;
		this.userid = userid;
		this.proid = proid;
	}

	@Override
	public String toString() {
		return "Collection [collectionid=" + collectionid + ", userid=" + userid + ", proid=" + proid + "]";
	}

	public Integer getCollectionid() {
        return collectionid;
    }

    public void setCollectionid(Integer collectionid) {
        this.collectionid = collectionid;
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
}