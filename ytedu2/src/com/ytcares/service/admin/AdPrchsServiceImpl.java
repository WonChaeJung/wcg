package com.ytcares.service.admin;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Date;
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

import com.ytcares.biz.AdPrchsAccmBiz;
import com.ytcares.common.YTCaresCsvUtil;
import com.ytcares.common.YTCaresException;
import com.ytcares.dao.TAccmDAO;
import com.ytcares.dao.TPrchsDAO;
import com.ytcares.service.YTCaresService;
@Controller
public class AdPrchsServiceImpl extends YTCaresService{
	Logger logger = Logger.getLogger(AdPrchsServiceImpl.class);
	@Autowired
	TPrchsDAO tprchsDAO;
	@Autowired
	TAccmDAO tAccmDAO;
	@Autowired
	AdPrchsAccmBiz adPrchsAccmBiz;
	@Autowired
	ServletContext servletContext;
	@Autowired
	YTCaresCsvUtil yTCaresCsvUtil;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value={"/AdPrchsService/adminSearchPrchsList.do"}, method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView adminSearchPrchsList(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView(); 
		mav.setViewName("/admin/adPrchsListR");
		
		Map<String, Object> param = request2ParamMap(request);
			try {
				int count = tprchsDAO.selectUserPrchsCount(param);
				if(count != 0){
					List<Map<String, Object>>searchRlt = tprchsDAO.selectUserPrchsList(param);
					mav.addObject("countRlt", count);
					mav.addObject("searchRlt", searchRlt);		
				}else{
					//saveMessage("error.undefind.search.result");
				}
			}catch(YTCaresException e) {
				saveMessage(e);
			} 
		return mav;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value={"/AdPrchsService/adminUpdatePrchsInfo.do"}, method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView adminUpdatePrchsInfo(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("admin/adPrchsListR");
		try {
			int result = adPrchsAccmBiz.updatePrchsInfo(request.getParameterMap());
			if (result == 0) {
				saveMessage("error.fail.update");
			} else {
				saveMessage("msg.success.update");
			}
			
			Map<String,Object> param = request2ParamMap(request);
			param.put("prchs_seq_no",	param.get("pagePrchs_seq_no"));
			param.put("agency_name",	param.get("pageAgency_name"));
			param.put("grade",			param.get("pageGrade"));
			param.put("prchs_stat_cd",	param.get("pagePrchs_stat_cd"));
			
			int count = tprchsDAO.selectUserPrchsCount(param);
			mav.addObject("countRlt", count);
			if (count != 0) {
				List<Map<String, Object>>searchRlt = tprchsDAO.selectUserPrchsList(param);
				mav.addObject("searchRlt", searchRlt);
			}
		} catch (YTCaresException e) {
			e.printStackTrace();
			saveMessage(e);
		}
		
		return mav;
	}
	
	@RequestMapping(value={"/AdPrchsService/adminPrchsCsvInput.do"}, method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView adminPrchsCsvInput(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("common/cmCsvOutput_p");
		String defaultPath = "/ytcares/csv";
		String realPath = servletContext.getRealPath(defaultPath);
		Map<String, Object> param = request2ParamMap(request);
		try {
			String fileName = yTCaresCsvUtil.csvInput("prchs.selectUserPrchsCsvList",param,realPath);
			mav.addObject("fileName", fileName);
			mav.addObject("date", new Date(System.currentTimeMillis()));
		} catch (IOException e) {
			e.printStackTrace();
		}
		return mav;
	}
	@RequestMapping(value={"/AdPrchsService/adminPrchsCsvDown.do"}, method={RequestMethod.POST, RequestMethod.GET})
	public void adminPrchsCsvDown(HttpServletRequest request, HttpServletResponse response) throws IOException{
		response.setHeader("Content-Disposition", "attachment; filename=\""+request.getParameter("fileName")+"\"");
		String defaultPath = "/ytcares/csv";
		String realPath = servletContext.getRealPath(defaultPath);
		
		ByteArrayOutputStream bos =  yTCaresCsvUtil.csvReader(realPath, request.getParameter("fileName"));
		
		OutputStream os = response.getOutputStream();
		os.write(bos.toByteArray());
		os.flush();
		os.close();
		bos.close();
	}
}
