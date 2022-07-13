package com.ytcares.bean;

import java.sql.Timestamp;

public class TUserBean extends YTCaresBean{
	private String user_id;
	private String user_pass;
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
	private Timestamp reg_date;
	private Timestamp logon_dttm;
	private long rn;

	public String getUser_id(){
		return this.user_id;
	}
	public void setUser_id(String user_id){
		this.user_id = user_id;
	}
	
	public String getUser_pass(){
		return this.user_pass;
	}
	public void setUser_pass(String user_pass){
		this.user_pass = user_pass;
	}
	
	public String getUser_name(){
		return this.user_name;
	}
	public void setUser_name(String user_name){
		this.user_name = user_name;
	}
	
	public String getAgency_name(){
		return this.agency_name;
	}
	public void setAgency_name(String agency_name){
		this.agency_name = agency_name;
	}
	
	public String getRcmmd_id(){
		return this.rcmmd_id;
	}
	public void setRcmmd_id(String rcmmd_id){
		this.rcmmd_id = rcmmd_id;
	}
	
	public String getFamily_id(){
		return this.family_id;
	}
	public void setFamily_id(String family_id){
		this.family_id = family_id;
	}
	
	public String getCell_phone(){
		return this.cell_phone;
	}
	public void setCell_phone(String cell_phone){
		this.cell_phone = cell_phone;
	}
	
	public String getPhone(){
		return this.phone;
	}
	public void setPhone(String phone){
		this.phone = phone;
	}
	
	public String getEmail(){
		return this.email;
	}
	public void setEmail(String email){
		this.email = email;
	}
	
	public String getZipcode(){
		return this.zipcode;
	}
	public void setZipcode(String zipcode){
		this.zipcode = zipcode;
	}
	
	public String getAddr(){
		return this.addr;
	}
	public void setAddr(String addr){
		this.addr = addr;
	}
	
	public String getGrade(){
		return this.grade;
	}
	public void setGrade(String grade){
		this.grade = grade;
	}
	
	public Timestamp getReg_date(){
		return this.reg_date;
	}
	public void setReg_date(Timestamp reg_date){
		this.reg_date = reg_date;
	}
	public long getRn() {
		return rn;
	}
	public void setRn(long rn) {
		this.rn = rn;
	}
	public Timestamp getLogon_dttm() {
		return logon_dttm;
	}
	public void setLogon_dttm(Timestamp logon_dttm) {
		this.logon_dttm = logon_dttm;
	}
	
	@Override
	public boolean equals(Object obj) {
		if (obj == null) return false;
		if (!(obj instanceof TUserBean)) return false;
		
		TUserBean bean = (TUserBean)obj;
		if (this == obj) {
			return true;
		} else {
			if (this.user_id != null && this.user_id.equals(bean.getUser_id())) {
				return true;
			}
		}
		return false;
	}
	
	@Override
	public int hashCode() {
		return this.user_id.hashCode();
	}
}
