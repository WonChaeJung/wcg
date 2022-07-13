package com.ytcares.bean;

public class CartAdBean {
	private TCsmtBean addCsmt;//추가 상품 
	private int prchs_cnt;//갯수
	private long total_price;//추가 상품 가격*갯수
	private int cart_ad_no;
	
	public int getCart_ad_no() {
		return cart_ad_no;
	}
	public void setCart_ad_no(int cart_ad_no) {
		this.cart_ad_no = cart_ad_no;
	}
	public TCsmtBean getAddCsmt() {
		return addCsmt;
	}
	public void setAddCsmt(TCsmtBean addCsmt) {
		this.addCsmt = addCsmt;
	}
	public int getPrchs_cnt() {
		return prchs_cnt;
	}
	public void setPrchs_cnt(int prchs_cnt) {
		this.prchs_cnt = prchs_cnt;
	}
	public long getTotal_price(){
		total_price = addCsmt.getCsmt_price()*prchs_cnt;
		return total_price;
	}
}
