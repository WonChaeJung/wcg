package egovframework.ibsheetTemplate.service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public interface IBSheetService {
	public List empSelect(Map<String, String> map) throws Exception;
	public List empSelectTree(Map<String, String> map) throws Exception;
	public List empSelectTreeRoot(Map<String, String> map) throws Exception;
	public List empSelectTreeChild(Map<String, String> map) throws Exception;
	public List deptSelect(Map<String, String> map) throws Exception;

	public void empModify(List li) throws Exception;
	public void deptModify(List li) throws Exception;
	public void doubleModify(List emp,List dept) throws Exception;
	
	public void postNoModify(List li) throws Exception;
	
	public int postNoCount(Map<String, String> map) throws Exception;
	public List postNoPage(Map<String, String> map) throws Exception;
	public List profitSelect(Map<String, String> map) throws Exception;
}


