package com.ytcares.dao;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;
import com.ytcares.bean.TPrchsOptBean;
import com.ytcares.common.YTCaresException;

@Repository
public class TPrchsOptDAO extends YTCaresAbstractDAO{
	
	private Logger logger = Logger.getLogger(TPrchsOptDAO.class);
	
	public TPrchsOptDAO(){}
	
	public int insertPrchsOptInfo(TPrchsOptBean tPrchsOpt) throws YTCaresException{
		if(tPrchsOpt == null){
			throw new YTCaresException(getMessage("error.fail.insert"));
		}
		int result=0;
		result = sqlMapClientTemplate.update("prchsopt.insertPrchsOptInfo", tPrchsOpt);
		
		return result;
	}
}
