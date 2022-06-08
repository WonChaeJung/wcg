package egovframework.sys.web;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;






/**
 * @Class Name : SystemController.java
 * @Description : SystemController  Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2016.11.30  shkim         최초생성
 *
 * @author ibleaders 기술지원팀
 * @since 2016.12.16
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */
@Controller
public class SystemController {

private static final Logger LOGGER = LoggerFactory.getLogger(SystemController.class);	
	


@Resource(name="txManager")
PlatformTransactionManager txManager;

	@RequestMapping(value = "main.do")
	public ModelAndView mainIndex(ModelMap model) throws Exception {
		ModelAndView mv = new ModelAndView("/index");
		return mv;
	}
}
