package com.ytcares.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import com.ytcares.bean.TMcodeBean;
import com.ytcares.common.YTCaresException;

@Repository
public class TMcodeDAO extends YTCaresAbstractDAO{
	private Logger logger = Logger.getLogger(TMcodeDAO.class);
	
	public TMcodeDAO(){}
	
	public List<TMcodeBean> selectMcodeList() throws YTCaresException{//상품 옵션을 추가할때 마스터 코드를 불러오는 쿼리
		return selectMCodeList(null);
	}

	@SuppressWarnings("unchecked")
	public List<TMcodeBean> selectMCodeList(String isAll) throws YTCaresException{
		List<?> mcodeList = sqlMapClientTemplate.queryForList("mcode.selectMCodeList", isAll);
		if (mcodeList != null) {
			return (List<TMcodeBean>)mcodeList;
		} else {
			return new ArrayList<TMcodeBean>();
		}
	}
	
	public String selectMCodeMax() throws YTCaresException{
		return (String)sqlMapClientTemplate.queryForObject("mcode.selectMCodeMax");
	}
	
	public int insertMcodeInfo(TMcodeBean tMcodeBean) throws YTCaresException{
		if(tMcodeBean == null){
			throw new YTCaresException(getMessage("error.fail.insert"));
		}
		
		int rs=0;
		
		rs = sqlMapClientTemplate.update("mcode.insertMCodeInfo",tMcodeBean);
		
		return rs;
	}
}
