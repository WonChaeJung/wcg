package com.ytcares.dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import com.ytcares.bean.TCsmtBean;
import com.ytcares.common.YTCaresException;

@Repository
public class TCsmtDAO extends YTCaresAbstractDAO{
	private Logger logger = Logger.getLogger(TCsmtDAO.class);
	
	public TCsmtDAO(){}
	
	@SuppressWarnings("unchecked")
	public List<TCsmtBean> selectCsmtList(Map<String, Object> param) throws YTCaresException{
		if(param == null || "".equals(param)){
			throw new YTCaresException(getMessage("error.check.goods"));
		}
		List<TCsmtBean> tCsmtList=new ArrayList<TCsmtBean>();
		tCsmtList=(List<TCsmtBean>)sqlMapClientTemplate.queryForList("csmt.selectCsmtList",param);
		
		return tCsmtList;
	}
	public List<TCsmtBean> selectCsmtAllList(Map<String, Object> param) throws YTCaresException{
		if(param == null || "".equals(param)){
			throw new YTCaresException(getMessage("error.check.goods"));
		}
		List<TCsmtBean> tCsmtList=new ArrayList<TCsmtBean>();
		tCsmtList=(List<TCsmtBean>)sqlMapClientTemplate.queryForList("csmt.selectCsmtAllList",param);
		
		return tCsmtList;
	}
	public TCsmtBean selectCsmtInfo(String csmt_id) throws YTCaresException{
		TCsmtBean tCsmt;
		if(csmt_id == null || "".equals(csmt_id)){
			throw new YTCaresException(getMessage("error.check.goods"));
		}
		
		tCsmt = (TCsmtBean)sqlMapClientTemplate.queryForObject("csmt.selectCsmtInfo", csmt_id);
		
		return tCsmt;
	}
	
	@SuppressWarnings("unchecked")
	public List<TCsmtBean> selectCsmtInfos(Map param) {
		return (List<TCsmtBean>)sqlMapClientTemplate.queryForList("csmt.selectCsmtInfos", param);
	}
	
	public int selectCsmtListCount(Map<String, Object> param) throws YTCaresException{
		
		Object obj=null;
		
		obj= sqlMapClientTemplate.queryForObject("csmt.selectCsmtCount", param);
		
		if(obj == null){
			return 0;
		}
		else{
			int count = (Integer)obj;
			return count;
		}
	}
	
	public int selectCsmtCount() throws YTCaresException{
		
		Object obj=null;
		
		obj= sqlMapClientTemplate.queryForObject("csmt.selectCsmtAllCount");
		
		if(obj == null){
			return 0;
		}
		else{
			int count = (Integer)obj;
			return count;
		}
	}
	
	public String selectCsmtId(String csmt_kind_cd) throws YTCaresException {
		String csmt_id = (String)sqlMapClientTemplate.queryForObject("csmt.selectCsmtId", csmt_kind_cd);
		
		return csmt_id;
	}
	
	public int insertCsmt(TCsmtBean tCsmt) throws YTCaresException{
		int rs=0;
		if(tCsmt == null){
			throw new YTCaresException(getMessage("error.fail.insert"));
		}
		
		try{
			rs = sqlMapClientTemplate.update("csmt.insertCsmt", tCsmt);
		}catch(Exception e){
			throw new YTCaresException(e);
		}
		
		return rs;
	}
	
	public int deleteCsmtU(String csmt_id) throws YTCaresException{
		int rs=0;
		if(csmt_id == null){
			throw new YTCaresException(getMessage("error.fail.delete"));
		}
		
		rs = sqlMapClientTemplate.update("csmt.deleteCsmt",csmt_id);
		
		return rs;
	}
	
	
	public int updateCsmtU(TCsmtBean tCsmt) throws YTCaresException{
		int rs=0;
		if(tCsmt == null){
			throw new YTCaresException(getMessage("error.fail.update"));
		}
		
		rs = sqlMapClientTemplate.update("csmt.updateCsmt",tCsmt);
		
		
		return rs;
	}
	public int updateCsmtStock(Map<String, Object> csmtInfo) throws YTCaresException{
		int rs=0;
		if(csmtInfo == null){
			throw new YTCaresException(getMessage("error.check.goods"));
		}
		
		rs = sqlMapClientTemplate.update("csmt.updateCsmtStock",csmtInfo); 
		return rs;
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMainCsmtList() {
		List<Map<String, Object>> rlt = sqlMapClientTemplate.queryForList("csmt.selectMainCsmtList");
		return rlt;
	}
}
