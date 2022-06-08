package egovframework.ibsheetTemplate.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import egovframework.ib.util.IBSheetUtil;
import egovframework.ibsheetTemplate.service.UploadService;
import egovframework.mapper.UploadMapper;


@Transactional
@Service("uploadService")
public class UploadServiceImpl implements UploadService {

	
	
	/** searchModeDAO */
    @Resource(name="uploadMapper")
    private UploadMapper uploadDAO;
    
    
    @Override
	public int boardInsert(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return uploadDAO.boardInsert(map);
	}

	@Override
	public void boardDelete(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		uploadDAO.boardDelete(map);
	}

	@Override
	public void boardUpdate(Map<String, Object> map) throws Exception {
		uploadDAO.boardUpdate(map);
	}

	@Override
	public void fileInsert(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		uploadDAO.fileInsert(map);
	}

	@Override
	public void fileDelete(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		uploadDAO.fileDelete(map);
	}

	@Override
	public void fileUpdate(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		uploadDAO.fileUpdate(map);
	}
	
	@Override
	public List board2Select(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return uploadDAO.board2Select(map);
	}

	@Transactional
	public void board2Insert(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		uploadDAO.board2Insert(map);
	}

	@Transactional
	public void board2Update(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		uploadDAO.board2Update(map);
	}

	@Transactional
	public void board2Delete(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		uploadDAO.board2Delete(map);
	}

	@Override
	public List boardSelect(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return uploadDAO.boardSelect(map);
	}

	@Override
	public String saveBoard(Map<String, Object> ibuploadMap) throws Exception {
		IBSheetUtil ibutil = new IBSheetUtil();
		String msg = "";
		String bbs_no = "";
		if(ibuploadMap!=null){	
			ibutil.mapPrint(ibuploadMap);
			if(ibuploadMap.get("frm_no")!=null){
				bbs_no = (String)ibuploadMap.get("frm_no");
			}
			
			if(ibuploadMap.get("isDelete")!=null){ //1. 삭제 버튼 클릭시
				boardDelete(ibuploadMap);
				msg = "삭제 되었습니다.";
			}else{
				if("".equals(bbs_no)){//2. 신규 저장
					
					boardInsert(ibuploadMap);
					msg = "저장 되었습니다.";
				}else{	//3. 수정저장
					boardUpdate(ibuploadMap);
					msg = "수정 되었습니다.";
				}	
			}
			
		
		}
		return msg;
	}
	
}
