package com.ytcares.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ytcares.bean.VPrchsAccmBean;

@Repository
public class VPrchsAccmDAO extends YTCaresAbstractDAO {
	public VPrchsAccmDAO(){}
	//판매관리 건수 취득
	public int selectPrchsAccmCount(Map<String, Object>param) {
		Object count = sqlMapClientTemplate.queryForObject("vprchs.selectPrchsAccmCount",param);
		return (Integer)count;
	}
	
	@SuppressWarnings("unchecked")
	public List<VPrchsAccmBean> selectPrchsAccmList(Map<String, Object>param) {
		List<?> prchsList = sqlMapClientTemplate.queryForList("vprchs.selectPrchsAccmList",param);
		if (prchsList == null) {
			return null;
		} else {
			return (List<VPrchsAccmBean>)prchsList;
		}
	}
	
	//현재 적립금현황 및 각 구매상태건수 조회
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectStatSummaryCount(String user_id){
		Object statCount = sqlMapClientTemplate.queryForObject("vprchs.selectStatSummaryCount", user_id);
		return (Map<String, Object>)statCount;
	}
	
	//적립금현황리스트 카운트
	public int selectAccmPntCount(Map<String, Object> param){
		Object accmStatCount = sqlMapClientTemplate.queryForObject("vprchs.selectAccmPntCount", param);
		return (Integer)accmStatCount;
	}
	
	//적립금현황리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectAccmPntList(Map<String, Object> param){
		List<?> accmStatList = sqlMapClientTemplate.queryForList("vprchs.selectAccmPntList", param);
		return (List<Map<String, Object>>)accmStatList;
	}
	//적립금현황리스트
	@SuppressWarnings("unchecked")
	public VPrchsAccmBean selectPrchsDetailInfo(String prchs_seq_no){
		Object obj = sqlMapClientTemplate.queryForObject("vprchs.selectPrchsDetailInfo", prchs_seq_no);
		return (VPrchsAccmBean)obj;
	}
}
