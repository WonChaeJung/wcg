package com.ytcares.bean;

import java.sql.Timestamp;

public class TLectureAppBean extends YTCaresBean{
	private long lec_seq_no;
	private String user_id;
	private String user_name;
	private String agency_name;
	private String rcmmd_id;
	private String family_id;
	private String cell_phone;
	private String phone;
	private String email;
	private String zipcode;
	private String addr;
	private String grade;
	private String grade_nm;
	private long rn;
	
	public long getRn() {
		return rn;
	}
	public void setRn(long rn) {
		this.rn = rn;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String userName) {
		user_name = userName;
	}
	public String getAgency_name() {
		return agency_name;
	}
	public void setAgency_name(String agencyName) {
		agency_name = agencyName;
	}
	public String getRcmmd_id() {
		return rcmmd_id;
	}
	public void setRcmmd_id(String rcmmdId) {
		rcmmd_id = rcmmdId;
	}
	public String getFamily_id() {
		return family_id;
	}
	public void setFamily_id(String familyId) {
		family_id = familyId;
	}
	public String getCell_phone() {
		return cell_phone;
	}
	public void setCell_phone(String cellPhone) {
		cell_phone = cellPhone;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getGrade_nm() {
		return grade_nm;
	}
	public void setGrade_nm(String gradeNm) {
		grade_nm = gradeNm;
	}
	public String getReg_daet() {
		return reg_daet;
	}
	public void setReg_daet(String regDaet) {
		reg_daet = regDaet;
	}
	private String reg_daet;
	private Timestamp app_date;
	private String app_stat_cd;
	private String rmrks;
	
	public long getLec_seq_no() {
		return lec_seq_no;
	}
	public void setLec_seq_no(long lec_seq_no) {
		this.lec_seq_no = lec_seq_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public Timestamp getApp_date() {
		return app_date;
	}
	public void setApp_date(Timestamp app_date) {
		this.app_date = app_date;
	}
	public String getApp_stat_cd() {
		return app_stat_cd;
	}
	public void setApp_stat_cd(String app_stat_cd) {
		this.app_stat_cd = app_stat_cd;
	}
	public String getRmrks() {
		return rmrks;
	}
	public void setRmrks(String rmrks) {
		this.rmrks = rmrks;
	}
}
