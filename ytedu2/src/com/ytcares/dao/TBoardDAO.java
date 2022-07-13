package com.ytcares.dao;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import com.ytcares.bean.TBankAccBean;
import com.ytcares.bean.TBoardBean;
import com.ytcares.bean.TCsmtBean;
import com.ytcares.bean.TUserBean;
import com.ytcares.common.YTCaresException;

@Repository
public class TBoardDAO extends YTCaresAbstractDAO{
	private Logger logger = Logger.getLogger(TBoardDAO.class);
	
	public TBoardDAO(){}
	
	//게시판 리스트 카운트
	public int selectBoardListCount(Map<String, Object> param){
		Object obj = sqlMapClientTemplate.queryForObject("board.selectBoardListCount", param);
		if (obj != null) {
			return (Integer)obj;
		} else {
			return 0;
		}
	}
	
	//게시판 리스트
	@SuppressWarnings("unchecked")
	public List<TBoardBean> selectBoardList(Map<String, Object> param){
		Object obj =  sqlMapClientTemplate.queryForList("board.selectBoardList", param);
		if(obj != null){
			return (List<TBoardBean>)obj;
		}else{
			return null;
		}
	}
	
	//게시판 글 등록
	public int userCallBoard(TBoardBean bean){
		int result = 0;
		result = sqlMapClientTemplate.update("board.insertBoard", bean);
		
		return result;
	}
	
	//게시판 글 상세보기
	public TBoardBean selectBoardInfo(Map<String, Object> param){
		Object obj = sqlMapClientTemplate.queryForObject ("board.selectBoardInfo", param);
		if(obj != null){
			return (TBoardBean)obj;
		}else {
			return null;
		}
	}
	
	//게시판 글 조회성공 시 조회수 카운트
	public int updateReadCount(TBoardBean bean){
		int result = 0;
		result = sqlMapClientTemplate.update("board.updateReadCount", bean);
		
		return result;
	}
	
	//수정 전 정보 불러오기 (관리자)
	public TBoardBean adminUpdateBoardInfo(Map<String, Object> param){
		Object obj = sqlMapClientTemplate.queryForObject ("board.selectBoardInfo", param);
		if(obj != null){
			return (TBoardBean)obj;
		}else {
			return null;
		}
	}
	
	//게시판 글 수정 (관리자)
	public int adminUpdateBoard(TBoardBean bean){
		int result = 0;
		result = sqlMapClientTemplate.update("board.updateBoard", bean);
	
		return result;
	}
	
	//게시판 글 삭제 (관리자)
	public int adminDeleteBoard(String seq_no, String reg_id, String category, String sub_category){
		TBoardBean bean = new TBoardBean();
		bean.setReg_id(reg_id);
		bean.setCategory(category);
		bean.setSub_category(sub_category);
		int no = Integer.parseInt(seq_no);
		bean.setSeq_no(no);
		
		int result = 0;
		result = sqlMapClientTemplate.update("board.deleteBoard", bean);
		
		return result;
	}
	
	//공지사항 게시판 글 등록 (관리자)
	public int adminInsertBoard(TBoardBean bean){
		int result = 0;
		result = sqlMapClientTemplate.update("board.insertBoard", bean);
	
		return result;
	}
	
	//FAQ 답글달기 전 세팅 (관리자)
	public int adminUpdateReple(TBoardBean bean){
		int result = 0;
		result = sqlMapClientTemplate.update("board.updateReple", bean);
	
		return result;
	}
	
	//FAQ 답글달기 (관리자)
	public int adminInsertReple(TBoardBean bean){
		int result = 0;
		result = sqlMapClientTemplate.update("board.insertReple", bean);
	
		return result;
	}
	
	//온라인강의 리스트
	public int insertAdminElearn(Map<String, Object>param){
		return sqlMapClientTemplate.update("board.insertAdminElearn", param);
	}
	//온라인강의 리스트 카운트
	public int selectAdminElearnCount(Map<String, Object> param){
		int rlt = (Integer)sqlMapClientTemplate.queryForObject("board.selectAdminElearnCount",param);
		
		return rlt;
	}
	//온라인강의 정보 검색 (관리자)
	public Object selectAdminElearn(Map<String, Object> param){
		Object obj = sqlMapClientTemplate.queryForList("board.selectAdminElearn", param);
		
		return obj;
	}
	//변경할 강좌에 대한 정보 검색 (관리자)
	public Map<String, Object> selectElearnUpdateInfoSrch(Map<String, Object> param){
		Map<String, Object> result = (Map<String, Object>) sqlMapClientTemplate.queryForObject("board.selectElearnUpdateInfoSrch",param);
		
		return result;
	}
	//온라인강의 정보 변경 (관리자)
	public int updateAdminElearn(Map<String, Object> param){
		int result = sqlMapClientTemplate.update("board.updateAdminElearn",param);
		
		return result;
	}
	//온라인강의 정보 삭제 (관리자)
	public int deleteAdminElearn(Map<String, Object> param){
		int result = sqlMapClientTemplate.delete("board.deleteAdminElearn",param);
		
		return result;
	}
	

}
