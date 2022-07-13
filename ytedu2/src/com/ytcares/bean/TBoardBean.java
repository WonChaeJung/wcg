package com.ytcares.bean;

import java.sql.Timestamp;

public class TBoardBean extends YTCaresBean{
	private long seq_no;
	private String category;
	private String sub_category;
	private String title;
	private String content;
	private String appnd_data1;
	private String appnd_data2;
	private String appnd_data3;
	private String reg_id;
	private String reg_pass;
	private Timestamp reg_date;
	private long read_cnt;
	private long ref_no;
	private String ref_user_id;
	private long re_step;
	private long re_level;
	
	public long getSeq_no() {
		return seq_no;
	}
	public void setSeq_no(long seq_no) {
		this.seq_no = seq_no;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getSub_category() {
		return sub_category;
	}
	public void setSub_category(String sub_category) {
		this.sub_category = sub_category;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAppnd_data1() {
		return appnd_data1;
	}
	public void setAppnd_data1(String appnd_data1) {
		this.appnd_data1 = appnd_data1;
	}
	public String getAppnd_data2() {
		return appnd_data2;
	}
	public void setAppnd_data2(String appnd_data2) {
		this.appnd_data2 = appnd_data2;
	}
	public String getAppnd_data3() {
		return appnd_data3;
	}
	public void setAppnd_data3(String appnd_data3) {
		this.appnd_data3 = appnd_data3;
	}
	public String getReg_id() {
		return reg_id;
	}
	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}
	public String getReg_pass() {
		return reg_pass;
	}
	public void setReg_pass(String reg_pass) {
		this.reg_pass = reg_pass;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public long getRead_cnt() {
		return read_cnt;
	}
	public void setRead_cnt(long read_cnt) {
		this.read_cnt = read_cnt;
	}
	public long getRef_no() {
		return ref_no;
	}
	public void setRef_no(long ref_no) {
		this.ref_no = ref_no;
	}
	public String getRef_user_id() {
		return ref_user_id;
	}
	public void setRef_user_id(String refUserId) {
		ref_user_id = refUserId;
	}
	public long getRe_step() {
		return re_step;
	}
	public void setRe_step(long re_step) {
		this.re_step = re_step;
	}
	public long getRe_level() {
		return re_level;
	}
	public void setRe_level(long re_level) {
		this.re_level = re_level;
	}
	
}
