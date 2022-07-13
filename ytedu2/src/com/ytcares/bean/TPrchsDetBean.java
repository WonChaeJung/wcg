package com.ytcares.bean;

public class TPrchsDetBean extends YTCaresBean{
	private String prchs_seq_no;
	private int prchs_grp_no;
	private String prchs_grp_cd;
	private String csmt_id;
	private int csmt_cnt;
	private long ttl_price;
	private String prchs_grp_desc;
	
	public String getPrchs_seq_no() {
		return prchs_seq_no;
	}
	public void setPrchs_seq_no(String prchs_seq_no) {
		this.prchs_seq_no = prchs_seq_no;
	}
	public int getPrchs_grp_no() {
		return prchs_grp_no;
	}
	public void setPrchs_grp_no(int prchs_grp_no) {
		this.prchs_grp_no = prchs_grp_no;
	}
	public String getPrchs_grp_cd() {
		return prchs_grp_cd;
	}
	public void setPrchs_grp_cd(String prchs_grp_cd) {
		this.prchs_grp_cd = prchs_grp_cd;
	}
	public String getCsmt_id() {
		return csmt_id;
	}
	public void setCsmt_id(String csmt_id) {
		this.csmt_id = csmt_id;
	}
	public int getCsmt_cnt() {
		return csmt_cnt;
	}
	public void setCsmt_cnt(int csmt_cnt) {
		this.csmt_cnt = csmt_cnt;
	}
	public long getTtl_price() {
		return ttl_price;
	}
	public void setTtl_price(long ttl_price) {
		this.ttl_price = ttl_price;
	}
	public String getPrchs_grp_desc() {
		return prchs_grp_desc;
	}
	public void setPrchs_grp_desc(String prchs_grp_desc) {
		this.prchs_grp_desc = prchs_grp_desc;
	}
	
}
