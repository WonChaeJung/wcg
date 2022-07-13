package com.ytcares.bean;

import java.sql.Timestamp;

public class TPrchsBean extends YTCaresBean{
	private String prchs_seq_no;
	private String prchs_user_id;
	private Timestamp prchs_date;
	private String prchs_stat_cd;
	private long prchs_price;
	private String pay_acc;
	private String dlvr_name;
	private String dlvr_phone;
	private String dlvr_addr;
	private Timestamp dlvr_date;
	private Timestamp dlvr_comp_date;
	private Timestamp prchs_comp_date;
	private Timestamp prchs_cncl_date;
	private String rmrks;
	private String dlt_flg;
	private int prchs_cnt;
	
	public int getPrchs_cnt() {
		return prchs_cnt;
	}
	public void setPrchs_cnt(int prchs_cnt) {
		this.prchs_cnt = prchs_cnt;
	}
	public long getPrchs_price() {
		return prchs_price;
	}
	public void setPrchs_price(long prchs_price) {
		this.prchs_price = prchs_price;
	}
	public String getRmrks() {
		return rmrks;
	}
	public void setRmrks(String rmrks) {
		this.rmrks = rmrks;
	}
	public String getPrchs_seq_no() {
		return prchs_seq_no;
	}
	public void setPrchs_seq_no(String prchs_seq_no) {
		this.prchs_seq_no = prchs_seq_no;
	}
	public String getPrchs_user_id() {
		return prchs_user_id;
	}
	public void setPrchs_user_id(String prchs_user_id) {
		this.prchs_user_id = prchs_user_id;
	}
	public Timestamp getPrchs_date() {
		return prchs_date;
	}
	public void setPrchs_date(Timestamp prchs_date) {
		this.prchs_date = prchs_date;
	}
	public String getPrchs_stat_cd() {
		return prchs_stat_cd;
	}
	public void setPrchs_stat_cd(String prchs_stat_cd) {
		this.prchs_stat_cd = prchs_stat_cd;
	}
	
	public String getPay_acc() {
		return pay_acc;
	}
	public void setPay_acc(String pay_acc) {
		this.pay_acc = pay_acc;
	}
	public String getDlvr_name() {
		return dlvr_name;
	}
	public void setDlvr_name(String dlvr_name) {
		this.dlvr_name = dlvr_name;
	}
	public String getDlvr_phone() {
		return dlvr_phone;
	}
	public void setDlvr_phone(String dlvr_phone) {
		this.dlvr_phone = dlvr_phone;
	}
	public String getDlvr_addr() {
		return dlvr_addr;
	}
	public void setDlvr_addr(String dlvr_addr) {
		this.dlvr_addr = dlvr_addr;
	}
	public Timestamp getDlvr_date() {
		return dlvr_date;
	}
	public void setDlvr_date(Timestamp dlvr_date) {
		this.dlvr_date = dlvr_date;
	}
	public Timestamp getDlvr_comp_date() {
		return dlvr_comp_date;
	}
	public void setDlvr_comp_date(Timestamp dlvr_comp_date) {
		this.dlvr_comp_date = dlvr_comp_date;
	}
	public Timestamp getPrchs_comp_date() {
		return prchs_comp_date;
	}
	public void setPrchs_comp_date(Timestamp prchs_comp_date) {
		this.prchs_comp_date = prchs_comp_date;
	}
	public Timestamp getPrchs_cncl_date() {
		return prchs_cncl_date;
	}
	public void setPrchs_cncl_date(Timestamp prchs_cncl_date) {
		this.prchs_cncl_date = prchs_cncl_date;
	}
	public String getDlt_flg() {
		return dlt_flg;
	}
	public void setDlt_flg(String dlt_flg) {
		this.dlt_flg = dlt_flg;
	}
	
}
