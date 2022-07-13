package com.ytcares.service.common;

import java.awt.Image;
import java.io.File;
import java.io.FileFilter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.coobird.thumbnailator.Thumbnailator;
import net.coobird.thumbnailator.util.ThumbnailatorUtils;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.ytcares.common.YTCaresConstants.Grade;
import com.ytcares.service.YTCaresService;

@Controller
public class CmFileServiceImpl extends YTCaresService {
	private Logger logger = Logger.getLogger(CmFileServiceImpl.class);

	/**
	 * CKEditor의 파일업로드, 브라우징에 사용되는 type파라미터값 
	 * @author YTCares
	 */
	enum FileDir {
		/** 파일타입 이미지 */
		image("image"),
		/** 파일타입 플래쉬 */
		flash("flash"),
		/** 상품정보 */
		product("product"),
		/** 온라인강좌 */
		el("el"),
		/** 파일타입 파일 */
		file("file");
		
		/**
		 * <pre>
		 * 파일타입에 따른 루트디렉토리
		 * 베이스디렉토리로 WebAppRoot/ytcares/ckedit/을 사용하고
		 * 파일타입에 따라 서브디렉토리를 사용함
		 * 해당서브디렉토리내에 썸네일용의 thumbnails/디렉토리를 사용.
		 * 
		 * 파일타입이 image인 경우
		 * 파일루트 : /WebAppRoot/ytcares/ckedit/image/
		 * 썸네일 : /WebAppRoot/ytcares/ckedit/image/thumbnails/
		 * </pre>
		 */
		private String path;
		FileDir(String type) {
			this.path = "/ytcares/ckedit/".concat(type).concat("/");
		}
		
		public String getPath() {
			return this.path;
		}
		
		public String getThumbPath() {
			return this.path.concat("thumbnails/");
		}
	}
	
	public CmFileServiceImpl() {
		super();
	}

