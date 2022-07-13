package com.ytcares.dao;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import com.ytcares.bean.TPrchsDetBean;
import com.ytcares.common.YTCaresException;

@Repository
public class TPrchsDetDAO extends YTCaresAbstractDAO{
	
	private Logger logger = Logger.getLogger(TPrchsDetDAO.class);
	
	public TPrchsDetDAO(){}
	
	public int insertPrchsDetInfo(TPrchsDetBean tPrchsDet) throws YTCaresException{
		if(tPrchsDet == null){
			throw new YTCaresException(getMessage("error.fail.insert"));
		}
		int result=0;
		result = sqlMapClientTemplate.update("prchsdet.insertPrchsDetInfo", tPrchsDet);
		
		return result;
	}
}
