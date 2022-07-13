package com.ytcares.bean;

import java.util.List;

public class CartOptBean extends YTCaresBean{
	private List<TCodeBean> option_prop;//선택한 옵션들에 대한 리스트
	private int opt_cnt;//선택한 옵션들의 결과조합에 대한 총 갯수
	private long total_price;//선택한 옵션들에 가격이 있는 경우 가격들을 더한 값*결과 조합에 대한 총 갯수
	private int cart_opt_no;
	private long def_opt_price;
	
	public int getCart_opt_no() {
		return cart_opt_no;
	}
	public void setCart_opt_no(int cart_opt_no) {
		this.cart_opt_no = cart_opt_no;
	}
	public List<TCodeBean> getOption_prop() {
		return option_prop;
	}
	public void setOption_prop(List<TCodeBean> option_prop) {
		this.option_prop = option_prop;
	}
	public int getOpt_cnt() {
		return opt_cnt;
	}
	public void setOpt_cnt(int opt_cnt) {
		this.opt_cnt = opt_cnt;
	}
	public void setTotal_price(long def_price, String inputType){
		if("def".equals(inputType)){//처음 장바구니에 담을 때 기본가격과 더하기 위한 조건
			for(int i=0;i<option_prop.size();i++){
				if(option_prop.get(i).getCode_nm2()!=null)//옵션에 가격이 있는 경우 상품의 기본 가격과 더함
					def_price+=Long.parseLong(option_prop.get(i).getCode_nm2());
			}
			def_opt_price = def_price;//기본가격+옵션가격
			total_price=def_price*opt_cnt;//옵션가격+상품 기본 가격*갯수
		}
		else total_price=def_price;
		
	}
	public long getTotal_price(){
		return total_price;
	}
	public long getDef_opt_price(){
		return this.def_opt_price;
	}
}
