package com.ytcares.service.admin;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ytcares.bean.TUserBean;
import com.ytcares.common.Base64Util;
import com.ytcares.common.YTCaresException;
import com.ytcares.dao.TUserDAO;
import com.ytcares.service.YTCaresService;
import com.ytcares.service.common.CmYTCaresAjaxServiceImpl;

@Controller
public class AdLssServiceImpl extends YTCaresService{
	@Autowired
	CmYTCaresAjaxServiceImpl cmYTCaresAjaxServiceImpl;
	
	//방제목을 키로 하고 해당방에 입장가능한 사용자아이디를 요소로 가지른 리스트를 값으로 가짐
	private static final Hashtable<String, List<TUserBean>> lssSubjTable = new Hashtable<String, List<TUserBean>>();
	
	public AdLssServiceImpl() {}
	Logger logger = Logger.getLogger(AdLssServiceImpl.class);
	
	@Autowired
	TUserDAO tUserDAO;
	
	@RequestMapping(value={"/AdLssService/adminSelectLssList.do"}, method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView adminSelectMCodeList(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/admin/adLssUserListR");
		
		
		try {
			Object obj = tUserDAO.selectAgencyIdSrch();
			mav.addObject("supSubAgencyList", obj);
			
			int userCount = tUserDAO.selectSearchAgencyTotCnt(request2ParamMap(request));
			mav.addObject("userCount", userCount);
			if (userCount != 0) {
				Object userList = tUserDAO.selectSearchAgency(request2ParamMap(request));
				mav.addObject("userList", userList);
			}
		} catch(YTCaresException e) {
			e.printStackTrace();
			saveMessage(e);
		}
		
		
		mav.addObject("lssSubjTable", lssSubjTable);
		return mav;
	}
	
	@RequestMapping(value={"/AdLssService/adminLauchLss.do"}, method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView adminLauchLss(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/common/cmLssLauncher_p");
		mav.addObject("UserName", Base64Util.encode(request.getParameter("UserName")));
		mav.addObject("Dept", Base64Util.encode(request.getParameter("Dept")));
		mav.addObject("Position", Base64Util.encode(request.getParameter("Position")));
		mav.addObject("RoomTitle", Base64Util.encode(request.getParameter("RoomTitle")));
		return mav;
	}
	
	@RequestMapping(value={"/AdLssService/execAddLssSubj.do"}, method={RequestMethod.GET, RequestMethod.POST})
	public void execAddLssSubj(HttpServletRequest request, HttpServletResponse response) {
		PrintWriter pw = null;
		try {
			response.setContentType("text/plain; charset=UTF-8");
			response.setHeader("Cache-control", "no-cache");
			pw = response.getWriter();
			
			String room_title	= request.getParameter("room_title");
			String[] arrUserId 	= request.getParameterValues("user_id");
			if (arrUserId == null || arrUserId.length == 0) {
				pw.write("[{\"errMsg\":\"입장가능한 유저를 선택해 주십시오.\"}]");
			} else if (room_title == null || "".equals(room_title)) {
				pw.write("[{\"errMsg\":\"방제목을 선택해 주십시오.\"}]");
			} else {
				try {
					List<TUserBean> userList = tUserDAO.selectUserList(arrUserId);
					String result = "[{}]";
					synchronized (lssSubjTable) {
						List<TUserBean> lssSubjList = lssSubjTable.get(room_title);
						if (lssSubjList == null) {
							lssSubjList = new ArrayList<TUserBean>();
						}
						for (int i = userList.size()-1; i >=0; i--) {
							TUserBean bean = userList.get(i);
							if(!lssSubjList.contains(bean)) {
								lssSubjList.add(bean);
							} else {
								userList.remove(i);
							}
						}
						
						result = cmYTCaresAjaxServiceImpl.makeJsonString(userList);
						//lssSubjTable.put(room_title, lssSubjList);
					}
					pw.write(result);
				} catch (YTCaresException e) {
					pw.write("[{\"errMsg\":\""+e.getMessage()+"\"}]");
				}
				
			}
		} catch (Exception e) {
			e.printStackTrace();
			pw.write("[{\"errMsg\":\"대상자 추가 처리 중 예외가 발생하였습니다.\"}]");
		} finally {
			pw.flush();
			if (pw != null) pw.close();
		}
	}
	
	@RequestMapping(value={"/AdLssService/execRemoveLssSubj.do"}, method={RequestMethod.GET, RequestMethod.POST})
	public void execRemoveLssSubj(HttpServletRequest request, HttpServletResponse response) {
		PrintWriter pw = null;
		try {
			response.setContentType("text/plain; charset=UTF-8");
			response.setHeader("Cache-control", "no-cache");
			pw = response.getWriter();
			
			String room_title	= request.getParameter("room_title");
			String user_id 		= request.getParameter("user_id");
			if (user_id == null || "".equals(user_id)) {
				pw.write("대상에서 제외할 유저를 선택해 주십시오.");
			} else if (room_title == null || "".equals(room_title)) {
				pw.write("해당 유저를 제외할 방이름을 선택해 주십시오.");
			} else {
				boolean isRemoved = false;
				
				synchronized (lssSubjTable) {
					List<TUserBean> lssSubjList = lssSubjTable.get(room_title);
					if (lssSubjList == null || lssSubjList.isEmpty()) {
						pw.write("지정한 유저는 대상자가 아닙니다.");
					} else {
						for (TUserBean bean : lssSubjList) {
							if(user_id.equals(bean.getUser_id())) {
								lssSubjList.remove(bean);
								isRemoved = true;
								break;
							}
						}
						//lssSubjTable.put(room_title, lssSubjList);
					}

				}
				if (isRemoved) {
					pw.write("해당 유저를 대상자 리스트에서  제외하였습니다.");
				} else {
					pw.write("지정한 유저는 대상자가 아닙니다.");
				}
				
			}
		} catch (Exception e) {
			e.printStackTrace();
			pw.write("대상자 추가 처리 중 예외가 발생하였습니다.");
		} finally {
			pw.flush();
			if (pw != null) pw.close();
		}
	}
	@RequestMapping(value={"/AdLssService/execRemoveLssRoom.do"}, method={RequestMethod.GET, RequestMethod.POST})
	public void execRemoveLssRoom(HttpServletRequest request, HttpServletResponse response) {
		PrintWriter pw = null;
		try {
			response.setContentType("text/plain; charset=UTF-8");
			response.setHeader("Cache-control", "no-cache");
			pw = response.getWriter();
			
			String room_title	= request.getParameter("room_title");
			if (room_title == null || "".equals(room_title)) {
				pw.write("[{\"errMsg\":\"삭제할 방을 선택해 주십시오.\"}]");
			} else {
				synchronized (lssSubjTable) {
					lssSubjTable.remove(room_title);
				}
				pw.write("[{}]");
			}
		} catch (Exception e) {
			e.printStackTrace();
			pw.write("[{\"errMsg\":\"삭제 처리 중 예외가 발생하였습니다.\"}]");
		} finally {
			pw.flush();
			if (pw != null) pw.close();
		}
	}
	@RequestMapping(value={"/AdLssService/execAddLssRoom.do"}, method={RequestMethod.GET, RequestMethod.POST})
	public void execAddLssRoom(HttpServletRequest request, HttpServletResponse response) {
		PrintWriter pw = null;
		try {
			response.setContentType("text/plain; charset=UTF-8");
			response.setHeader("Cache-control", "no-cache");
			pw = response.getWriter();
			
			String room_title	= request.getParameter("room_title");
			if (room_title == null || "".equals(room_title)) {
				pw.write("[{\"errMsg\":\"추가할 방 이름을 입력해 주십시오.\"}]");
			} else {
				synchronized (lssSubjTable) {
					lssSubjTable.put(room_title, new ArrayList<TUserBean>());
				}
				pw.write("[{}]");
			}
		} catch (Exception e) {
			e.printStackTrace();
			pw.write("[{\"errMsg\":\"추가 처리 중 예외가 발생하였습니다.\"}]");
		} finally {
			pw.flush();
			if (pw != null) pw.close();
		}
	}
	
	public boolean isLssSubj(TUserBean bean) {
		Enumeration<List<TUserBean>> e = lssSubjTable.elements();
		while(e.hasMoreElements()) {
			if(e.nextElement().contains(bean)) return true;
		}
		
		return false;
	}
	
	public List<String> getLssRoomTitle(TUserBean bean) {
		List<String> lssRoomTitle = new ArrayList<String>();
		Enumeration<String> e = lssSubjTable.keys();
		while(e.hasMoreElements()) {
			String room_title = e.nextElement();
			if (lssSubjTable.get(room_title).contains(bean)) {
				lssRoomTitle.add(room_title);
			}
		}
		return lssRoomTitle;
	}
	
	public Map<String, List<TUserBean>> getUserLssTable(TUserBean bean) {
		Map<String, List<TUserBean>> userLssTable = new Hashtable<String, List<TUserBean>>();
		Enumeration<String> e = lssSubjTable.keys();
		while(e.hasMoreElements()) {
			String room_title = e.nextElement();
			if (lssSubjTable.get(room_title).contains(bean)) {
				userLssTable.put(room_title, lssSubjTable.get(room_title));
			}
		}
		
		return userLssTable;
	}
}
