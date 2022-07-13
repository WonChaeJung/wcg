package com.ytcares.dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import com.ytcares.bean.TCsmtOptBean;
import com.ytcares.common.YTCaresException;

@Repository
public class TCsmtOptDAO extends YTCaresAbstractDAO{
	private Logger logger = Logger.getLogger(TCsmtOptDAO.class);
	
	public TCsmtOptDAO(){}
	
	@SuppressWarnings("unchecked")
	public List<TCsmtOptBean> selectCsmtOptList(String csmt_id) throws YTCaresException{
		if(csmt_id == null || "".equals(csmt_id)){
			throw new YTCaresException(getMessage("error.fail.check"));
		}
		
		List<TCsmtOptBean> tCsmtOptList=new ArrayList<TCsmtOptBean>();
		
		tCsmtOptList = (List<TCsmtOptBean>) sqlMapClientTemplate.queryForList("csmtopt.selectCsmtOptList", csmt_id);
		
		if(tCsmtOptList==null)
			tCsmtOptList=null;
		
		return tCsmtOptList;
	}
	
	public int insertCsmtOptInfo(TCsmtOptBean tCsmtOptBean) throws YTCaresException{
		if(tCsmtOptBean == null){
			throw new YTCaresException(getMessage("error.fail.insert"));
		}
		int rs=0;
		
		rs = sqlMapClientTemplate.update("csmtopt.insertCsmtOptInfo", tCsmtOptBean);
		return rs;
	}
	
	public int updateCsmtOptInfo(TCsmtOptBean tCsmtOptBean) throws YTCaresException{
		if(tCsmtOptBean == null){
			throw new YTCaresException(getMessage("error.fail.update"));
		}
		int rs=0;
		
		rs = sqlMapClientTemplate.update("csmtopt.updateCsmtOptInfo", tCsmtOptBean);
		return rs;
	}
	
	public int deleteCsmtOpt(String csmt_id) throws YTCaresException{
		int rs = 0;
		if(csmt_id == null){
			throw new YTCaresException(getMessage("error.fail.delete"));
		}
		rs = sqlMapClientTemplate.delete("csmtopt.deleteCsmtOpt", csmt_id);
		return rs;
	}
}
