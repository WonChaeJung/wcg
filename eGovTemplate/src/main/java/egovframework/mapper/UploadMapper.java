package egovframework.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
@Mapper("uploadMapper")
public interface UploadMapper {

	
	int boardInsert(Map mp) throws Exception;
	void boardDelete(Map map)  throws Exception;
	void boardUpdate(Map<String, Object> map) throws Exception;
	void fileInsert(Map<String, Object> map) throws Exception;
	void fileDelete(Map<String, Object> map) throws Exception;
	void fileUpdate(Map<String, Object> map) throws Exception;
	List board2Select(Map<String, Object> map) throws Exception;
	void board2Insert(Map<String, Object> map) throws Exception;
	void board2Update(Map<String, Object> map) throws Exception;
	void board2Delete(Map<String, Object> map) throws Exception;
	List boardSelect(Map<String, Object> map) throws Exception;
}
