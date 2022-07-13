package com.ytcares.bean;

import java.sql.Timestamp;

public class TLectureReqBean extends YTCaresBean{
	private long lec_req_no;
	private String lec_req_title;
	private String lec_req_desc;
	private String lec_req_id;
	private String lec_req_pass;
	private Timestamp lec_req_date;
	private String dlt_flg;
	
	private String cell_phone;
	private String email;
	private String agency_name;
	
	public String getCell_phone() {
		return cell_phone;
	}
	public void setCell_phone(String cellPhone) {
		cell_phone = cellPhone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAgency_name() {
		return agency_name;
	}
	public void setAgency_name(String agencyName) {
		agency_name = agencyName;
	}
	public long getLec_req_no() {
		return lec_req_no;
	}
	public void setLec_req_no(long lec_req_no) {
		this.lec_req_no = lec_req_no;
	}
	public String getLec_req_title() {
		return lec_req_title;
	}
	public void setLec_req_title(String lec_req_title) {
		this.lec_req_title = lec_req_title;
	}
	public String getLec_req_desc() {
		return lec_req_desc;
	}
	public void setLec_req_desc(String lec_req_desc) {
		this.lec_req_desc = lec_req_desc;
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
	public Timestamp getLec_req_date() {
		return lec_req_date;
	}
	public void setLec_req_date(Timestamp lec_req_date) {
		this.lec_req_date = lec_req_date;
	}
	public String getDlt_flg() {
		return dlt_flg;
	}
	public void setDlt_flg(String dlt_flg) {
		this.dlt_flg = dlt_flg;
	}
	
}
