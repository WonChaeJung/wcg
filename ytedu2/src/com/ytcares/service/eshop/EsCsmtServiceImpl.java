package com.ytcares.service.eshop;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Param;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ytcares.bean.TCodeBean;
import com.ytcares.bean.TCsmtBean;
import com.ytcares.bean.TCsmtOptBean;
import com.ytcares.common.YTCaresException;
import com.ytcares.common.YTCaresConstants.Sql;
import com.ytcares.dao.TCodeDAO;
import com.ytcares.dao.TCsmtDAO;
import com.ytcares.dao.TCsmtOptDAO;
import com.ytcares.service.YTCaresService;

@Controller
public class EsCsmtServiceImpl extends YTCaresService {
	private Logger logger = Logger.getLogger(EsCsmtServiceImpl.class);
	
	@Autowired
	private TCsmtDAO tCsmtDAO;
	
	@Autowired
	private TCsmtOptDAO tCsmtOptDAO;
	
	@Autowired
	private TCodeDAO tCodeDAO;
	
	public EsCsmtServiceImpl() {}
	
	@RequestMapping(value={"/EsCsmtService/selectCsmtList.do"} , method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView selectCsmtList(HttpServletRequest request, HttpServletResponse response) {
	    ModelAndView mav = new ModelAndView();
	    mav.setViewName("/eshop/esCsmtListR");
	    List<TCsmtBean> csmtBeanList = new ArrayList<TCsmtBean>();
	    Map<String, Object> param = request2ParamMap(request);
	    String csmt_kind_cd="";
	    if(request.getParameter("csmt_kind_cd")!=null){
	    	csmt_kind_cd = request.getParameter("csmt_kind_cd");
	    	
	    }
	    else{
			saveMessage("error.fail.load.goods.kind.code");
	    	
	    }
	    param.put("csmt_kind_cd", csmt_kind_cd);
		int csmtCount=0;
		
		try{
			csmtCount = tCsmtDAO.selectCsmtCount();
			mav.addObject("count", csmtCount);
		}catch(YTCaresException e){
			saveMessage(e);
		}
		
		if(csmtCount == 0){
			csmtBeanList=null;
			mav.addObject("csmtBeanList", csmtBeanList);
		}
		else{
			try {
				csmtBeanList = (List<TCsmtBean>)tCsmtDAO.selectCsmtAllList(param);
			} catch (YTCaresException e) {
				saveMessage(e);
			}
			mav.addObject("csmtBeanList",csmtBeanList);
			
		}
		return mav;
	}
	
	@RequestMapping(value={"/EsCsmtService/selectCsmtInfo.do"} , method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView selectCsmtInfo(HttpServletRequest request, HttpServletResponse response) {
	    ModelAndView mav = new ModelAndView();
	    mav.setViewName("/eshop/esCsmtInfoR");
	    String csmt_id="";
	    Object obj = request.getParameter("csmt_id");
	    
	    if(obj!=null){
	    	csmt_id = obj.toString();
	    }
	    
		TCsmtBean csmtBeanInfo = null;
		try{
			csmtBeanInfo = tCsmtDAO.selectCsmtInfo(csmt_id);
		}catch(YTCaresException e){
			saveMessage(e);
		}
		
		mav.addObject("csmtBeanInfo",csmtBeanInfo);
		
		List<TCsmtOptBean> tCsmtOptList=new ArrayList<TCsmtOptBean>();
		
		try{
			tCsmtOptList = tCsmtOptDAO.selectCsmtOptList(csmt_id);
		}catch(YTCaresException e){
			saveMessage(e);
		}
		
		int listSize=tCsmtOptList.size();
		mav.addObject("optlistSize",listSize);
		
		if(tCsmtOptList.size() <= 0){
			tCsmtOptList = null;
			mav.addObject("csmtOptBeanInfo", tCsmtOptList);
		}
		else{
			mav.addObject("csmtOptBeanInfo", tCsmtOptList);
		}
		
		/*List<TCodeBean> tCodeBeanList=new ArrayList<TCodeBean>();
		Map<String, String> codemap = new HashMap<String,String>();
		codemap.put(key, value);*/
		
		//추가 구성품을 불러오기 위한 부분
		List<TCsmtBean> csmtBeanList = new ArrayList<TCsmtBean>();
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("csmt_kind_cd", "AD");
		int csmtCount=0;
		try{
			csmtCount = tCsmtDAO.selectCsmtListCount(param);
		}catch(YTCaresException e){
			saveMessage(e);
		}
		
		if(csmtCount == 0){
			csmtBeanList=null;
			mav.addObject("csmtBeanList", csmtBeanList);
		}
		else{
			try {
				csmtBeanList = (List<TCsmtBean>)tCsmtDAO.selectCsmtList(param);
			} catch (YTCaresException e) {
				saveMessage(e);
			}
			mav.addObject("csmtBeanList",csmtBeanList);
			
		}
		
		return mav;
	}
	
}
