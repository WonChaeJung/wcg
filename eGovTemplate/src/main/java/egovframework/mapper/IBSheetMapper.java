package egovframework.mapper;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
@Mapper("ibsheetMapper")
public interface IBSheetMapper {

	
	/**
	 * emp 테이블의 내용을 조회한다.
	 * @param Map - 조회할 정보가 담긴 Map
	 * @return emp table list 데이터
	 * @exception Exception
	 */
	List<?> selectEmp(Map mp) throws Exception;
		
	
	
	/**
	 * dept 테이블의 내용을 조회한다.
	 * @param Map - 조회할 정보가 담긴 Map
	 * @return dept table list 데이터
	 * @exception Exception
	 */
	List<?> selectDept(Map mp) throws Exception;
	
	
	/**
	 * postNo 테이블의 전체 건수를 조회한다.
	 * @param Map - 조회할 정보가 담긴 Map
	 * @return 건수 int 데이터
	 * @exception Exception
	 */
	int selectPostNoCount(Map<String, String> map) throws Exception;


	/**
	 * postNo 테이블의 데이터를 page 번호와 건수 단위로 조회한다.
	 * @param Map - 조회할 정보가 담긴 Map
	 * @return postNo table list 데이터
	 * @exception Exception
	 */
	List selectPostNoPage(Map<String, String> map) throws Exception;
	
	
	
	
	
	

	/**
	 * emp 테이블의 내용을 트리형태로 조회한다.
	 * @param Map - 조회할 정보가 담긴 Map
	 * @return emp table list 데이터
	 * @exception Exception
	 */
	List<?> selectEmpTree(Map mp) throws Exception;
	
	
	
	/**
	 * emp 테이블의 내용을 트리형태로 2 Depth까지 조회한다.
	 * @param Map - 조회할 정보가 담긴 Map
	 * @return emp table list 데이터
	 * @exception Exception
	 */
	List<?> selectEmpTreeRoot(Map mp) throws Exception;
	
	/**
	 * emp 테이블의 내용을 트리형태로 특정 노드의 자식노드를 조회한다.
	 * @param Map - 조회할 정보가 담긴 Map
	 * @return emp table list 데이터
	 * @exception Exception
	 */
	List<?> selectEmpTreeChild(Map mp) throws Exception;
	

	
	
	
	
	/**
	 * emp 테이블의 내용을 추가한다.
	 * @param Map - 추가할 정보가 담긴 Map
	 * @return 추가된 데이터 개수
	 * @exception Exception
	 */
	void insertEmp(Map mp) throws Exception;
	
	/**
	 * emp 테이블의 내용을 갱신한다.
	 * @param Map - 갱신할 정보가 담긴 Map
	 * @return 갱신된 데이터 개수
	 * @exception Exception
	 */
	void updateEmp(Map mp) throws Exception;
	
	/**
	 * emp 테이블의 내용을 삭제한다.
	 * @param Map - 삭제할 정보가 담긴 Map
	 * @return 삭제된 데이터 개수
	 * @exception Exception
	 */
	void deleteEmp(Map mp) throws Exception;
	
	
	/**
	 * dept 테이블의 내용을 추가한다.
	 * @param Map - 추가할 정보가 담긴 Map
	 * @return 추가된 데이터 개수
	 * @exception Exception
	 */
	void insertDept(Map mp) throws Exception;
	
	/**
	 * dept 테이블의 내용을 갱신한다.
	 * @param Map - 갱신할 정보가 담긴 Map
	 * @return 갱신된 데이터 개수
	 * @exception Exception
	 */
	void updateDept(Map mp) throws Exception;
	
	/**
	 * dept 테이블의 내용을 삭제한다.
	 * @param Map - 삭제할 정보가 담긴 Map
	 * @return 삭제된 데이터 개수
	 * @exception Exception
	 */
	void deleteDept(Map mp) throws Exception;


	void insertPostNo(Map<String, Object> map) throws Exception;
	
	
	void updatePostNo(Map<String, Object> map) throws Exception;
	
	void deletePostNo(Map<String, Object> map) throws Exception;


	List selectProfit(Map<String, String> map) throws Exception;




	
	
}
