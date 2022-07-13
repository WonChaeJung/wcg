package com.ytcares.common;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.aspectj.lang.ProceedingJoinPoint;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;

import com.ytcares.bean.TUserBean;
import com.ytcares.common.YTCaresConstants.AuthPrefix;
import com.ytcares.common.YTCaresConstants.Common;
import com.ytcares.common.YTCaresConstants.Grade;

/**
 * <pre>
 * 요청리퀘스트에 대하여 적정 권한을 가지고 있는지 체크
 * 1. DB에 대한 CRUD를 행하는 메소드에 대하여 로그인 체크
 * 1.1. 서비스 메소드명이 user로 시작할 경우 로그인 체크실시
 * 1.2. 상기 문자열로 시작하지 않는 경우 로그인체크는 미실시
 * 
 * 2. 요청uri에 해당하는 서버측 메소드가 admin으로 시작하는 경우, 관리자권한을 가지고 있는지 확인
 * 3. 요청uri에 해당하는 서버측 메소드가 member로 시작하는 경우, 관리자, 총판, 부총판인지 확인
 * 4. 적정권한을 가지고 있지 않을 경우 403에러응답
 * 5. 호출메소드의 파라미터로 HttpServletResponse를 가지고 있지 않은 경우 메인페이지로 리다이렉트
 * </pre>
 * @author YTCares
 */
public class YTCaresAspect{
	@Autowired
	private HttpServletRequest request;
	
	private Logger logger = Logger.getLogger(YTCaresAspect.class);
	
	/**
	 * <pre>
	 * user로 시작하는 서비스메소드에 대한 로그인체크
	 * 해당메소드 호출시 로그인되지 않은 경우 로그인화면으로 리다이렉트
	 * </pre>
	 * @param joinPoint
	 * @return
	 * @throws Throwable
	 */
	public Object loginCheck(ProceedingJoinPoint joinPoint) throws Throwable {
		logger.info("[Request Method] " + joinPoint.getSignature());
		
		HttpSession session = request.getSession();
		if (session.isNew() || session.getAttribute(Common.session_user_bean) == null) {
			ModelAndView mav = new ModelAndView("redirect:/CmUserService/callUserLogin.do");
			//서비스메소드호출시의 파라미터를 로그인화면의 쿼리스트링으로 전달
			mav.addAllObjects(request.getParameterMap());
			//호출메소드를 리다이렉트 uri로 전달
			mav.addObject("redirect", request.getRequestURI());
			return mav;
		} else {
			return (ModelAndView)joinPoint.proceed();
		}
	}
	
	/**
	 * <pre>
	 * admin, member로 시작하는 서비스메소드에 대한 권한체크
	 * - 로그인여부를 체크하여 로그인 되지 않았을 경우 로그인화면으로 리다이텍트
	 * - 메소드호출시의 파라미터를 쿼리스트링으로 전달
	 * - 호출메소드를 리다이렉트 uri로 전달
	 * - 해당메소드에 대한 권한이 없을 경우 에러응답
	 * </pre>
	 * @param joinPoint
	 * @return
	 * @throws Throwable
	 */
	public Object authCheck(ProceedingJoinPoint joinPoint) throws Throwable {
		HttpSession session = request.getSession();
		if (session.isNew() || session.getAttribute(Common.session_user_bean) == null) {
			ModelAndView mav = new ModelAndView("redirect:/CmUserService/callUserLogin.do");
			mav.addAllObjects(request.getParameterMap());
			mav.addObject("redirect", request.getRequestURI());
			return mav;
		}
		
		TUserBean bean = (TUserBean)session.getAttribute(Common.session_user_bean);
		//로그인유저의 등급
		String grade = bean.getGrade();
		
		//호출메소드의 풀시그니쳐
		String fullsig		= String.valueOf(joinPoint.getSignature());
		// . 를 구분자로 배열로 전환
		String[] signature 	= fullsig.split("\\.");
		// 호출한 실제 메소드명
		String methodName	= signature[signature.length-1];
		
		if (methodName.startsWith(AuthPrefix.admin)) {
			if (!Grade.admin.equals(grade)) {
				//메소드가 admin으로 시작하고 로그인 등급이 관리자가 아닌경우 403에러응답
				return sendErr(joinPoint);
			}
		} else if (methodName.startsWith(AuthPrefix.member)) {
			//정회원이상(관리자, 총판, 부총판인지 확인)
			if (!Grade.admin.equals(grade) &&
					!Grade.sup_agency.equals(grade) &&
					!Grade.sub_agency.equals(grade) &&
					!Grade.agency.equals(grade) &&
					!Grade.member.equals(grade)) {
				return sendErr(joinPoint);
			}
		}
		
		//적정권한을 가지고 있을 경우 메소드 호출
		return (ModelAndView)joinPoint.proceed();
	}

	/**
	 * <pre>
	 * 해당메소드에 대한 호출권한이 없을 경우의 에러응답
	 * </pre>
	 * @param joinPoint
	 * @return
	 * @throws IOException
	 */
	private Object sendErr(ProceedingJoinPoint joinPoint) throws IOException {
		Object[] args = joinPoint.getArgs();
		for (int i = 0; i < args.length; i++) {
			if (args[i] instanceof HttpServletResponse) {
				((HttpServletResponse)args[i]).sendError(HttpServletResponse.SC_FORBIDDEN);
				return null;
			}
		}
		return new ModelAndView("redirect:/main.do");
	}
}
