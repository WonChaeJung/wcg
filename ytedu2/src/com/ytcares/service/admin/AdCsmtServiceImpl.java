package com.ytcares.service.admin;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.ytcares.bean.TCsmtBean;
import com.ytcares.bean.TCsmtOptBean;
import com.ytcares.bean.TMcodeBean;
import com.ytcares.biz.CsmtBuyBiz;
import com.ytcares.common.YTCaresException;
import com.ytcares.dao.TCsmtDAO;
import com.ytcares.dao.TCsmtOptDAO;
import com.ytcares.dao.TMcodeDAO;
import com.ytcares.service.YTCaresService;

@Controller
public class AdCsmtServiceImpl  extends YTCaresService {
	private Logger logger = Logger.getLogger(AdCsmtServiceImpl.class);
	
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	private TCsmtDAO tCsmtDAO;
	
	@Autowired
	private TCsmtOptDAO tCsmtOptDAO;
	
	@Autowired
	private TMcodeDAO tMcodeDAO;
	
	@Autowired
	private CsmtBuyBiz csmtBuyBiz;
	
	private final String eshopDir = "/ytcares/eshop";
	private final String encType = "UTF-8";
	
	@RequestMapping(value={"/AdCsmtServiceImpl/adminInsertCsmt.do"} , method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView adminInsertCsmt(HttpServletRequest request, HttpServletResponse response){
		String realFolder = servletContext.getRealPath(eshopDir);
		int maxSize = 5048576;
		File esDir = new File(realFolder);
		if(!esDir.exists()){
			esDir.mkdir();
		}
		try{
			MultipartRequest multipart = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
			csmtBuyBiz.insertCsmtInfo(multipart);
		} catch (YTCaresException e) {
			e.printStackTrace();
			saveMessage(e);
		}catch(IOException ioe){
			ioe.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return adminSelectCsmtList(request, response);
	}
	
	@RequestMapping(value={"/AdCsmtServiceImpl/adminUpdateCsmt.do"} , method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView adminUpdateCsmt(HttpServletRequest request, HttpServletResponse response){
		String realPath = servletContext.getRealPath(eshopDir);
		int maxSize = 5048576;
		File esDir = new File(realPath);
		if(!esDir.exists()){
			esDir.mkdir();
		}
		try{
			MultipartRequest multipart = new MultipartRequest(request, realPath, maxSize, encType, new DefaultFileRenamePolicy());
			csmtBuyBiz.updateCsmtInfo(multipart, realPath);
		} catch (YTCaresException e) {
			e.printStackTrace();
			saveMessage(e);
		} catch(IOException ioe) {
			ioe.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return adminSelectCsmtList(request, response);
	}
	
	@RequestMapping(value={"/AdCsmtServiceImpl/adminDeleteCsmt.do"} , method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView adminDeleteCsmt(HttpServletRequest request, HttpServletResponse response){
		String csmt_id = request.getParameter("csmt_id");
		try {
			tCsmtDAO.deleteCsmtU(csmt_id);
			
		} catch (YTCaresException e) {
			e.printStackTrace();
		}
		return adminSelectCsmtList(request, response);
	}
	
	@RequestMapping(value={"/AdCsmtServiceImpl/adminSelectCsmtInfo.do"} , method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView adminSelectCsmtInfo(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		
		String addOrUpd = request.getParameter("CsmtMng");
		if("upd".equals(addOrUpd)){
			mav.setViewName("/admin/adCsmtU");
			
			TCsmtBean tCsmtBean = new TCsmtBean();
			List<TCsmtOptBean> tCsmtOptList = new ArrayList<TCsmtOptBean>();
			List<TMcodeBean> tMcodeList = new ArrayList<TMcodeBean>();
			
			String csmt_id = request.getParameter("csmt_id");
			
			try {
				tCsmtBean = tCsmtDAO.selectCsmtInfo(csmt_id);
				tCsmtOptList = tCsmtOptDAO.selectCsmtOptList(csmt_id);
				tMcodeList = tMcodeDAO.selectMcodeList();
				
				mav.addObject("csmtInfo",tCsmtBean);
				mav.addObject("csmtOptList",tCsmtOptList);
				mav.addObject("mcodeList",tMcodeList);
			} catch (YTCaresException e) {
				e.printStackTrace();
			}
			

		}
		else if("add".equals(addOrUpd)){
			mav.setViewName("/admin/adCsmtC");
			List<TMcodeBean> tMcodeList = new ArrayList<TMcodeBean>();
			try{
				tMcodeList = tMcodeDAO.selectMcodeList();
				mav.addObject("mcodeList",tMcodeList);
			} catch (YTCaresException e) {
				e.printStackTrace();
			}
		}
		return mav;
	}
	
	@RequestMapping(value={"/AdCsmtServiceImpl/adminSelectCsmtList.do"} , method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView adminSelectCsmtList(HttpServletRequest request, HttpServletResponse response) {
	    ModelAndView mav = new ModelAndView();
	    
	    List<TCsmtBean> csmtBeanList = new ArrayList<TCsmtBean>();
	    
	    mav.setViewName("/admin/adCsmtListR");
	    
		int csmtCount=0;
		Map<String, Object> param = request2ParamMap(request);
		try{
			csmtCount = tCsmtDAO.selectCsmtListCount(param);
			mav.addObject("count", csmtCount);
			
			if(csmtCount == 0){
				csmtBeanList=null;
				mav.addObject("csmtBeanList", csmtBeanList);
			}
			else{
				csmtBeanList = (List<TCsmtBean>)tCsmtDAO.selectCsmtList(param);
				mav.addObject("csmtBeanList",csmtBeanList);
			}
		}catch(YTCaresException e){
			saveMessage(e);
		}

		return mav;
	}
	@RequestMapping(value={"/AdCsmtServiceImpl/adminInsertCsmtCodeInfo.do"} , method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView adminInsertCsmtCodeInfo(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav	= new ModelAndView("/admin/adCsmtOptC_p");
		String command		= request.getParameter("command");
		if("add".equals(request.getParameter(command))){
			return mav;
		} else if ("upd".equals(command)) {
			try {
				String optName = request.getParameter("optName");
				csmtBuyBiz.insertCsmtOptCode(request);
				
				String code_value = tMcodeDAO.selectMCodeMax();
				mav.addObject("changed",1);
				mav.addObject("code_nm",optName);
				mav.addObject("code_value",code_value);
			} catch (YTCaresException e) {
				e.printStackTrace();
			}
		}
		
		return mav;
	}
}
