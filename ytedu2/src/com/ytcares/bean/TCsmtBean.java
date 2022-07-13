package com.ytcares.bean;

import java.sql.Timestamp;

public class TCsmtBean extends YTCaresBean{
	private String csmt_id;
	private String csmt_kind_cd;
	private String csmt_name;
	private String csmt_img;
	private String csmt_desc;
	private String csmt_desc_img1;
	private String csmt_desc_img2;
	private String csmt_desc_img3;
	private Timestamp csmt_reg_ymd;
	private String pub_comp;
	private Timestamp pub_date;
	private String pay_desc;
	private long read_cnt;
	private String dlt_flg;
	private String pay_desc_img;
	private long csmt_price;
	private long csmt_stock;
	
	public long getCsmt_price() {
		return csmt_price;
	}
	public void setCsmt_price(long csmt_price) {
		this.csmt_price = csmt_price;
	}
	public long getCsmt_stock() {
		return csmt_stock;
	}
	public void setCsmt_stock(long csmt_stock) {
		this.csmt_stock = csmt_stock;
	}
	public String getCsmt_id() {
		return csmt_id;
	}
	public void setCsmt_id(String csmt_id) {
		this.csmt_id = csmt_id;
	}
	public String getCsmt_kind_cd() {
		return csmt_kind_cd;
	}
	public void setCsmt_kind_cd(String csmt_kind_cd) {
		this.csmt_kind_cd = csmt_kind_cd;
	}
	public String getCsmt_name() {
		return csmt_name;
	}
	public void setCsmt_name(String csmt_name) {
		this.csmt_name = csmt_name;
	}
	public String getCsmt_img() {
		return csmt_img;
	}
	public void setCsmt_img(String csmt_img) {
		this.csmt_img = csmt_img;
	}
	public String getCsmt_desc() {
		return csmt_desc;
	}
	public void setCsmt_desc(String csmt_desc) {
		this.csmt_desc = csmt_desc;
	}
	public String getCsmt_desc_img1() {
		return csmt_desc_img1;
	}
	public void setCsmt_desc_img1(String csmt_desc_img1) {
		this.csmt_desc_img1 = csmt_desc_img1;
	}
	public String getCsmt_desc_img2() {
		return csmt_desc_img2;
	}
	public void setCsmt_desc_img2(String csmt_desc_img2) {
		this.csmt_desc_img2 = csmt_desc_img2;
	}
	public String getCsmt_desc_img3() {
		return csmt_desc_img3;
	}
	public void setCsmt_desc_img3(String csmt_desc_img3) {
		this.csmt_desc_img3 = csmt_desc_img3;
	}
	public Timestamp getCsmt_reg_ymd() {
		return csmt_reg_ymd;
	}
	public void setCsmt_reg_ymd(Timestamp csmt_reg_ymd) {
		this.csmt_reg_ymd = csmt_reg_ymd;
	}
	public String getPub_comp() {
		return pub_comp;
	}
	public void setPub_comp(String pub_comp) {
		this.pub_comp = pub_comp;
	}
	public Timestamp getPub_date() {
		return pub_date;
	}
	public void setPub_date(Timestamp pub_date) {
		this.pub_date = pub_date;
	}
	public String getPay_desc() {
		return pay_desc;
	}
	public void setPay_desc(String pay_desc) {
		this.pay_desc = pay_desc;
	}
	public long getRead_cnt() {
		return read_cnt;
	}
	public void setRead_cnt(long read_cnt) {
		this.read_cnt = read_cnt;
	}
	public String getDlt_flg() {
		return dlt_flg;
	}
	public void setDlt_flg(String dlt_flg) {
		this.dlt_flg = dlt_flg;
	}
	public String getPay_desc_img() {
		return pay_desc_img;
	}
	public void setPay_desc_img(String pay_desc_img) {
		this.pay_desc_img = pay_desc_img;
	}
}
