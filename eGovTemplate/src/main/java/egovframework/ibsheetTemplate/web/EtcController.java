package egovframework.ibsheetTemplate.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class EtcController {
	@RequestMapping(value = "etc/util/popup.do")
	public ModelAndView basicPopupExample(HttpServletRequest req,HttpServletResponse res) throws Exception {
		ModelAndView mv = new ModelAndView("/ibsheet_template/etc/popup");
		return mv;
	}
	@RequestMapping(value = "etc/util/popupContent.do")
	public ModelAndView basicPopupContent(HttpServletRequest req,HttpServletResponse res) throws Exception {
		
		ModelAndView mv = new ModelAndView("/ibsheet_template/etc/popupContents");
		return mv;
	}
}
