package com.ytcares.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import com.ytcares.bean.TCodeBean;
import com.ytcares.common.YTCaresException;

@Repository
public class TCodeDAO extends YTCaresAbstractDAO{
	private Logger logger = Logger.getLogger(TCodeDAO.class);
	
	public TCodeDAO(){}
	
	public TCodeBean getCode(Map<String, String> codeSet) throws YTCaresException{
		TCodeBean code;		
		code = (TCodeBean)sqlMapClientTemplate.queryForObject("code.selectCode",codeSet);
		return code;
	}
	
	public int insertCodeInfo(TCodeBean tCodeBean) throws YTCaresException{
		if(tCodeBean == null){
			throw new YTCaresException(getMessage("error.fail.insert"));
		}
		
		int rs=0;
		rs = sqlMapClientTemplate.update("code.insertCodeInfo",tCodeBean);
		
		return rs;
	}
	
	public void updateDCodeList(Map<String, Object> param) {
		String mcode_cd		= ((String[])param.get("mcode_cd"))[0];
		String[] sqlAction	= (String[])param.get("sqlAction");
		String[] dcode_cd	= (String[])param.get("dcode_cd");
		String[] code_nm1	= (String[])param.get("code_nm1");
		String[] code_nm2	= (String[])param.get("code_nm2");
		String[] code_nm3	= (String[])param.get("code_nm3");
		String[] code_nm4	= (String[])param.get("code_nm4");
		String[] code_nm5	= (String[])param.get("code_nm5");
		String[] code_nm6	= (String[])param.get("code_nm6");
		String[] order_no	= (String[])param.get("order_no");
		
		List<Map<String, Object>> insertParamList = new ArrayList<Map<String,Object>>();
		List<Map<String, Object>> updateParamList = new ArrayList<Map<String,Object>>();
		List<Map<String, Object>> deleteParamList = new ArrayList<Map<String,Object>>();
		
		for (int i = 0; i < sqlAction.length; i++) {
			Map<String, Object> sqlParam = new HashMap<String, Object>();
			sqlParam.put("mcode_cd", mcode_cd);
			sqlParam.put("dcode_cd", dcode_cd[i]);
			sqlParam.put("code_nm1", code_nm1[i]);
			sqlParam.put("code_nm2", code_nm2[i]);
			sqlParam.put("code_nm3", code_nm3[i]);
			sqlParam.put("code_nm4", code_nm4[i]);
			sqlParam.put("code_nm5", code_nm5[i]);
			sqlParam.put("code_nm6", code_nm6[i]);
			sqlParam.put("order_no", order_no[i]);
			
			String sql = sqlAction[i];
			if ("insert".equals(sql)) {
				insertParamList.add(sqlParam);
			} else if ("update".equals(sql)) {
				updateParamList.add(sqlParam);
			} else if ("delete".equals(sql)) {
				deleteParamList.add(sqlParam);
			}
		}
		
		if (!insertParamList.isEmpty()) {
			executeBatch("code.insertDcode", insertParamList);
		}
		if (!updateParamList.isEmpty()) {
			executeBatch("code.updateDcode", updateParamList);
		}
		if (!deleteParamList.isEmpty()) {
			executeBatch("code.deleteDcode", deleteParamList);
		}
	}
}
