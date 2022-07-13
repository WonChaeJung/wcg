package com.ytcares.biz;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.ytcares.bean.CartBean;
import com.ytcares.bean.TCodeBean;
import com.ytcares.bean.TCsmtBean;
import com.ytcares.bean.TCsmtOptBean;
import com.ytcares.bean.TMcodeBean;
import com.ytcares.bean.TPrchsBean;
import com.ytcares.bean.TPrchsDetBean;
import com.ytcares.bean.TPrchsOptBean;
import com.ytcares.common.YTCaresException;
import com.ytcares.dao.TCodeDAO;
import com.ytcares.dao.TCsmtDAO;
import com.ytcares.dao.TCsmtOptDAO;
import com.ytcares.dao.TMcodeDAO;
import com.ytcares.dao.TPrchsDAO;
import com.ytcares.dao.TPrchsDetDAO;
import com.ytcares.dao.TPrchsOptDAO;

@Component
public class CsmtBuyBiz {
	
	@Autowired
	private TPrchsDAO tPrchsDAO;
	
	@Autowired
	private TPrchsDetDAO tPrchsDetDAO;
	
	@Autowired
	private TPrchsOptDAO tPrchsOptDAO;
	
	@Autowired
	private TCsmtDAO tCsmtDAO;
	@Autowired
	private TCsmtOptDAO tCsmtOptDAO;
	@Autowired
	private TMcodeDAO tMcodeDAO;
	@Autowired
	private TCodeDAO tCodeDAO;
	public void CsmtBuy(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws YTCaresException {
		if(request.getParameter("prchs_user_id")==null){
			
		}else{
			String prchs_user_id = request.getParameter("prchs_user_id");
			
			String dlvr_name = request.getParameter("dlvr_name");
			String dlvr_phone = request.getParameter("dlvr_phone");
			String dlvr_addr = request.getParameter("dlvr_addr");
			String pay_acc = request.getParameter("pay_acc");
			
			String[] cart_no = request.getParameterValues("cart_no");
			List<CartBean> cartbeanList = (List<CartBean>)session.getAttribute("cartBeanList");
			List<CartBean> buyCartList = new ArrayList<CartBean>();
			Iterator<CartBean> it = cartbeanList.iterator();
			
			for(int k=0;k<cart_no.length;k++){
				while(it.hasNext()){
					CartBean cb = it.next();
					if(cb.getCart_no() == Integer.parseInt(cart_no[k])){
						buyCartList.add(cb);
						break;
					}
				}
			}
			
			for(int i=0;i<buyCartList.size();i++){
				TPrchsBean tPrchs = new TPrchsBean();
				
				tPrchs.setPrchs_seq_no(buyCartList.get(i).getCsmt_id().trim());
				tPrchs.setPrchs_user_id(prchs_user_id);
				tPrchs.setPrchs_date(null);
				tPrchs.setPrchs_stat_cd("1");
				tPrchs.setPrchs_price(buyCartList.get(i).getTotal_price());
				tPrchs.setPay_acc(pay_acc);
				tPrchs.setDlvr_name(dlvr_name);
				tPrchs.setDlvr_phone(dlvr_phone);
				tPrchs.setDlvr_addr(dlvr_addr);
				tPrchs.setDlvr_date(null);
				tPrchs.setDlvr_comp_date(null);
				tPrchs.setPrchs_comp_date(null);
				tPrchs.setPrchs_cncl_date(null);
				tPrchs.setRmrks(null);
				tPrchs.setDlt_flg("0");
				tPrchs.setPrchs_cnt(buyCartList.get(i).getTotal_count());
				insertPrchsInfo(tPrchs);
				
				
				if("AD".equals(buyCartList.get(i).getGoods_state())){//기본 상품에 추가 상품이 있는 경우
					int grpCode=1;
					for(int j=0;j<buyCartList.get(i).getAddgoods_List().size();j++){
						TPrchsDetBean tPrchsDet = new TPrchsDetBean();
						
						tPrchsDet.setPrchs_seq_no(buyCartList.get(i).getCsmt_id());
						tPrchsDet.setPrchs_grp_no(grpCode);
						tPrchsDet.setPrchs_grp_cd("A");
						
						tPrchsDet.setCsmt_id(buyCartList.get(i).getAddgoods_List().get(j).getAddCsmt().getCsmt_id());
						tPrchsDet.setCsmt_cnt(buyCartList.get(i).getAddgoods_List().get(j).getPrchs_cnt());
						tPrchsDet.setTtl_price(buyCartList.get(i).getAddgoods_List().get(j).getTotal_price());
						tPrchsDet.setPrchs_grp_desc(buyCartList.get(i).getAddgoods_List().get(j).getAddCsmt().getCsmt_name());
						insertPrchsDetInfo(tPrchsDet);
						grpCode++;
						
						updateCsmtCnt(tPrchsDet.getCsmt_id(), tPrchsDet.getCsmt_cnt());
					}
					
					updateCsmtCnt(buyCartList.get(i).getCsmt_id(), buyCartList.get(i).getDef_count());
				}
				else if("OP".equals(buyCartList.get(i).getGoods_state())){//기본 상품에 옵션이 있는 경우
					for(int j=0;j<buyCartList.get(i).getOption_List().size();j++){
						TPrchsDetBean tPrchsDet = new TPrchsDetBean();
						int grpCode=1;
						tPrchsDet.setPrchs_seq_no(buyCartList.get(i).getCsmt_id());
						tPrchsDet.setPrchs_grp_no(grpCode);
						tPrchsDet.setPrchs_grp_cd("O");
						tPrchsDet.setCsmt_id(buyCartList.get(i).getCsmt_id());
						tPrchsDet.setCsmt_cnt(buyCartList.get(i).getOption_List().get(j).getOpt_cnt());
						tPrchsDet.setTtl_price(buyCartList.get(i).getOption_List().get(j).getTotal_price());
						String detOption="";
						for(int k=0;k<buyCartList.get(i).getOption_List().get(j).getOption_prop().size();k++){
							TPrchsOptBean tPrchsOpt = new TPrchsOptBean();
							tPrchsOpt.setPrchs_seq_no(buyCartList.get(i).getCsmt_id());
							tPrchsOpt.setPrchs_grp_no(grpCode);
							tPrchsOpt.setPrchs_opt_mcd(buyCartList.get(i).getOption_List().get(j).getOption_prop().get(k).getMcode_cd());//장바구니안의 코드 리스트의 인덱스를 돌며 마스터 코드 정보 삽입
							tPrchsOpt.setPrchs_opt_dcd(buyCartList.get(i).getOption_List().get(j).getOption_prop().get(k).getDcode_cd());//장바구니안의 코드 리스트의 인덱스를 돌며 상세 코드 정보 삽입
							detOption+=buyCartList.get(i).getOption_List().get(j).getOption_prop().get(k).getCode_nm1()+" ";
							insertPrchsOptInfo(tPrchsOpt);
						}
						tPrchsDet.setPrchs_grp_desc(detOption);
						detOption="";
						insertPrchsDetInfo(tPrchsDet);
						grpCode++;
						
						updateCsmtCnt(tPrchsDet.getCsmt_id(), tPrchsDet.getCsmt_cnt());
					}
					
				}
				
				else if("OA".equals(buyCartList.get(i).getGoods_state())){//기본 상품에 옵션과 추가 상품이 있는 경우
					int grpCode=1;
					String detOption="";
					for(int j=0;j<buyCartList.get(i).getOption_List().size();j++){
						TPrchsDetBean tPrchsDet = new TPrchsDetBean();
						
						tPrchsDet.setPrchs_seq_no(buyCartList.get(i).getCsmt_id());
						tPrchsDet.setPrchs_grp_no(grpCode);
						tPrchsDet.setPrchs_grp_cd("O");
						tPrchsDet.setCsmt_id(buyCartList.get(i).getCsmt_id());
						tPrchsDet.setCsmt_cnt(buyCartList.get(i).getOption_List().get(j).getOpt_cnt());
						tPrchsDet.setTtl_price(buyCartList.get(i).getOption_List().get(j).getTotal_price());
						
						for(int k=0;k<buyCartList.get(i).getOption_List().get(j).getOption_prop().size();k++){
							TPrchsOptBean tPrchsOpt = new TPrchsOptBean();
							tPrchsOpt.setPrchs_seq_no(buyCartList.get(i).getCsmt_id());
							tPrchsOpt.setPrchs_grp_no(grpCode);
							tPrchsOpt.setPrchs_opt_mcd(buyCartList.get(i).getOption_List().get(j).getOption_prop().get(k).getMcode_cd());//장바구니안의 코드 리스트의 인덱스를 돌며 마스터 코드 정보 삽입
							tPrchsOpt.setPrchs_opt_dcd(buyCartList.get(i).getOption_List().get(j).getOption_prop().get(k).getDcode_cd());//장바구니안의 코드 리스트의 인덱스를 돌며 상세 코드 정보 삽입
							detOption+=buyCartList.get(i).getOption_List().get(j).getOption_prop().get(k).getCode_nm1()+" ";
							insertPrchsOptInfo(tPrchsOpt);
						}
						tPrchsDet.setPrchs_grp_desc(detOption);
						detOption="";
						insertPrchsDetInfo(tPrchsDet);
						grpCode++;
						
						updateCsmtCnt(tPrchsDet.getCsmt_id(), tPrchsDet.getCsmt_cnt());
					}
					for(int j=0;j<buyCartList.get(i).getAddgoods_List().size();j++){
						TPrchsDetBean tPrchsDet = new TPrchsDetBean();
						
						tPrchsDet.setPrchs_seq_no(buyCartList.get(i).getCsmt_id());
						tPrchsDet.setPrchs_grp_no(grpCode);
						tPrchsDet.setPrchs_grp_cd("A");
						tPrchsDet.setCsmt_id(buyCartList.get(i).getAddgoods_List().get(j).getAddCsmt().getCsmt_id());
						tPrchsDet.setCsmt_cnt(buyCartList.get(i).getAddgoods_List().get(j).getPrchs_cnt());
						tPrchsDet.setTtl_price(buyCartList.get(i).getAddgoods_List().get(j).getTotal_price());
						tPrchsDet.setPrchs_grp_desc(buyCartList.get(i).getAddgoods_List().get(j).getAddCsmt().getCsmt_name());
						insertPrchsDetInfo(tPrchsDet);
						grpCode++;
						
						updateCsmtCnt(tPrchsDet.getCsmt_id(), tPrchsDet.getCsmt_cnt());
					}
				}
				else{
					updateCsmtCnt(buyCartList.get(i).getCsmt_id(), buyCartList.get(i).getDef_count());
				}
				cartbeanList.remove(buyCartList.get(i));
				
			}
			int initCartno=1;
			for(int i=0;i<cartbeanList.size();i++){
				cartbeanList.get(i).setCart_no(initCartno++);//장바구니에 있는 장바구니 번호 초기화
			}
			
			session.setAttribute("cartBeanList", cartbeanList);
		}
	}
	
	private void insertPrchsInfo(TPrchsBean tPrchs){
		try {
			tPrchsDAO.insertPrchsInfo(tPrchs);
		} catch (YTCaresException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private void updateCsmtCnt(String csmt_id, int csmt_stock) throws YTCaresException {
		Map<String, Object> hm = new HashMap<String,Object>();
		hm.put("csmt_id", csmt_id);
		hm.put("csmt_stock", csmt_stock);
		int result = tCsmtDAO.updateCsmtStock(hm);
		if (result == 0) throw new YTCaresException("error.not.enough.goods");
	}
	
	private void insertPrchsDetInfo(TPrchsDetBean tPrchsDet){
		try {
			tPrchsDetDAO.insertPrchsDetInfo(tPrchsDet);
		} catch (YTCaresException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}
	
	private void insertPrchsOptInfo(TPrchsOptBean tPrchsOpt){
		try {
			tPrchsOptDAO.insertPrchsOptInfo(tPrchsOpt);
		} catch (YTCaresException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void insertCsmtInfo (MultipartRequest multipart) throws YTCaresException {
		
		if(multipart!=null) {
			String csmt_kind_cd = multipart.getParameter("csmt_kind_cd");
			String csmt_name = multipart.getParameter("csmt_name");
			String[] csmt_option = multipart.getParameterValues("csmt_option");
			String csmt_price = multipart.getParameter("csmt_price");
			String csmt_stock = multipart.getParameter("csmt_stock");
			String csmt_img = multipart.getFilesystemName("csmt_img");
			String csmt_desc = multipart.getParameter("csmt_desc");
			String pub_comp = multipart.getParameter("pub_comp");
			String pub_date = multipart.getParameter("pub_date");
			String pay_desc = multipart.getParameter("pay_desc");
			
			TCsmtBean tCsmtBean = new TCsmtBean();
			
			tCsmtBean.setCsmt_kind_cd(csmt_kind_cd);
			tCsmtBean.setCsmt_name(csmt_name);
			tCsmtBean.setCsmt_price(Long.parseLong(csmt_price));
			tCsmtBean.setCsmt_stock(Integer.parseInt(csmt_stock));
			tCsmtBean.setCsmt_img(csmt_img);
			tCsmtBean.setCsmt_desc(csmt_desc);
			tCsmtBean.setCsmt_desc_img1(null);
			tCsmtBean.setCsmt_desc_img2(null);
			tCsmtBean.setCsmt_desc_img3(null);
			tCsmtBean.setPub_comp(pub_comp);
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			Date date = new Date();
			try {
				date = sdf.parse(pub_date);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			Timestamp timestamp = new Timestamp(date.getTime());
			
			tCsmtBean.setPub_date(timestamp);
			tCsmtBean.setPay_desc(pay_desc);
			tCsmtBean.setPay_desc_img(null);
		
			int result = tCsmtDAO.insertCsmt(tCsmtBean);
			if (result == 1) {
				String csmt_id = tCsmtDAO.selectCsmtId(csmt_kind_cd);
				if(csmt_id != null && !"".equals(csmt_id) && csmt_option != null){
					for(int i=1;i<csmt_option.length;i++){
						if(!"".equals(csmt_option[i])){
							TCsmtOptBean tCsmtOptBean = new TCsmtOptBean();
							tCsmtOptBean.setCsmt_id(csmt_id);
							tCsmtOptBean.setCsmt_opt_cd(csmt_option[i]);
							tCsmtOptBean.setRmrks(null);
							tCsmtOptDAO.insertCsmtOptInfo(tCsmtOptBean);
						}
					}
				}
			}
		}
	}
	
	public void updateCsmtInfo(MultipartRequest multipart, String realPath) throws YTCaresException {
		if(multipart!=null){
			String csmt_id			= multipart.getParameter("csmt_id");
			String csmt_name		= multipart.getParameter("csmt_name");
			String[] csmt_option	= multipart.getParameterValues("csmt_option");
			String csmt_opt_del		= multipart.getParameter("csmt_opt_del");
			
			String option_cmd = "none";
			if("Y".equals(csmt_opt_del)){//옵션을 지우는 체크 박스를 선택했을경우
				option_cmd = "delete";
			} else {
				if (csmt_option != null && csmt_option.length != 0) {
					for (int i = 0; i < csmt_option.length; i++) {
						if (!"".equals(csmt_option[i])) {
							option_cmd = "change";
							break;
						}
					}
				}
			}

			String csmt_price	= multipart.getParameter("csmt_price");
			String csmt_stock	= multipart.getParameter("csmt_stock");
			String csmt_img		= multipart.getFilesystemName("csmt_img");
			String csmt_cur_img = multipart.getFilesystemName("csmt_cur_img");
			String csmt_desc	= multipart.getParameter("csmt_desc");
			String pub_comp		= multipart.getParameter("pub_comp");
			String pub_date		= multipart.getParameter("pub_date");
			String pay_desc		= multipart.getParameter("pay_desc");
			
			TCsmtBean tCsmtBean = new TCsmtBean();
			tCsmtBean.setCsmt_id(csmt_id);
			tCsmtBean.setCsmt_name(csmt_name);
			tCsmtBean.setCsmt_price(Long.parseLong(csmt_price));
			tCsmtBean.setCsmt_stock(Long.parseLong(csmt_stock));
			if (!(csmt_img != null && "".equals(csmt_img))){//새 이미지를 올렸을 경우
				tCsmtBean.setCsmt_img(csmt_img);
			}
			
			String imgdel = multipart.getParameter("imgdeleted");
			if("1".equals(imgdel)){
				tCsmtBean.setCsmt_img("");
			}
			tCsmtBean.setCsmt_desc(csmt_desc);
			tCsmtBean.setCsmt_desc_img1(null);
			tCsmtBean.setCsmt_desc_img2(null);
			tCsmtBean.setCsmt_desc_img3(null);
			tCsmtBean.setPub_comp(pub_comp);
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			Date date = new Date();
			try {
				date = sdf.parse(pub_date);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			Timestamp timestamp = new Timestamp(date.getTime());
			
			tCsmtBean.setPub_date(timestamp);
			tCsmtBean.setPay_desc(null);
			tCsmtBean.setPay_desc_img(null);
			
			try {
				tCsmtDAO.updateCsmtU(tCsmtBean);
				
				if (csmt_img != null && "".equals(csmt_img)) {
					File img = new File(realPath, csmt_cur_img);
					if (img.exists()) img.delete();
				}
			} catch (YTCaresException e) {
				e.printStackTrace();
			}
			
			if("delete".equals(option_cmd)){//옵션을 삭제한 경우
				try {
					tCsmtOptDAO.deleteCsmtOpt(csmt_id);
				} catch (YTCaresException e) {
					e.printStackTrace();
				}
			}
			else if("change".equals(option_cmd)){//옵션을 변경한 경우
				try {
					tCsmtOptDAO.deleteCsmtOpt(csmt_id);
					for(int i=1;i<csmt_option.length;i++){
						if(!"".equals(csmt_option[i])){
							TCsmtOptBean tCsmtOptBean = new TCsmtOptBean();
							tCsmtOptBean.setCsmt_id(csmt_id);
							tCsmtOptBean.setCsmt_opt_cd(csmt_option[i]);
							tCsmtOptBean.setRmrks(null);
							tCsmtOptDAO.insertCsmtOptInfo(tCsmtOptBean);
						}
					}
				} catch (YTCaresException e1) {
					e1.printStackTrace();
				}
			}
		}
	}
	
	public void insertCsmtOptCode(HttpServletRequest request) throws YTCaresException {
		//String command = request.getParameter("command");
		//if("upd".equals(command)){
			String optName = request.getParameter("optName");
			String rmrks=null;
			if(request.getParameter("rmrks")!=null)
				rmrks = request.getParameter("rmrks");
			String[] detailOpt = request.getParameterValues("detailOpt");
			String[] detailOptPrice = request.getParameterValues("detailOptPrice");
			
			TMcodeBean tMcodeBean = new TMcodeBean();
			tMcodeBean.setMcode_nm(optName);
			tMcodeBean.setRmrks(rmrks);
			
			tMcodeDAO.insertMcodeInfo(tMcodeBean);
			for(int i = 1; i < detailOpt.length; i++){
				TCodeBean tCodeBean = new TCodeBean();
				tCodeBean.setDcode_cd(String.valueOf(i+1));
				tCodeBean.setCode_nm1(detailOpt[i]);
				tCodeBean.setCode_nm2(detailOptPrice[i]);
				tCodeBean.setCode_nm3(null);
				tCodeBean.setCode_nm4(null);
				tCodeBean.setCode_nm5(null);
				tCodeBean.setCode_nm6(null);
				tCodeBean.setOrder_no(i+1);
				tCodeDAO.insertCodeInfo(tCodeBean);
			}
		//}
	}
}
