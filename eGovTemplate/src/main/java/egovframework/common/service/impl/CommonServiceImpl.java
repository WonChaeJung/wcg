package egovframework.common.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;

import egovframework.common.service.CommonService;
import egovframework.mapper.CommonMapper;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;



@Service("commonService")
public class CommonServiceImpl extends EgovAbstractServiceImpl implements CommonService{

	/** searchModeDAO */
//    @Resource(name="commonDAO")
//    private CommonDAO commonDAO;
	@Resource(name="commonMapper")
	private CommonMapper commonDAO;
    /*
     * DB에서 조회된 내용을 ibsheet combo에 들어갈 문자열로 변경한다.
     */
    private Map makeComboItem(List li,String text,String code,boolean firstEmpty){
    	Map mp = new HashMap();
    	String comboText="",comboCode="";
    	for(int i=0;i<li.size();i++){
    		EgovMap item = (EgovMap)li.get(i);
    		comboText += "|"+ item.get(text);
    		comboCode += "|"+ item.get(code);
    	}
    	//맨 앞에 공백 아이템 추가여부
    	if(!firstEmpty){
    		comboText = comboText.substring(1);
    		comboCode = comboCode.substring(1);
    	}
    	mp.put("code", comboCode);
    	mp.put("text", comboText);
    	return mp;
    }

    
    
    /*
     * DB에서 조회된 내용을 select 에 들어갈 문자열로 변경한다.
     */
    private Map makeSelectItem(List li,String text,String code) throws Exception{
    	Map mp = new HashMap();
    	String selectStr = "";
    	for(int i=0;i<li.size();i++){
    		EgovMap item = (EgovMap)li.get(i);
    		selectStr += "<option value='"+item.get(code)+"'>"+item.get(text)+"</option>";
    	}
    	
    	mp.put("select", selectStr);

    	return mp;
    }
    

	private Map makeJSONString(List<?> li, String text, String code) throws Exception{
    	Map mp = new HashMap();
    	List ja = new ArrayList();
    	for(int i=0;i<li.size();i++){
    		Map  jo = new HashMap();
    		jo.put("Code",  ((Map)(li.get(i))).get(code));
    		jo.put("Text",  ((Map)(li.get(i))).get(text));
    		ja.add(jo);
    	}
    	mp.put("json", new ObjectMapper().writer().writeValueAsString(ja));
    	
    	return mp;
	}

    
	public Map selectCommonCode(Map<String, Object> map,String text,String code,String returnType)  throws Exception {
		Map mp = null;
		
		List<?> list = commonDAO.selectCommonCode(map);
		if("combo".equals(returnType)){
			mp = makeComboItem(list,text,code,false);	
		}else if("select".equals(returnType)){
			mp = makeSelectItem(list,text,code);	
		}else if("json".equals(returnType)){
			mp = makeJSONString(list,text,code);
		}
		return mp;
	}
	

//	public Map selectCommonCode(Map<String, Object> map,String query,String text,String code,String returnType)  throws Exception {
//		Map mp = null;
//		
//		List<?> list = commonDAO.selectCommonCode(query,map);
//		if("combo".equals(returnType)){
//			mp = makeComboItem(list,text,code,false);	
//		}else if("select".equals(returnType)){
//			mp = makeSelectItem(list,text,code);	
//		}else if("json".equals(returnType)){
//			mp = makeJSONString(list,text,code);
//		}
//		return mp;
//	}


	


	//이전에 만든 메서드
	public Map selectCommonCode(Map<String, Object> map) throws Exception {
		return selectCommonCode(map,"dname","deptno","combo");
	}
	public Map selectCommonCode2(Map<String, Object> map) throws Exception {
		Map mp = null;
		try { 
			List<?> list = commonDAO.selectCommonCode(map);
			mp = makeSelectItem(list,"dname","deptno");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mp;
	}

}
