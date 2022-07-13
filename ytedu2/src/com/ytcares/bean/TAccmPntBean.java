package com.ytcares.bean;

public class TAccmPntBean extends YTCaresBean{
	private String user_id;
	private String accm_ym;
	private long accm_pnt;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getAccm_ym() {
		return accm_ym;
	}
	public void setAccm_ym(String accm_ym) {
		this.accm_ym = accm_ym;
	}
	public long getAccm_pnt() {
		return accm_pnt;
	}
	public void setAccm_pnt(long accm_pnt) {
		this.accm_pnt = accm_pnt;
	}
}
