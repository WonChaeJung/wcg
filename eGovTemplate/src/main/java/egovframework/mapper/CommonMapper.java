package egovframework.mapper;

import java.util.List;
import java.util.Map;



import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("commonMapper")
public interface CommonMapper {
	/**
	 * dept 테이블의 내용을 조회한다.
	 * @param Map - 조회할 정보가 담긴 Map
	 * @return combo table 데이터
	 * @exception Exception
	 */
	List selectCommonCode(Map mp) throws Exception;
}
