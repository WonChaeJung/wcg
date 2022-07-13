package com.ytcares.service.admin;

import java.io.File;
import java.io.IOException;
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
import com.ytcares.bean.TBoardBean;
import com.ytcares.common.YTCaresConstants.BCategory;
import com.ytcares.dao.TBoardDAO;
import com.ytcares.service.YTCaresService;

@Controller
public class AdElearnServiceImpl extends YTCaresService{
	
	Logger logger = Logger.getLogger(AdElearnServiceImpl.class);
	@Autowired
	ServletContext servletContext;
	@Autowired
	TBoardDAO tBoardDAO;
	
	private final String elearnDir	= "/ytcares/elearn";
	private final String imageDir = "/ytcares/elearn/image";
	private final String movieDir = "/ytcares/elearn/movie";
	private final String encType	= "UTF-8";
	//멤버필드로 선언하면 최초생성시의 값을 유지하고 있으므로 동일 파일명이 발생할 수 있음
//	Calendar cal = Calendar.getInstance();
//	String hh = Integer.toString(cal.get(Calendar.HOUR_OF_DAY));
//	String mm = Integer.toString(cal.get(Calendar.MINUTE));
//	String dd = Integer.toString(cal.get(Calendar.SECOND));
	
	//온라인강의 검색 페이지 호출
	@SuppressWarnings("unchecked")
	@RequestMapping(value={"/AdElearnService/adminSelectElearnList.do"},method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView adminSelectElearnList(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("admin/adElearnListR");
		
		Map<String, Object> paramMap = request2ParamMap(request);
		paramMap.put("category", BCategory.elearning);
		
		if("1".equals(request.getParameter("chkFlg"))){
			paramMap.remove("sub_category");
			paramMap.remove("seq_no");
		}
		int cnt = tBoardDAO.selectAdminElearnCount(paramMap);
		if(cnt!=0){
			List<Map<String, Object>> srchRlt = (List<Map<String, Object>>) tBoardDAO.selectAdminElearn(paramMap);
			mav.addObject("count",cnt);
			mav.addObject("srchRlt", srchRlt);
		}
		return mav;
	}
	//온라인강의 상세 페이지 호출
	@RequestMapping(value={"/AdElearnService/adminSelectElearn.do"},method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView adminSelectElearn(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav	= new ModelAndView("admin/adElearnCUD");
		String pageNumTmp	= request.getParameter("pageNumTemp");
		String chkKbn		= request.getParameter("chkKbn");
		
		if("update".equals(chkKbn)){
			Map<String, Object> paramMap = request2ParamMap(request);
			paramMap.put("category", BCategory.elearning);
			paramMap.put("pageNo", pageNumTmp);
			
			Map<String, Object> srchRlt = tBoardDAO.selectElearnUpdateInfoSrch(paramMap);
			mav.addObject("srchRlt", srchRlt);
			if (srchRlt != null && !srchRlt.isEmpty()) {
				TBoardBean bean = new TBoardBean();
				try {
					bean.map2Bean(paramMap);
				} catch (Exception e) {
					e.printStackTrace();
				}
				tBoardDAO.updateReadCount(bean);
			}
		}
		if(pageNumTmp!=null){
			request.setAttribute("pageNo",pageNumTmp);
		}else{
			request.setAttribute("pageNo",1);	
		}
		return mav;
	}
	//온라인강의 등록
	@SuppressWarnings("unchecked")
	@RequestMapping(value={"/AdElearnService/adminInsertElearn.do"},method={RequestMethod.POST})
	public ModelAndView adminInsertElearn(HttpServletRequest request, HttpServletResponse response) throws IOException{
		ModelAndView mav = new ModelAndView("/admin/adElearnListR");
		
		MultipartRequest imageUp = null;
		int maxSize = 1073741800 + 1048576; //1GB + 1MB
		String realFolder = servletContext.getRealPath(elearnDir);
		File elDir = new File(realFolder);
		if(!elDir.exists()){
			elDir.mkdir();
		}
		try{
			//전송을 담당할 콤포넌트를 생성하고 파일을 전송한다.
			//전송할 파일명을 가지고 있는 객체, 서버상의 절대 경로, 최대 업로드될 파일크기, 문자코드, 기본 보안 적용
			imageUp = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
		}catch(IOException ioe){
			//용량초과등 파일업로드시 에러발생
			ioe.printStackTrace();
			saveMessage("error.fail.insert");
		}catch(Exception e){
			e.printStackTrace();
			saveMessage("error.fail.insert");
		}
		if(imageUp != null){
			Map<String, Object> paramMap = request2ParamMap(request);
			paramMap.put("category",	BCategory.elearning);
			paramMap.put("sub_category",imageUp.getParameter("sub_category"));
			paramMap.put("title",		imageUp.getParameter("title"));
			paramMap.put("content",		imageUp.getParameter("content"));
			paramMap.put("reg_id",		getLoggedUserId());
			paramMap.put("appnd_data1", "appnd_data1");
			paramMap.put("appnd_data1", "appnd_data2");
			
			//매번 실행될 때마마 시스템시간을 밀리세컨드로 구해서 사용함
			String time = String.valueOf(System.currentTimeMillis());
			//String time = hh+mm+dd;
			String imgFileName = imageUp.getFilesystemName("append_data1");
			String movFileName = imageUp.getFilesystemName("append_data2");
			File f_img = imageUp.getFile("append_data1");
			File f_mov = imageUp.getFile("append_data2");
			
			if(f_img.isFile()){
				String imgPath = servletContext.getRealPath(imageDir);
				File imgFileDir = new File(imgPath);
				File imgFile = new File(imgPath, time + "_" + imgFileName);
				if(!imgFileDir.exists()){
					imgFileDir.mkdir();
				}
				if(imgFileDir.exists()){
					f_img.renameTo(imgFile);
					paramMap.put("appnd_data1", imgFile.getName());
				}
			}
			if(f_mov.isFile()){
				String movPath = servletContext.getRealPath(movieDir);
				File movFileDir = new File(movPath);
				File movFile = new File(movPath, time + "_" + movFileName);
				if(!movFileDir.exists()){
					movFileDir.mkdir();
				}
				if(movFileDir.exists()){
					f_mov.renameTo(movFile);
					paramMap.put("appnd_data2", movFile.getName());
				}
			}
			int insertRlt = tBoardDAO.insertAdminElearn(paramMap);
			if(insertRlt== 0){
				saveMessage("error.fail.insert");
			}
			
			//등록이 안되어도 조회는 해야함
			if (paramMap != null) {
				int cnt = tBoardDAO.selectAdminElearnCount(paramMap);
				if(cnt!=0){
					List<Map<String, Object>> srchRlt = (List<Map<String, Object>>) tBoardDAO.selectAdminElearn(paramMap);
					mav.addObject("count",cnt);
					mav.addObject("srchRlt",srchRlt);
				}
			}
		}

		return mav;
	}
	//온라인강의 수정
	@SuppressWarnings("unchecked")
	@RequestMapping(value={"/AdElearnService/adminUpdateElearn.do"}, method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView adminUpdateElearn(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/admin/adElearnListR");
		MultipartRequest imageUp = null;
		int maxSize = 1073741800 + 1048576; //1GB + 1MB
		String realFolder = servletContext.getRealPath(elearnDir);
		String imagePath = servletContext.getRealPath(imageDir);
		String moviePath = servletContext.getRealPath(movieDir);
		
		try{
			imageUp = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
		}catch(IOException ioe){
			ioe.printStackTrace();
			saveMessage("error.fail.update");
		}catch(Exception e){
			e.printStackTrace();
			saveMessage("error.fail.update");
		}
		
		if(imageUp != null) {
			String newImg = imageUp.getFilesystemName("append_data1");
			String newMov = imageUp.getFilesystemName("append_data2");
			String oldMov = imageUp.getParameter("movFile");
			String oldImg = imageUp.getParameter("imgFile");
			Map<String, Object> paramMap = request2ParamMap(request);
			paramMap.put("category",	BCategory.elearning);
			paramMap.put("sub_category",imageUp.getParameter("sub_category"));
			paramMap.put("seq_no",		imageUp.getParameter("seq_no"));
			paramMap.put("title",		imageUp.getParameter("title"));
			paramMap.put("content",		imageUp.getParameter("content"));
			
			try {
				String time = String.valueOf(System.currentTimeMillis());
				//String time = hh+mm+dd;
				//동영상에 이미지가 이미지에 동영상 이름이 업데이트 됨
				if (newImg != null && !"".equals(newImg)) {
					File f_oldImg = new File(imagePath, oldImg);
					File f_newImg = new File(realFolder, newImg);
					if (f_oldImg.exists()){f_oldImg.delete();}
					File imgFile = new File(imagePath, time + "_" + newImg);
					f_newImg.renameTo(imgFile);
					paramMap.put("appnd_data1", imgFile.getName());
				}
				if (newMov != null && !"".equals(newMov)) {
					File f_oldMov = new File(moviePath, oldMov);
					File f_newMov = new File(realFolder, newMov);
					
					if (f_oldMov.exists()){f_oldMov.delete();}
					File movFile = new File(moviePath, time + "_" + newMov);
					f_newMov.renameTo(movFile);
					
					paramMap.put("appnd_data2", movFile.getName());
				}
				
				//이미지, 동영상 이동후 리네임된 이름으로 갱신
				TBoardBean bean = new TBoardBean();
				bean.map2Bean(paramMap);
				int result = tBoardDAO.adminUpdateBoard(bean);
				if (result == 1) {
					saveMessage("msg.success.update");
				} else {
					saveMessage("error.fail.update");
				}
				
				paramMap.remove("sub_category");
				int cnt = tBoardDAO.selectAdminElearnCount(paramMap);
				if(cnt != 0){
					List<Map<String, Object>> srchRlt = (List<Map<String, Object>>) tBoardDAO.selectAdminElearn(paramMap);
					mav.addObject("count", cnt);
					mav.addObject("srchRlt", srchRlt);
				}
				
				return mav;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return mav;
	}
	//온라인강의 삭제
	@SuppressWarnings("unchecked")
	@RequestMapping(value={"/AdElearnService/adminDeleteElearn.do"},method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView adminDeleteElearn(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav	= new ModelAndView("/admin/adElearnListR");
		String imgFile		= request.getParameter("imgFile");
		String movFile		= request.getParameter("movFile");
		String imageFilePath	= servletContext.getRealPath(imageDir);
		String movieFilePath 	= servletContext.getRealPath(movieDir);
		
		Map<String, Object> paramMap = request2ParamMap(request);
		paramMap.put("category",	BCategory.elearning);

		int result = tBoardDAO.deleteAdminElearn(paramMap);
		if(result == 1 ){
			File f_img = new File(imageFilePath, imgFile);
			File f_mov = new File(movieFilePath, movFile);
			if(imgFile!=null){
				if(f_img.exists()){
					boolean delRlt = f_img.delete();
					if(delRlt)
						saveMessage("msg.success.delete");
					else
						saveMessage("error.fail.delete");
				}else{
					saveMessage("msg.success.delete");
				}
			}
			if(movFile!=null){
				if(f_mov.exists()){
					boolean delRlt = f_mov.delete();
					if(delRlt){
						saveMessage("msg.success.delete");
					}else{
						saveMessage("error.fail.delete");
					}
				}else{
					saveMessage("msg.success.delete");
				}
			}
		}
		paramMap.remove("sub_category");
		int cnt = tBoardDAO.selectAdminElearnCount(paramMap);
		if(cnt!=0){
			List<Map<String, Object>> srchRlt = (List<Map<String, Object>>) tBoardDAO.selectAdminElearn(paramMap);
			mav.addObject("count",cnt);
			mav.addObject("srchRlt", srchRlt);
		}
		return mav;
	}
}
