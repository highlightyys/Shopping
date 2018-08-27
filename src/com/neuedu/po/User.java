package com.neuedu.po;

public class User {
    private Integer userid;

    private String username;

    private String password;

    private String truename;

    private String email;

    private String address;

    private String phone;

    private Integer userstatus;

    private String activationcode;
    
    private String userpicurl;

    public String getUserpicurl() {
		return userpicurl;
	}

	public void setUserpicurl(String userpicurl) {
		this.userpicurl = userpicurl;
	}



	@Override
	public String toString() {
		return "User [userid=" + userid + ", username=" + username + ", password=" + password + ", truename=" + truename
				+ ", email=" + email + ", address=" + address + ", phone=" + phone + ", userstatus=" + userstatus
				+ ", activationcode=" + activationcode + ", userpicurl=" + userpicurl + "]";
	}

	public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getTruename() {
        return truename;
    }

    public void setTruename(String truename) {
        this.truename = truename == null ? null : truename.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public Integer getUserstatus() {
        return userstatus;
    }

    public void setUserstatus(Integer userstatus) {
        this.userstatus = userstatus;
    }

    public String getActivationcode() {
        return activationcode;
    }

    public void setActivationcode(String activationcode) {
        this.activationcode = activationcode == null ? null : activationcode.trim();
    }
}