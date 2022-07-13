package com.ytcares.bean;

import java.sql.Timestamp;

public class TLectureBean extends YTCaresBean{
	private long lec_seq_no;
	private String lec_stat_cd;
	private String lec_stat_nm;
	private String lec_title;
	private String lec_host;
	private String lec_st_date;
	private String lec_ed_date;
	private String lec_time;
	private String lec_desc;
	private String lec_desc_img;
	private String lec_req_id;
	private String lec_req_pass;
	private String lec_loc;
	private int lec_man_ct;
	private String lec_subj;
	private long read_cnt;
	private Timestamp reg_date;
	private String dlt_flg;
	private long lec_req_no;
	public String getLec_stat_nm() {
		return lec_stat_nm;
	}
	public void setLec_stat_nm(String lecStatNm) {
		lec_stat_nm = lecStatNm;
	}
	public long getLec_req_no() {
		return lec_req_no;
	}
	public void setLec_req_no(long lecReqNo) {
		lec_req_no = lecReqNo;
	}
	public long getLec_seq_no() {
		return lec_seq_no;
	}
	public void setLec_seq_no(long lec_seq_no) {
		this.lec_seq_no = lec_seq_no;
	}
	public String getLec_stat_cd() {
		return lec_stat_cd;
	}
	public void setLec_stat_cd(String lec_stat_cd) {
		this.lec_stat_cd = lec_stat_cd;
	}
	public String getLec_title() {
		return lec_title;
	}
	public void setLec_title(String lec_title) {
		this.lec_title = lec_title;
	}
	public String getLec_host() {
		return lec_host;
	}
	public void setLec_host(String lec_host) {
		this.lec_host = lec_host;
	}
	public String getLec_st_date() {
		return lec_st_date;
	}
	public void setLec_st_date(String lec_st_date) {
		this.lec_st_date = lec_st_date;
	}
	public String getLec_ed_date() {
		return lec_ed_date;
	}
	public void setLec_ed_date(String lec_ed_date) {
		this.lec_ed_date = lec_ed_date;
	}
	public String getLec_time() {
		return lec_time;
	}
	public void setLec_time(String lec_time) {
		this.lec_time = lec_time;
	}
	public String getLec_desc() {
		return lec_desc;
	}
	public void setLec_desc(String lec_desc) {
		this.lec_desc = lec_desc;
	}
	public String getLec_desc_img() {
		return lec_desc_img;
	}
	public void setLec_desc_img(String lec_desc_img) {
		this.lec_desc_img = lec_desc_img;
	}
	public String getLec_req_id() {
		return lec_req_id;
	}
	public void setLec_req_id(String lec_req_id) {
		this.lec_req_id = lec_req_id;
	}
	public String getLec_req_pass() {
		return lec_req_pass;
	}
	public void setLec_req_pass(String lec_req_pass) {
		this.lec_req_pass = lec_req_pass;
	}
	public String getLec_loc() {
		return lec_loc;
	}
	public void setLec_loc(String lec_loc) {
		this.lec_loc = lec_loc;
	}
	public int getLec_man_ct() {
		return lec_man_ct;
	}
	public void setLec_man_ct(int lec_man_ct) {
		this.lec_man_ct = lec_man_ct;
	}
	public String getLec_subj() {
		return lec_subj;
	}
	public void setLec_subj(String lec_subj) {
		this.lec_subj = lec_subj;
	}
	public long getRead_cnt() {
		return read_cnt;
	}
	public void setRead_cnt(long read_cnt) {
		this.read_cnt = read_cnt;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public String getDlt_flg() {
		return dlt_flg;
	}
	public void setDlt_flg(String dlt_flg) {
		this.dlt_flg = dlt_flg;
	}
	
}