	/**
	 * <pre>
	 * 파일리스트 조회화면에서 선택한 파일들에 대한 삭제처리
	 * - AOP에 의한 로그인 및 권한체크는 하지 않고 메소드내에서 직접체크
	 * - 관리자권한이 없을 경우 에레메세지 설정
	 * </pre>
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value={"/CmFileService/deleteFiles.do"}, method={RequestMethod.POST})
	public ModelAndView deleteFiles(HttpServletRequest request, HttpServletResponse response) {
		if (!Grade.admin.equals(getLoggedUserGrade())) {
			//관리자가 아닌 경우 에러 메세지 설정후 리스트페이지로 전환
			saveMessage("lbl.error.not.grade");
			return new ModelAndView("/common/cmFileBrowseListR");
		}
		
		FileDir root		= getRoot(request);
		String[] filenames	= request.getParameterValues("filename");
		
		if (filenames != null && filenames.length != 0) {
			//파일이름 배열이 빈배열이 아닌 경우
			
			ServletContext context = request.getSession().getServletContext();
			//타입에 따른 파일루트디렉토리
			String upDir = context.getRealPath(root.getPath());
			//썸네일 디렉토리
			String thDir = context.getRealPath(root.getThumbPath());
			
			for (String filename : filenames) {
				//해당 파일이 시스템에 존재하는 경우 삭제
				File file = new File(upDir, filename);
				if (file.exists()) {
					file.delete();
				}
				
				if (root == FileDir.image || root == FileDir.file) {
					//타입이 이미지이고 해당파일이 시스템에 존재하는 경우 삭제
					File thum = new File(thDir, filename);
					if (thum.exists()) {
						thum.delete();
					}
				}
			}
		}

		return fileBrowse(request, response);
	}
	
	/**
	 * <pre>
	 * 파라미터의 타입값에 따른 파일리스트를 조회
	 * - 관리자 권한체크를 메소드내에서 직접수행
	 * - 수정일(생성일)에 따른 파일 필터링수행
	 * - 수정일 파라미터값이 없는 경우 필터링없음
	 * - 수정일 파라미터값이 올바르지 않은 경우 오늘날짜로 필터링
	 * </pre>
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value={"/CmFileService/fileBrowse.do"}, method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView fileBrowse(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("/common/cmFileBrowseListR");
		if (!Grade.admin.equals(getLoggedUserGrade())) {
			saveMessage("lbl.error.not.grade");
			return mav;
		}
		
		//컨텍스트루트
		ServletContext context	= request.getSession().getServletContext();
		//파일타입에따른 업로드루트
		FileDir root			= getRoot(request);
		//파일시스템상의 실제경로
		String realpath			= context.getRealPath(root.getPath());
		//수정일파라미터
		final String modifyDate	= request.getParameter("modifyDate");
		
		File dir = new File(realpath);
		if (dir.exists()) {
			// 파일타입에 따른 실제경로가 존재하는 경우
			
			List<Map<String, Object>> fileList = new ArrayList<Map<String, Object>>();
			File[] files = null;
			if (modifyDate != null && !"".equals(modifyDate)) {
				//수정일파라미터값이 있는 경우
				
				files = dir.listFiles(new FileFilter() {
					public boolean accept(File f) {
						String modify 	= new String(modifyDate);
						modify			= modify.replaceAll("[^0-9]", "");
						
						//디폴트필터링날짜 오늘날짜
						Calendar cal	= Calendar.getInstance();
						if (modify.length() == 8) {
							cal.set(Calendar.YEAR, Integer.valueOf(modify.substring(0, 4)));
							cal.set(Calendar.MONTH, Integer.valueOf(modify.substring(4, 6))-1);
							cal.set(Calendar.DATE, Integer.valueOf(modify.substring(6)));
						}
						
						Calendar fcal = Calendar.getInstance();
						fcal.setTimeInMillis(f.lastModified());
						
						//파일의 수정날짜와 파라미터로 지정한 날짜가 같은지 비교
						if (cal.get(Calendar.YEAR) != fcal.get(Calendar.YEAR) ||
								cal.get(Calendar.MONTH) != fcal.get(Calendar.MONTH) ||
								cal.get(Calendar.DATE) != fcal.get(Calendar.DATE)) {
							return false;
						} else {
							return true;		
						}
					}
				});
			} else {
				//수정일 파라미터값이 존재하지 않는 경우, 필터링 없음 
				files = dir.listFiles();
			}
			
			for(File f : files) {
				//대상이 디렉토리인 경우
				if (f.isDirectory()) continue;
				
				//대상이 파일인 경우, 리스트에 파일정보 추가
				Map<String, Object> file = new HashMap<String, Object>();
				file.put("path", root.getPath());
				file.put("name", f.getName());
				file.put("length", f.length());
				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				file.put("lastModified", sdf.format(new Date(f.lastModified())));
				fileList.add(file);
			}
			
			mav.addObject("fileList", fileList);
		}
		return mav;
	}
	
	/**
	 * <pre>
	 * CKEditor용 파일업로드처리
	 * - 관리자등급체크를 메소드내에서 직접수행
	 * - 최대업로드 사이즈 50메가
	 * - 파일타입에 따른 업로드패스 지정
	 * </pre>
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value={"/CmFileService/fileUpload.do"}, method=RequestMethod.POST)
	public ModelAndView fileUpload(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("/common/cmFileUploadResult");
		
		if (!Grade.admin.equals(getLoggedUserGrade())) {
			//관리자등급이 아닌 경우 에러메세지 설정후 뷰화면으로 전환
			saveMessage("lbl.error.not.grade");
			return mav;
		}
		//컨텍스트경로
		ServletContext context = request.getSession().getServletContext();
		//파일타입에 따른 업로드경로
		FileDir root			= getRoot(request);
		//최대50MB
		int maxSize				= 50 * 1024 * 1024;

		//업로드 경로의 파일시스템상에서의 실제경로
		String realPath = context.getRealPath(root.getPath());
		File upDir = new File(realPath);
		if(!upDir.exists()) {
			//업로드경로가 존재하지 않는 경우, 디렉토리 생성
			upDir.mkdirs();
		}
		
		MultipartRequest multi = null;
		try {
			//파일업로드처리
			multi = new MultipartRequest(request, realPath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
			
			//썸네일용 경로
			File thumDir = new File(context.getRealPath(root.getThumbPath()));
			if((root == FileDir.image || root == FileDir.file) && !thumDir.exists()) {
				//업로드타입이 이미지이고 썸네일 디렉토리가 존재하지 않는 경우
				
				//디렉토리 생성
				thumDir.mkdirs();
			}
			
			List<String> fileNames = new ArrayList<String>();
			Enumeration<?> files = multi.getFileNames();
			while(files.hasMoreElements()){
				String name = String.valueOf(files.nextElement());
				
				//서버에 저장된 파일
				File f = multi.getFile(name);
				fileNames.add(f.getName());
				
				try {
					String[] fnames = f.getName().split("\\.");
					if ((root == FileDir.image || root == FileDir.file) && fnames.length > 1 && ThumbnailatorUtils.isSupportedOutputFormat(fnames[fnames.length - 1])) {
						//업로드타입이 이미지이고, 확장자가 있고 썸네일으로 전환가능한 포맷인 경우
						
						//썸네일 생성

						Image img 	= ImageIO.read(f);
						int width	= img.getWidth(null);
						int height	= img.getHeight(null);
						int dWidth	= 50;
						int dHeight	= (int)(50 * height / width);
						Thumbnailator.createThumbnail(f, new File(thumDir, f.getName()), dWidth, dHeight);
					}
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			
			mav.addObject("fileName", root.getPath().concat(multi.getFilesystemName("upload")));
		} catch (IOException e) {
			saveMessage("");
		}
		
		return mav;
	}
	
	private FileDir getRoot(HttpServletRequest request) {
		try {
			return FileDir.valueOf(request.getParameter("type"));
		} catch (Exception e) {
			return FileDir.file;
		}
	}
}
