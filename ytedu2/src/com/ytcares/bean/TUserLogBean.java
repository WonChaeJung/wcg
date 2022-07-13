package com.ytcares.bean;

import java.sql.Timestamp;

public class TUserLogBean extends YTCaresBean{
	private String user_id;
	private Timestamp acss_date;
	private String acss_type_cd;
	private String acss_trg;
	private String acss_ip;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public Timestamp getAcss_date() {
		return acss_date;
	}
	public void setAcss_date(Timestamp acss_date) {
		this.acss_date = acss_date;
	}
	public String getAcss_type_cd() {
		return acss_type_cd;
	}
	public void setAcss_type_cd(String acss_type_cd) {
		this.acss_type_cd = acss_type_cd;
	}
	public String getAcss_trg() {
		return acss_trg;
	}
	public void setAcss_trg(String acss_trg) {
		this.acss_trg = acss_trg;
	}
	public String getAcss_ip() {
		return acss_ip;
	}
	public void setAcss_ip(String acss_ip) {
		this.acss_ip = acss_ip;
	}
	
}
