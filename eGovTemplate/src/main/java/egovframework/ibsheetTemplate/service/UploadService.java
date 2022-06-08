package egovframework.ibsheetTemplate.service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public interface UploadService {
	public List boardSelect(Map<String,Object> map) throws Exception;
	
	public String saveBoard(Map<String,Object> map) throws Exception;
	
	public int boardInsert(Map<String,Object> map) throws Exception;
	public void boardDelete(Map<String, Object> ibuploadMap) throws Exception;
	public void boardUpdate(Map<String,Object> map) throws Exception;

	public void fileInsert(Map<String,Object> map) throws Exception;
	public void fileDelete(Map<String, Object> ibuploadMap) throws Exception;
	public void fileUpdate(Map<String,Object> map) throws Exception;

	public List board2Select(Map<String, Object> map) throws Exception;
	
	
	public void board2Insert(Map<String, Object> record) throws Exception;
	public void board2Update(Map<String, Object> record) throws Exception;
	public void board2Delete(Map<String, Object> record) throws Exception;
}


