package egovframework.ibsheetTemplate.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import egovframework.ib.util.IBSheetUtil;
import egovframework.ibsheetTemplate.service.IBSheetService;
import egovframework.mapper.IBSheetMapper;


@Service("ibsheetService")
public class IBSheetServiceImpl implements IBSheetService {
	
	/** searchModeDAO */
    @Resource(name="ibsheetMapper")
    private IBSheetMapper ibMapper;
	
	public List empSelect(Map<String, String> map) throws Exception {
		// TODO Auto-generated method stub
		return ibMapper.selectEmp(map);
	}

	public List empSelectTree(Map<String, String> map) throws Exception {
		// TODO Auto-generated method stub
		return ibMapper.selectEmpTree(map);
	}
	
	
	public List empSelectTreeRoot(Map<String, String> map) throws Exception {
		// TODO Auto-generated method stub
		return ibMapper.selectEmpTreeRoot(map);
	}
	
	
	
	public List empSelectTreeChild(Map<String, String> map) throws Exception {
		// TODO Auto-generated method stub
		return ibMapper.selectEmpTreeChild(map);
	}
	
	public List deptSelect(Map<String, String> map) throws Exception {
		// TODO Auto-generated method stub
		return ibMapper.selectDept(map);
	}
	
	@Override
	public int postNoCount(Map<String, String> map) throws Exception {
		// TODO Auto-generated method stub
		return ibMapper.selectPostNoCount(map);
	}

	public void empModify(List li) throws Exception {
		for(int i=0;i<li.size();i++){
			Map<String,Object> record = (Map<String,Object>)li.get(i);

			IBSheetUtil iu = new IBSheetUtil();
			iu.mapPrint(record);
			
			//IBSheet 상태 컬럼의 값에 따른 작업 설정
			switch((record.get("sStatus")+"").charAt(0)){
			case 'I':
				ibMapper.insertEmp(record);
				break;
			case 'U':
				ibMapper.updateEmp(record);
				break;
			case 'D':
				ibMapper.deleteEmp(record);
				break;
			}
		}
	}

	

	public void deptModify(List li) throws Exception {
		for(int i=0;i<li.size();i++){
			Map<String,Object> record = (Map<String,Object>)li.get(i);
		
			//IBSheet 상태 컬럼의 값에 따른 작업 설정
			switch((record.get("sStatus")+"").charAt(0)){
			case 'I':
				ibMapper.insertDept(record);
				break;
			case 'U':
				ibMapper.updateDept(record);
				break;
			case 'D':
				ibMapper.deleteDept(record);
				break;
			}
		}
	}
	

	public void postNoModify(List li) throws Exception {
		for(int i=0;i<li.size();i++){
			Map<String,Object> record = (Map<String,Object>)li.get(i);

			//IBSheet 상태 컬럼의 값에 따른 작업 설정
			switch((record.get("sStatus")+"").charAt(0)){
			case 'I':
				ibMapper.insertPostNo(record);
				break;
			case 'U':
				ibMapper.updatePostNo(record);
				break;
			case 'D':
				ibMapper.deletePostNo(record);
				break;
			}
		}
	}
	
	@Override
	public List postNoPage(Map<String, String> map) throws Exception {
		// TODO Auto-generated method stub
		return ibMapper.selectPostNoPage(map);
	}

	@Override
	public List profitSelect(Map<String, String> map) throws Exception {
		// TODO Auto-generated method stub
		return ibMapper.selectProfit(map);
	}

	@Override
	public void doubleModify(List emp, List dept) throws Exception {
		// TODO Auto-generated method stub
		empModify(emp);
		deptModify(dept);
	}
}
