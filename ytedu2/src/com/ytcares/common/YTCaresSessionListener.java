package com.ytcares.common;

import java.util.Enumeration;
import java.util.Hashtable;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

import org.apache.log4j.Logger;

import com.ytcares.bean.TUserBean;
import com.ytcares.common.YTCaresConstants.Common;

public class YTCaresSessionListener implements HttpSessionAttributeListener {
	private static YTCaresSessionListener loginManager = null;
    private static Hashtable<String, TUserBean> loginUsers = new Hashtable<String, TUserBean>();
    private Logger logger = Logger.getLogger(YTCaresSessionListener.class);
    
    public YTCaresSessionListener(){
    	super();
    	loginManager = this;
    }

    public static synchronized YTCaresSessionListener getInstance(){
    	if(loginManager == null){
    		loginManager = new YTCaresSessionListener();
    	}
    	return loginManager;
    }
    
	@Override
	public void attributeAdded(HttpSessionBindingEvent event) {
    	if (event.getName().equals(Common.session_user_bean)) {
    		HttpSession session = event.getSession();
    		logger.info("## [YTCaresUserInfoUnBinded] Event:" + event.getName());
    		if (Common.session_user_bean.equals(event.getName())) {
	    		TUserBean userBean = (TUserBean)event.getValue();
	    		loginUsers.put(session.getId(), userBean);
	    		
	    		logger.info("## [YTCaresUserInfoBinded] SessionId:" + event.getSession().getId() + " UserId:" + userBean.getUser_id());
    		}
    	}
	}

	@Override
	public void attributeRemoved(HttpSessionBindingEvent event) {
    	if (Common.session_user_bean.equals(event.getName())) {
    		HttpSession session = event.getSession();
    		if (Common.session_user_bean.equals(event.getName())) {
	    		logger.info("## [YTCaresUserInfoUnBinded] SessionId:" + session.getId() + " UserId:" + loginUsers.get(session.getId()));
	    		synchronized (this) {
	    			loginUsers.remove(session.getId());
				}
    		}
    	}
	}

	@Override
	public void attributeReplaced(HttpSessionBindingEvent event) {
		//attributeRemoved(event);
	}
	
    public synchronized boolean isAlreadLoggedOn(String id){
    	Enumeration<TUserBean> e = loginUsers.elements();
    	TUserBean ele = null;
    	boolean isLoggedOn = false;
    	while(e.hasMoreElements()){
    		ele = (TUserBean)e.nextElement();
    		if(id.equals(ele.getUser_id())){
    			isLoggedOn = true;
    			break;
    		}
    	}
    	return isLoggedOn;
    }

    public synchronized void deleteUser(String userid){
    	Enumeration<String> e = loginUsers.keys();
    	String sessionId = null;
    	while(e.hasMoreElements()){
    		sessionId = e.nextElement();
    		String userId = loginUsers.get(sessionId).getUser_id();
    		if(userid.equals(userId)){
    			loginUsers.remove(sessionId);
    			break;
    		}
    	}
    }
    
    public synchronized String getUserID(String sessionId){
    	TUserBean bean = loginUsers.get(sessionId);
    	if (bean != null) {
    		return bean.getUser_id();
    	} else {
    		return "";
    	}
    }
 
    public synchronized int getUserCount(){
		return loginUsers.size();
    }
 
    public synchronized TUserBean getUserBean(String user_id) {
    	Enumeration<TUserBean> e = loginUsers.elements();
    	TUserBean tUserBean = null;
    	while(e.hasMoreElements()){
    		tUserBean = (TUserBean)e.nextElement();
    		if (tUserBean == null) {
    			continue; 
    		}
    		if(user_id.equals(tUserBean.getUser_id())){
    			return tUserBean;
    		}
    	}
    	return tUserBean;
    }
};