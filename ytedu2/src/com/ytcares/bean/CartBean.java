package com.ytcares.bean;

import java.util.List;

public class CartBean extends YTCaresBean{
	private int cart_no;
	private String csmt_id;
	private String csmt_name;
	private int total_count;
	private long total_price;
	private long def_price;
	private int def_count;
	private List<CartOptBean> option_List;
	private List<CartAdBean> addgoods_List;
	private String goods_state;
	
	public int getDef_count() {
		return def_count;
	}
	public void setDef_count(int def_count) {
		this.def_count = def_count;
	}
	public String getGoods_state() {
		return goods_state;
	}
	public void setGoods_state(String goods_state) {
		this.goods_state = goods_state;
	}
	public List<CartAdBean> getAddgoods_List() {
		return addgoods_List;
	}
	public void setAddgoods_List(List<CartAdBean> addgoods_List) {
		this.addgoods_List = addgoods_List;
	}
	public long getDef_price() {
		return def_price;
	}
	public void setDef_price(long def_price) {
		this.def_price = def_price;
	}
	public int getCart_no() {
		return cart_no;
	}
	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
	}
	
	public int getTotal_count() {
		return total_count;
	}
	public void setTotal_count(int total_count) {
		this.total_count=total_count;
	}
	public List<CartOptBean> getOption_List() {
		return option_List;
	}
	public void setOption_List(List<CartOptBean> option_List) {
		this.option_List = option_List;
	}
	public String getCsmt_id() {
		return csmt_id;
	}
	public void setCsmt_id(String csmt_id) {
		this.csmt_id = csmt_id;
	}
	public String getCsmt_name() {
		return csmt_name;
	}
	public void setCsmt_name(String csmt_name) {
		this.csmt_name = csmt_name;
	}
	
	public long getTotal_price() {
		return total_price;
	}
	public void setTotal_price(long total_price) {
		this.total_price = total_price;
		
	}
	
}
