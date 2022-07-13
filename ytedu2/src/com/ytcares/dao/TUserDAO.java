package com.ytcares.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ytcares.bean.TUserBean;
import com.ytcares.common.YTCaresException;

@Repository
public class TUserDAO extends YTCaresAbstractDAO {
	public TUserDAO(){}
	
	@SuppressWarnings("unchecked")
	public List<Map> adminSelectChildTree(String user_id) {
		List<?> userTreeList = sqlMapClientTemplate.queryForList("user.adminSelectChildTree");
		if (userTreeList == null) {
			return null;
		} else {
			return (List<Map>)userTreeList;
		}
	}
	@SuppressWarnings("unchecked")
	public List<TUserBean> selectUserList(String[] user_id) throws YTCaresException {
		if (user_id == null || user_id.length == 0) {
			throw new YTCaresException(getMessage("error.invalid.request.param"));
		}
		Map<String, String[]> param = new HashMap<String, String[]>();
		param.put("user_id", user_id);
		
		List<?> userList = sqlMapClientTemplate.queryForList("user.selectUserListByArr", param);
		if (userList != null) {
			return (List<TUserBean>)userList;
		} else {
			return null;
		}
	}
	/**
	 * <pre>
	 * 유저정보취득
	 * </pre>
	 * @param id 
	 * @return
	 * @throws YTCaresException
	 */
	public TUserBean selectUserInfo(String user_id) throws YTCaresException {
		if (user_id == null || "".equals(user_id)) {
			//TODO : 메세지 정의
			throw new YTCaresException(getMessage("error.invalid.request.param"));
		}
		
		Object obj = sqlMapClientTemplate.queryForObject("user.selectUserInfo", user_id);
		if (obj != null) {
			return (TUserBean)obj;
		} else {
			return null;
		}
	}
	//아이디찾기
	public String selectIdSrch(Map<String, Object>srchMapPw) throws YTCaresException{

		String rlt = (String)sqlMapClientTemplate.queryForObject("user.selectIdSrch", srchMapPw);
		
		return rlt;
	}
	//패스워드찾기
	public String selectPwSrch(Map<String, Object>srchMapPw) throws YTCaresException{
		
		String rlt = (String)sqlMapClientTemplate.queryForObject("user.selectPwSrch", srchMapPw);
		return rlt;
	}
	
	//회원가입
	public int insertUserInfo(Map<String, Object> param) throws YTCaresException {
		return sqlMapClientTemplate.update("user.insertUserInfo", param);
	}
	@SuppressWarnings("unchecked")
	public Object selectAgencyIdSrch() throws YTCaresException{
		Object obj = sqlMapClientTemplate.queryForList("user.selectAgencyIdSrch");
		if(obj != null){
			return obj;
		}else{
			return null;
		}
	}
	
	public int updateUserInfo(Map<String, Object> param) throws YTCaresException{
		int rlt = sqlMapClientTemplate.update("user.updateUserInfo", param);
		return rlt;
	}
	//가맹점명검색
	public Object selectSearchAgency(Map<String, Object> param) throws YTCaresException{
		Object obj = sqlMapClientTemplate.queryForList("user.selectSearchAgency", param);
		return obj;
	}
	//가맹점검색 총건수
	public int selectSearchAgencyTotCnt(Map<String, Object> param) throws YTCaresException{
		int count = (Integer)sqlMapClientTemplate.queryForObject("user.selectSearchAgencyTotCnt", param);
		return count;
	}
	//가맹점등록정보 변경
	public int updateAgencyInfo(Map<String, Object>param)throws YTCaresException{
		int rlt = sqlMapClientTemplate.update("user.updateAgencyInfo", param);
		return rlt;
	}
}
