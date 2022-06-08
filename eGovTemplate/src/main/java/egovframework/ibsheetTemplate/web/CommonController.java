package egovframework.ibsheetTemplate.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.ib.util.IBUploadUtil;

@Controller
public class CommonController {
	@RequestMapping(value = "common/ibsheet/Down2Excel.do")
	public void Down2Excel(HttpServletRequest req,HttpServletResponse res) throws Exception {
//		egovframework.ib.util.IBImportExportUtil.Down2Excel(req, res); 
		
	}
	
	
	@RequestMapping(value = "common/file/DownLoad.do")
	public void fileDownLoad(HttpServletRequest req,HttpServletResponse res) throws Exception {
		IBUploadUtil iu = new IBUploadUtil();
		iu.DownloadFiles(req,res);
	}
}
