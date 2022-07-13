package com.ytcares.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import com.ytcares.bean.TLectureAppBean;
import com.ytcares.bean.TLectureBean;
import com.ytcares.bean.TLectureReqBean;
import com.ytcares.bean.TUserBean;

@Repository
public class TLectureDAO extends YTCaresAbstractDAO{
	@SuppressWarnings("unused")
	private Logger logger = Logger.getLogger(TLectureDAO.class);
	
	public TLectureDAO(){}
	
	public int selectLecListCount(Map<String, Object> param){
		Object obj = sqlMapClientTemplate.queryForObject("lecture.selectLecListCount", param);
		if(obj == null){
			return 0;
		}else{
			return (Integer)obj;
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<TLectureBean> selectLecList(Map<String, Object> param){
		return sqlMapClientTemplate.queryForList("lecture.selectLecList", param);
	}
	
	public int updateLecListReadCount(Map<String, Object> param){
		Object obj = sqlMapClientTemplate.update("lecture.updateLecListReadCount", param);
		if(obj == null){
			return 0;
		}else{
			return (Integer)obj;
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<TLectureBean> userSelectLectureInfo(Map<String, Object> param){
		return sqlMapClientTemplate.queryForList("lecture.userSelectLectureInfo", param);
	}
	
	@SuppressWarnings("unchecked")
	public List<TLectureAppBean> selectLectureAppInfo(Map<String, Object> param){
		return sqlMapClientTemplate.queryForList("lecture.selectLectureAppInfo", param);
	}
	
	public int memberInsertLecApp(Map<String, Object> param){
		return sqlMapClientTemplate.update("lecture.memberInsertLecApp", param);
	}
	
	public int userInsertLecReq(Map<String, Object> param){
		return sqlMapClientTemplate.update("lecture.userInsertLecReq", param);
	}
	
	public int selectLectureReqListCount(Map<String, Object> param){
		Object obj = sqlMapClientTemplate.queryForObject("lecture.selectLectureReqListCount", param);
		if(obj == null){
			return 0;
		}else{
			return (Integer)obj;
		}
	}
	
	@SuppressWarnings("unchecked")
	public List selectLectureReqList(Map<String, Object> param){
		return sqlMapClientTemplate.queryForList("lecture.selectLectureReqList", param);
	}
	
	@SuppressWarnings("unchecked")
	public List selectUserInfo(Map<String, Object> param){
		return sqlMapClientTemplate.queryForList("lecture.selectUserInfo", param);
	}
	
	@SuppressWarnings("unchecked")
	public List<TLectureReqBean> selectLectureReqInfo(Map<String, Object> param){
		return sqlMapClientTemplate.queryForList("lecture.selectLectureReqInfo", param);
	}
	
	public int adminSelectLectureListCount(Map<String, Object> param){
		Object obj = sqlMapClientTemplate.queryForObject("lecture.adminSelectLectureListCount", param);
		if(obj == null){
			return 0;
		}else{
			return (Integer)obj;
		}
	}	
	
	@SuppressWarnings("unchecked")
	public List<TLectureBean> adminSelectLectureList(Map<String, Object> param){
		return sqlMapClientTemplate.queryForList("lecture.adminSelectLectureList", param);
	}
	
	@SuppressWarnings("unchecked")
	public List<TLectureBean> adminSelectLecInfo(Map<String, Object> param){
		return sqlMapClientTemplate.queryForList("lecture.adminSelectLecInfo", param);
	}
	
	@SuppressWarnings("unchecked")
	public List<TUserBean> adminSelectUserInfo(Map<String, Object> param){
		return sqlMapClientTemplate.queryForList("lecture.adminSelectUserInfo", param);
	}
	
	public int adminInsertLecInfo(Map<String, Object> param){
		Object obj = sqlMapClientTemplate.update("lecture.adminInsertLecInfo", param);
		if(obj == null){
			return 0;
		}else{
			return (Integer)obj;
		}
	}
	
	public int adminUpdateLecInfo(Map<String, Object> param){
		Object obj = sqlMapClientTemplate.update("lecture.adminUpdateLecInfo", param);
		if(obj == null){
			return 0;
		}else{
			return (Integer)obj;
		}
	}
	
	public int adminDeleteLecInfo(Map<String, Object> param){
		Object obj = sqlMapClientTemplate.update("lecture.adminDeleteLecInfo", param);
		if(obj == null){
			return 0;
		}else{
			return (Integer)obj;
		}
	}
	
	public int adminSelectLecAppListCount(Map<String, Object> param){
		Object obj = sqlMapClientTemplate.queryForObject("lecture.adminSelectLecAppListCount", param);
		if(obj == null){
			return 0;
		}else{
			return (Integer)obj;
		}
	}	
	
	@SuppressWarnings("unchecked")
	public List adminSelectLecAppList(Map<String, Object> param){
		return sqlMapClientTemplate.queryForList("lecture.adminSelectLecAppList", param);
	}
	
	public void adminUpdateLecAppInfo(Map<String, Object> param){
		String lec_seq_no	= String.valueOf(param.get("lec_seq_no"));
		String[] user_id 	= (String[])param.get("user_id");
		String[] app_stat_cd= (String[])param.get("app_stat_cd");
		String[] rmrks 		= (String[])param.get("rmrks");
		
		List<Map<String, Object>> qparam = new ArrayList<Map<String, Object>>();
		for (int i = 0; i <user_id.length; i++) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("lec_seq_no", lec_seq_no);
			map.put("user_id", user_id[i]);
			map.put("app_stat_cd", app_stat_cd[i]);
			map.put("rmrks", rmrks[i]);
			
			qparam.add(map);
		}
		executeBatch("lecture.adminUpdateLecAppInfo", qparam);
	}
	
	@SuppressWarnings("unchecked")
	public List adminSelectLecReqInfo(Map<String, Object> param){
		return sqlMapClientTemplate.queryForList("lecture.adminSelectLecReqInfo", param);
	}
	
	public int adminDeleteLecReq(Map<String, Object> param){
		Object obj = sqlMapClientTemplate.update("lecture.adminDeleteLecReq", param);
		if(obj == null){
			return 0;
		}else{
			return (Integer)obj;
		}
	}
	
	public int agencySelectLectureCount(String lec_host) {
		Object obj = sqlMapClientTemplate.queryForObject("lecture.agencySelectLectureCount", lec_host);
		if(obj == null){
			return 0;
		}else{
			return (Integer)obj;
		}
	}	
	
	@SuppressWarnings("unchecked")
	public List<TLectureBean> agencySelectLectureList(Map<String, Object> param) {
		return (List<TLectureBean>)sqlMapClientTemplate.queryForList("lecture.agencySelectLectureList", param);
	}
	
	public int agencySelectLecAppCount(Map<String, Object> param) {
		Object obj = sqlMapClientTemplate.queryForObject("lecture.agencySelectLecAppCount", param);
		if(obj == null){
			return 0;
		}else{
			return (Integer)obj;
		}
	}	
	
	@SuppressWarnings("unchecked")
	public List<TLectureAppBean> agencySelectLecAppList(Map<String, Object> param) {
		return (List<TLectureAppBean>)sqlMapClientTemplate.queryForList("lecture.agencySelectLecAppList", param);
	}
	
	public void agencyUpdateLecApp(Map<String, Object> param) {
		String lec_seq_no	= String.valueOf(param.get("lec_seq_no"));
		String lec_host		= String.valueOf(param.get("lec_host"));
		String[] user_id 	= (String[])param.get("user_id");
		String[] app_stat_cd= (String[])param.get("app_stat_cd");
		String[] rmrks 		= (String[])param.get("rmrks");
		
		List<Map<String, Object>> qparam = new ArrayList<Map<String, Object>>();
		for (int i = 0; i <user_id.length; i++) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("lec_seq_no", lec_seq_no);
			map.put("lec_host", lec_host);
			map.put("user_id", user_id[i]);
			map.put("app_stat_cd", app_stat_cd[i]);
			map.put("rmrks", rmrks[i]);
			
			qparam.add(map);
		}
		executeBatch("lecture.userUpdateLecApp", qparam);
	}
	
	@SuppressWarnings("unchecked")
	public List<TLectureBean> selectMainLectureList(Map<String, Object> param){
		List<TLectureBean> rlt = sqlMapClientTemplate.queryForList("lecture.selectMainLectureList", param);
		return rlt;
	}
}
