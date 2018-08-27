package com.neuedu.po;

import java.util.List;

public class Producttype {
    private Integer typeid;

    private String typename;
    
    private Integer selection;
    
    private List<Producttype> types;
    
    public Integer getSelection() {
		return selection;
	}

	public void setSelection(Integer selection) {
		this.selection = selection;
	}

    public List<Producttype> getTypes() {
		return types;
	}

	public void setTypes(List<Producttype> types) {
		this.types = types;
	}

	public Integer getTypeid() {
        return typeid;
    }

    public void setTypeid(Integer typeid) {
        this.typeid = typeid;
    }

    public String getTypename() {
        return typename;
    }

    public void setTypename(String typename) {
        this.typename = typename == null ? null : typename.trim();
    }


    
    
}