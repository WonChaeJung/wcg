package egovframework.common.service;
import java.util.List;
import java.util.Map;
public interface CommonService {
	public Map selectCommonCode(Map<String, Object> map,String text,String code,String returnType)  throws Exception;
//	public Map selectCommonCode(Map<String, Object> map,String query,String text,String code,String returnType)  throws Exception;
	public Map selectCommonCode(Map<String, Object> map) throws Exception;
	public Map selectCommonCode2(Map<String, Object> map) throws Exception;
}
