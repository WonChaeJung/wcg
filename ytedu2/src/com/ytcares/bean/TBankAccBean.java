package com.ytcares.bean;

public class TBankAccBean extends YTCaresBean{
	private long seq_no;
	private String bank_nm;
	private String acc_no;
	private String dpstr;
	private String rmrks;
	
	public long getSeq_no() {
		return seq_no;
	}
	public void setSeq_no(long seq_no) {
		this.seq_no = seq_no;
	}
	public String getBank_nm() {
		return bank_nm;
	}
	public void setBank_nm(String bank_nm) {
		this.bank_nm = bank_nm;
	}
	public String getAcc_no() {
		return acc_no;
	}
	public void setAcc_no(String acc_no) {
		this.acc_no = acc_no;
	}
	public String getDpstr() {
		return dpstr;
	}
	public void setDpstr(String dpstr) {
		this.dpstr = dpstr;
	}
	public String getRmrks() {
		return rmrks;
	}
	public void setRmrks(String rmrks) {
		this.rmrks = rmrks;
	}
	
}
