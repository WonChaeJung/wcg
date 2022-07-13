package com.ytcares.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import com.ytcares.common.YTCaresException;

@Repository
public class TAccmDAO extends YTCaresAbstractDAO{
	private Logger logger = Logger.getLogger(TAccmDAO.class);
	
	public TAccmDAO(){}
	
	public int insertAccmPnt(Map<String, Object> param) throws YTCaresException {
		if (param == null) {
			throw new YTCaresException(getMessage("error.invalid.request.param"));
		}
		return sqlMapClientTemplate.update("accm.insertAccmPnt", param);
	}
	
	public int mergeAccmPnt(Map<String, Object> param) throws YTCaresException{
		if (param == null ||
				param.get("prchs_seq_no") == null ||
				"".equals(param.get("prchs_seq_no")) ||
				param.get("accm_pnt") == null ||
				"".equals(param.get("prchs_seq_no")) ||
				param.get("family_id") == null) {
			throw new YTCaresException(getMessage("error.invalid.request.param"));
		}
		
		return sqlMapClientTemplate.update("accm.mergeAccmPnt", param);
	}
	
	public int[] updateAccmPntStlmnt(Map<String, Object> param) throws YTCaresException {
		if (param == null || param.get("accmPntDetail") == null) {
			throw new YTCaresException(getMessage("error.invalid.request.param"));
		}
		
		String[] accmPntDetails = (String[])param.get("accmPntDetail");
		if (accmPntDetails.length == 0) {
			throw new YTCaresException(getMessage("error.invalid.request.param"));
		}
		
		List<Map<String, Object>> queryParam = new ArrayList<Map<String, Object>>();
		for (int i = 0; i < accmPntDetails.length; i++) {
			Map<String, Object> map = new HashMap<String, Object>();
			String[] accmPntDetail = accmPntDetails[i].split(",");
			if (accmPntDetail == null || accmPntDetail.length != 2) {
				throw new YTCaresException(getMessage("error.invalid.request.param"));
			}
			map.put("user_id",		accmPntDetail[0]);
			map.put("prchs_seq_no", accmPntDetail[1]);		
			
			queryParam.add(map);
		}
		
		Object obj = executeBatch("accm.updateAccmPntStlmnt", queryParam);
		
		return (int[])obj;
	}

}
