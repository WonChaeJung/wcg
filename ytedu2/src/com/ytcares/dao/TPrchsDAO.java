package com.ytcares.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ytcares.bean.TPrchsBean;
import com.ytcares.common.YTCaresException;

@Repository
public class TPrchsDAO extends YTCaresAbstractDAO {
	public TPrchsDAO(){}
	//판매관리 건수 취득
	public int selectUserPrchsCount(Map<String, Object>param){
		Object count = sqlMapClientTemplate.queryForObject("prchs.selectUserPrchsCount",param);
		return (Integer)count;
	}
	
	//판매관리 리스트 검색
	public List selectUserPrchsList(Map<String, Object>param) throws YTCaresException{
		List srchRlt = sqlMapClientTemplate.queryForList("prchs.selectUserPrchsList", param);
		return srchRlt;
	}
	//상품구매상태 변경 - 변경된 상태에 따른 DATE값 변경
	public int updateUserPrchsInfo(Map<String,Object>param) throws YTCaresException{
		int rlt = sqlMapClientTemplate.update("prchs.updateUserPrchsInfo",param);
		return rlt;
	}
	//구매테이블에 구매정보 삽입
	public int insertPrchsInfo(TPrchsBean tPrchs) throws YTCaresException{
		int result = sqlMapClientTemplate.update("prchs.insertPrchsInfo", tPrchs);
		return result;
	}

	//상태별 현황 검색 상세 adPrchsStatListR.jsp >> AdAccmServiceImpl >> TprchsDAO
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectSearchStatDetList(Map<String, Object> param){
		List<Map<String, Object>> statListRlt = sqlMapClientTemplate.queryForList("prchs.selectSearchStatDetList", param);
		return statListRlt;
	}
	//상태별 현황 건수 
	public int selectSearchStatDetCount(Map<String,Object>param){
		Object count = sqlMapClientTemplate.queryForObject("prchs.selectSearchStatDetCount", param);
		return (Integer)count;
	}
	public List<String> selectAgencyName(){
		List<String> rlt = sqlMapClientTemplate.queryForList("prchs.selectAgencyName");
		return rlt;
	}
}
