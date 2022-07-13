package com.ytcares.dao;

import org.springframework.stereotype.Repository;

import com.ytcares.bean.TUserLogBean;
import com.ytcares.common.YTCaresException;

@Repository
public class TUserLogDAO extends YTCaresAbstractDAO {
	public TUserLogDAO(){}
	
	//회원가입
	public int insertUserLog(TUserLogBean userLog) throws YTCaresException {
		if (userLog == null) throw new YTCaresException(getMessage(""));
		
		try{
			int result = sqlMapClientTemplate.update("userlog.insertUserLog", userLog);
			if (result != 1) {
				//TODO: 등록에 실패하였습니다. 메세지키 정의
				throw new YTCaresException("");
			}
			
			return result;
		} catch (Exception e) {
			throw new YTCaresException(e);
		}
	}

}
