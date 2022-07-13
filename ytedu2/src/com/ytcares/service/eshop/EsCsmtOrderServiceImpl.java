package com.ytcares.service.eshop;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ytcares.bean.CartAdBean;
import com.ytcares.bean.CartBean;
import com.ytcares.bean.CartOptBean;
import com.ytcares.bean.TCodeBean;
import com.ytcares.bean.TCsmtBean;
import com.ytcares.bean.TUserBean;
import com.ytcares.biz.CsmtBuyBiz;
import com.ytcares.common.YTCaresConstants.Common;
import com.ytcares.common.YTCaresException;
import com.ytcares.dao.TCodeDAO;
import com.ytcares.dao.TCsmtDAO;
import com.ytcares.service.YTCaresService;


@Controller
public class EsCsmtOrderServiceImpl extends YTCaresService {
	
	Logger logger = Logger.getLogger(EsCsmtOrderServiceImpl.class);
	@Autowired
	private CsmtBuyBiz cbb;
	
	@Autowired
	TCodeDAO tCodeDAO;
	
	@Autowired
	TCsmtDAO tCsmtDAO;
	
	@RequestMapping(value={"/EsCsmtOrderService/selectedShopCart.do"} , method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView selectedShopCart(HttpSession session, HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		int wherePrchs=0;
		TUserBean tub = (TUserBean)session.getAttribute(Common.session_user_bean);
		if(tub == null){
			mav.setViewName("/common/cmUserLogin");
			return mav;
		}
		else{
			List<CartBean> cb = new ArrayList<CartBean>();
			if(request.getParameter("wherePrchs")!=null)
				wherePrchs = Integer.parseInt(request.getParameter("wherePrchs"));
			if(wherePrchs == 1)
				cb = (List<CartBean>)session.getAttribute("cartBeanOrder");
			else
				cb = (List<CartBean>)session.getAttribute("cartBeanList");
			List<CartBean> buy_cb = new ArrayList<CartBean>();
			String[] getCartNo = null;
			if(request.getParameterValues("cart_check")!=null){
				
				getCartNo = request.getParameterValues("cart_check");
			
				for(int i=0;i<cb.size();i++){
					for(int j=0;j<getCartNo.length;j++){
						if(cb.get(i).getCart_no()==Integer.parseInt(getCartNo[j])){
							buy_cb.add(cb.get(i));
						}
					}
				}
			}else{
				
				buy_cb = cb;
			}
			mav.addObject("userInfo",tub);
			mav.addObject("buyCart", buy_cb);
			mav.setViewName("/eshop/esCsmtOrderC");
			return mav;
		}
	}
	
	@RequestMapping(value={"/EsCsmtOrderService/callShopCart.do"}, method={RequestMethod.GET, RequestMethod.POST})
	public void callShopCart(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		//ModelAndView mav = new ModelAndView();
		List<CartBean> cartBeanList = new LinkedList<CartBean>();
		if(session.getAttribute("cartBeanList")!=null){
			cartBeanList = (List<CartBean>)session.getAttribute("cartBeanList");
		}
			
		long total_price=0;//(기본 가격+옵션 가격)*구매개수
		String csmt_id = request.getParameter("csmt_id");
		String csmt_name = request.getParameter("csmt_name");
		long csmt_def_price=Integer.parseInt(request.getParameter("csmt_def_price"));
		//각 옵션별 구매 카운트 분류하기 위한 카운트 배열 얻어오는 부분
		String[] prchsCount = request.getParameterValues("prchsCount");
		int[] parseCount = new int[prchsCount.length];
		for(int i=0;i<prchsCount.length;i++){
			parseCount[i] = Integer.parseInt(prchsCount[i]);
		}
		
		String[] prchsVal = request.getParameterValues("prchsVal");//dcode리스트
		
		//옵션이 없는 경우
		if(request.getParameterValues("mCodeOpt")==null){
			CartBean cb = new CartBean();
			int cart_no=1;
			if(cartBeanList.size()>0){
				for(int i=0;i<cartBeanList.size();i++){
					cart_no++;
				}
				cb.setCart_no(cart_no);
			}else{
				cb.setCart_no(1);
			}
			
			cb.setCsmt_id(csmt_id);
			cb.setCsmt_name(csmt_name);
			cb.setDef_count(parseCount[0]);
			cb.setDef_price(csmt_def_price);
			cb.setOption_List(null);
			
			if(request.getParameterValues("prchsAddVal")!=null&&
					request.getParameterValues("prchsAddCount")!=null){//추가 상품이 있을 경우
				int prchsADC=0;
				String[] prchsAddVal = request.getParameterValues("prchsAddVal");
				String[] prchsAddCountStr = request.getParameterValues("prchsAddCount");
				int[] prchsAddCount = new int[prchsAddCountStr.length];
				List<CartAdBean>addgoods_List = new ArrayList<CartAdBean>();
				for(int i=0;i<prchsAddCountStr.length;i++){
					prchsAddCount[i] = Integer.parseInt(prchsAddCountStr[i]);
					prchsADC+=prchsAddCount[i];
					TCsmtBean addGoodsBean = new TCsmtBean();
					try {
						addGoodsBean = tCsmtDAO.selectCsmtInfo(prchsAddVal[i]);
					} catch (YTCaresException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					CartAdBean cab = new CartAdBean();
					cab.setAddCsmt(addGoodsBean);
					cab.setPrchs_cnt(prchsAddCount[i]);
					total_price+=cab.getTotal_price();
					addgoods_List.add(cab);
				}
				cb.setAddgoods_List(addgoods_List);
				total_price += csmt_def_price*parseCount[0];
				cb.setTotal_price(total_price);
				cb.setTotal_count(parseCount[0]+prchsADC);
				cb.setGoods_state("AD");
			}
			else{
				cb.setAddgoods_List(null);
				total_price += csmt_def_price*parseCount[0];
				cb.setTotal_price(total_price);
				cb.setTotal_count(parseCount[0]);
				cb.setGoods_state("DEF");
			}
			
			cartBeanList.add(cb);
		}
		//옵션이 있는 경우
		else if(request.getParameterValues("mCodeOpt")!=null){
			String[] mCodeOpt = request.getParameterValues("mCodeOpt");
			int dcodeOptindex = 0;//상세코드는 전체 내임배열에 삽입되어 있으므로 전체 옵션 갯수에 해당하는 마스터 코드가 한번 돌때마다 가져온다 만일 옵션이 두개라면 마스터코드는 두번 돌지만 상세코드는 다음 옵션까지 인덱스 이동
			int total_cnt=0;
			List<CartOptBean> cartOptList = new ArrayList<CartOptBean>();
			int opt_seq_no=1;
			for(int i=0;i<parseCount.length;i++){
				Map<String, String> codeSet = new HashMap<String, String>();
				List<TCodeBean> tCodeList = new LinkedList<TCodeBean>();
				for(int j=0;j<mCodeOpt.length;j++){
					codeSet.put("mcode", mCodeOpt[j]);
					codeSet.put("dcode", prchsVal[dcodeOptindex++]);
					try {
						tCodeList.add(tCodeDAO.getCode(codeSet));
					} catch (YTCaresException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}//하나의 상품에 대한 옵션 코드를 가져와서 저장
				CartOptBean cartOpt = new CartOptBean();
				cartOpt.setCart_opt_no(opt_seq_no++);
				cartOpt.setOpt_cnt(parseCount[i]);
				cartOpt.setOption_prop(tCodeList);
				cartOpt.setTotal_price(csmt_def_price, "def");
				cartOptList.add(cartOpt);
				total_cnt+=parseCount[i];
			}
			CartBean cb = new CartBean();
			int cart_no=1;
			if(cartBeanList.size()>0){
				for(int i=0;i<cartBeanList.size();i++){
					cart_no++;
				}
				cb.setCart_no(cart_no);
			}else{
				cb.setCart_no(1);
			}
			cb.setDef_price(csmt_def_price);
			cb.setCsmt_id(csmt_id);
			cb.setCsmt_name(csmt_name);
			cb.setOption_List(cartOptList);
			
			for(int i=0;i<cartOptList.size();i++){
				total_price += cartOptList.get(i).getTotal_price();//옵션 조합의 가격에 대한 덧셈
			}
			//total_price = total_price*total_cnt;
			int prchsADC=0;
			if(request.getParameterValues("prchsAddVal")!=null&&
					request.getParameterValues("prchsAddCount")!=null){//추가 상품이 있을 경우
				String[] prchsAddVal = request.getParameterValues("prchsAddVal");
				String[] prchsAddCountStr = request.getParameterValues("prchsAddCount");
				int[] prchsAddCount = new int[prchsAddCountStr.length];
				List<CartAdBean>addgoods_List = new ArrayList<CartAdBean>();
				int ad_seq_no=1;
				for(int i=0;i<prchsAddCountStr.length;i++){
					prchsAddCount[i] = Integer.parseInt(prchsAddCountStr[i]);
					prchsADC+=prchsAddCount[i];
					
					TCsmtBean addGoodsBean = new TCsmtBean();
					try {
						addGoodsBean = tCsmtDAO.selectCsmtInfo(prchsAddVal[i]);
					} catch (YTCaresException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					CartAdBean cab = new CartAdBean();
					cab.setCart_ad_no(ad_seq_no++);
					cab.setAddCsmt(addGoodsBean);
					cab.setPrchs_cnt(prchsAddCount[i]);
					total_price+=cab.getTotal_price();
					addgoods_List.add(cab);
				}
				cb.setAddgoods_List(addgoods_List);
				cb.setTotal_count(total_cnt+prchsADC);
				cb.setGoods_state("OA");
				cb.setTotal_price(total_price);
			}else{
				cb.setAddgoods_List(null);
				cb.setTotal_count(total_cnt);
				cb.setGoods_state("OP");
				cb.setTotal_price(total_price);
			}
			
			cartBeanList.add(cb);
		}
		int wherePrchs = Integer.parseInt(request.getParameter("wherePrchs"));
		
		if(wherePrchs == 2){
			session.setAttribute("cartBeanList", cartBeanList);
			try {
				response.sendRedirect("/EsCsmtService/selectCsmtInfo.do?csmt_id="+csmt_id+"&cartAdded=true");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(wherePrchs == 1){
			if(session.getAttribute("cartBeanOrder")!=null)
				session.removeAttribute("cartBeanOrder");
			
			session.setAttribute("cartBeanOrder", cartBeanList);
			try{
				response.sendRedirect("/EsCsmtOrderService/selectedShopCart.do?wherePrchs=1");
			} catch(IOException e){
				e.printStackTrace();
			}
		}
	}
	
	@RequestMapping(value={"/EsCsmtOrderService/callCartOptCng.do"}, method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView callCartOptCng(HttpSession session, HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/eshop/esShopCartOpt");
		List<CartBean> cartBeanList = new LinkedList<CartBean>();
		if(session.getAttribute("cartBeanList")!=null){
			cartBeanList = (List<CartBean>)session.getAttribute("cartBeanList");
		}
		if(request.getParameter("cart_no")!=null){
			
			int cart_no = Integer.parseInt(request.getParameter("cart_no"));
			
			CartBean cb = cartBeanList.get(cart_no-1);
			long total_price=0;
			int total_cnt=0;
			
			if("DEF".equals(cb.getGoods_state())||"AD".equals(cb.getGoods_state())){
				String prchsCount = request.getParameter("prchsCount");
				String optTotal = request.getParameter("optTotal");
				long defTotal = Long.parseLong(optTotal);
				int defCount = Integer.parseInt(prchsCount);
				cb.setDef_count(defCount);
				total_cnt+= defCount;
				total_price+= defTotal;
			}
			else{
				if(request.getParameterValues("cart_opt_no")!=null){
					String[] cart_opt_no = request.getParameterValues("cart_opt_no");
					String[] prchsCount = request.getParameterValues("prchsCount");
					String[] optTotal = request.getParameterValues("optTotal");
					for(int i=0;i<cart_opt_no.length;i++){
						cb.getOption_List().get(i).setOpt_cnt(Integer.parseInt(prchsCount[i]));
						cb.getOption_List().get(i).setTotal_price(Long.parseLong(optTotal[i]), "nodef");
						total_cnt+=cb.getOption_List().get(i).getOpt_cnt();
						total_price+=cb.getOption_List().get(i).getTotal_price();
					}
				}
				
			}
			if(request.getParameterValues("cart_ad_no")!=null){
				String[] cart_ad_no = request.getParameterValues("cart_ad_no");
				String[] prchsAddCount = request.getParameterValues("prchsAddCount");
				for(int i=0;i<cart_ad_no.length;i++){
					cb.getAddgoods_List().get(i).setPrchs_cnt(Integer.parseInt(prchsAddCount[i]));
					total_cnt+=cb.getAddgoods_List().get(i).getPrchs_cnt();
					total_price+=cb.getAddgoods_List().get(i).getTotal_price();
				}
				
			}
			cb.setTotal_count(total_cnt);
			cb.setTotal_price(total_price);
			cartBeanList.set(cart_no-1, cb);
			session.setAttribute("cartBeanList", cartBeanList);
		}
		mav.addObject("changed", "true");
		
		return mav;
	}
	@RequestMapping(value={"/EsCsmtOrderService/callCartOpt.do"}, method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView callCartOpt(HttpSession session, HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/eshop/esShopCartOpt");
		int cart_no=0;
		if(request.getParameter("call_cart_no")!=null);
			cart_no = Integer.parseInt(request.getParameter("call_cart_no"));
		List<CartBean> cbl = (List<CartBean>)session.getAttribute("cartBeanList");
		CartBean cb = cbl.get(cart_no-1);
		mav.addObject("itemInfo",cb);
		return mav;
	}
	@RequestMapping(value={"/EsCsmtOrderService/callCartCsmtDel.do"}, method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView callCartCsmtDel(HttpSession session, HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		if(request.getParameter("cart_no")!=null){
			int cart_no = Integer.parseInt(request.getParameter("cart_no"));
			
			List<CartBean> cbl = (List<CartBean>)session.getAttribute("cartBeanList");
			for(int i=0;i<cbl.size();i++){
				if(cbl.get(i).getCart_no() == cart_no){
					cbl.remove(i);
					break;
				}
			}
			int initCartno=1;
			for(int i=0;i<cbl.size();i++){
				cbl.get(i).setCart_no(initCartno++);//장바구니에 있는 장바구니 번호 초기화
			}
		}
		mav.setViewName("/eshop/esShopCart");
		return mav;
	}
	@RequestMapping(value={"/EsCsmtOrderService/callCsmtCart.do"}, method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView callCsmtCart(HttpServletRequest request, HttpServletResponse response){
		return new ModelAndView("/eshop/esShopCart");
	}
	@RequestMapping(value={"/EsCsmtOrderService/userCallCsmtOrder.do"}, method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView userCallCsmtOrder(HttpSession session, HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		String[] cart_no=null;
		int wherePrchs = 0;
		
		if(request.getParameter("wherePrchs")!=null)
			wherePrchs = Integer.parseInt(request.getParameter("wherePrchs"));
		
		List<CartBean> cartbeanList = (List<CartBean>)session.getAttribute("cartBeanList");
		List<CartBean> buyCartList = new ArrayList<CartBean>();
		Iterator<CartBean> it = cartbeanList.iterator();
		
		if(wherePrchs == 1){
			for(int k=0;k<cartbeanList.size();k++){
				while(it.hasNext()){
					CartBean cb = it.next();
					buyCartList.add(cb);
				}
			}
		}else{
			cart_no = request.getParameterValues("cart_no");
			
			for(int k=0;k<cart_no.length;k++){
				while(it.hasNext()){
					CartBean cb = it.next();
					if(cb.getCart_no() == Integer.parseInt(cart_no[k])){
						buyCartList.add(cb);
						break;
					}
				}
			}
		}
		
		//상품재고 체크를 위한 맵(상품아이디, 상품개수)
		//같은 상품에 대하여 여러번 구매를 하였을 경우 기존의 로직으로는 마이너스 재고가 되 버림
		//같은 상품에 대하여는 개수를 더해서 체크해야 함
		Map<String, Integer> csmtChkMap = new HashMap<String, Integer>();
		
		for(int i = 0; i < buyCartList.size(); i++){
			CartBean cart	= buyCartList.get(i);
			String csmt_id	= cart.getCsmt_id();
			String stat		= cart.getGoods_state();
			int total_cnt	= 0;
			if ("OP".equals(stat) || "OA".equals(stat)) {
				for(int j = 0;j < cart.getOption_List().size(); j++){
					total_cnt += cart.getOption_List().get(j).getOpt_cnt();
				}
			} else {
				total_cnt	= cart.getDef_count();
			}
			if (csmtChkMap.containsKey(csmt_id)) {
				//상품아이디가 이미 존재하는 경우는 기존 수량에 플러스
				csmtChkMap.put(csmt_id, csmtChkMap.get(csmt_id) + total_cnt);
			} else {
				csmtChkMap.put(csmt_id, total_cnt);
			}
			
			//추가 상품에 대해서도 동일하게 개수를 합산
			if(cart.getAddgoods_List() != null) {
				for(int j = 0; j < cart.getAddgoods_List().size(); j++){
					String ad_csmt_id	= cart.getAddgoods_List().get(j).getAddCsmt().getCsmt_id();
					int ad_csmt_cnt	= cart.getAddgoods_List().get(j).getPrchs_cnt();
					if (csmtChkMap.containsKey(ad_csmt_id)) {
						//추가상품아이디가 이미 존재하는 경우는 기존 수량에 플러스
						csmtChkMap.put(ad_csmt_id, csmtChkMap.get(ad_csmt_id) + ad_csmt_cnt);
					} else {
						csmtChkMap.put(ad_csmt_id, ad_csmt_cnt);
					}
				}
			}
		}
		
		String[] csmt_ids = new String[csmtChkMap.size()];
		int idx = 0;
		for (Iterator<String> iter = csmtChkMap.keySet().iterator();iter.hasNext(); idx++) {
			csmt_ids[idx] = iter.next();
		}
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("csmt_ids", csmt_ids);
		//구매한 상품, 추가 상품에 대하여 한번에 셀렐트
		List<TCsmtBean> csmtInfoList = tCsmtDAO.selectCsmtInfos(param);
		
		if (csmtInfoList != null) {
			for (int i = 0; i < csmtInfoList.size(); i++) {
				String csmt_id = csmtInfoList.get(i).getCsmt_id();
				int csmt_stock = (int)csmtInfoList.get(i).getCsmt_stock();
				
				int prchs_cnt = csmtChkMap.get(csmt_id);
				if (csmt_stock < prchs_cnt) {
					saveMessage("error.not.enough.goods");
					return callCsmtCart(request, response);
				}
			}
		}

		try {
			cbb.CsmtBuy(session, request, response);
			//mav.setViewName("/eshop/esCsmtOrderCompl");
			saveMessage("");
		} catch (YTCaresException e) {
			saveMessage(e);
		}
		return callCsmtCart(request, response);
	}
}
