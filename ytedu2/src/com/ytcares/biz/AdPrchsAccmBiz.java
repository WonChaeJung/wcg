package com.ytcares.biz;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ytcares.common.YTCaresConstants.Grade;
import com.ytcares.dao.TAccmDAO;
import com.ytcares.dao.TPrchsDAO;

@Component
public class AdPrchsAccmBiz {
	@Autowired
	TPrchsDAO tprchsDAO;
	@Autowired
	TAccmDAO tAccmDAO;
	private Logger logger = Logger.getLogger(AdPrchsAccmBiz.class);
	
	public int updatePrchsInfo(Map<String, Object> param) {
		String[] prchsDetails = (String[])param.get("prchsChk");
		int result = 0;
			for(int i = 0; i < prchsDetails.length; i++) {
				try{
					Map<String, Object> queryParam = new HashMap<String, Object>();
					String[] prchsDetail	= prchsDetails[i].split(",");
					String prchs_seq_no		= prchsDetail[0];
					String[] prchs_stat_cd	= (String[])param.get("prchs_stat_cd" + prchs_seq_no);
					String stat_cd			= prchs_stat_cd[0];
		
					queryParam.put("prchs_seq_no",	prchs_seq_no);
					queryParam.put("prchs_stat_cd", stat_cd);//해당 행의  상태코드값 
					
					int iStatCd = Integer.parseInt(stat_cd);
					switch (iStatCd){
					case 1://구매신청
						break;
					case 2://입금대기
						break;
					case 3://배송중 dlvr_date
						queryParam.put("dlvr_date", "SYSDATE");
						break;
					case 4://배송완료 dlvr_comp_date
						queryParam.put("dlvr_comp_date", "SYSDATE");
						break;
					case 5://구매완료 prchs_comp_date
						logger.info("### 구매완료");
						queryParam.put("prchs_comp_date", "SYSDATE");
						
						//구매자의 패밀리아이디를 - 를 구분자로 스플릿
						String[] arrFamilyId		= prchsDetail[1].split("-");
						//가맹점에 대한 적립금
						String agencyAccmPnt		= prchsDetail[2];
						//부총판에 대한 적립금
						String subAgencyAccmPnt		= prchsDetail[3];
						//총판에 대한 적립금
						String supAgencyAccmPnt		= prchsDetail[4];
						//구매자 등급
						String prchsGrade			= prchsDetail[5];
						try {
							//총판에 대한 적립금
							int iSupAgencyAccmPnt	= Integer.parseInt(supAgencyAccmPnt);
							//부총판에 대한 적립금
							int iSubAgencyAccmPnt 	= Integer.parseInt(subAgencyAccmPnt);
							//가맹점에 대한 적립금
							int iAgencyAccmPnt		= Integer.parseInt(agencyAccmPnt);
							
							if(iSupAgencyAccmPnt != 0){
								//총판업데이트
								queryParam.put("accm_pnt",	iSupAgencyAccmPnt);
								queryParam.put("family_id",	arrFamilyId[0]);
								//총판에 대한 적립금 등록
								tAccmDAO.mergeAccmPnt(queryParam);
							}
							
							if(iSubAgencyAccmPnt != 0){
								if((Grade.agency.equals(prchsGrade) && arrFamilyId.length == 3) || Grade.sub_agency.equals(prchsGrade)) {
									//구매자가 가맹점이고 계층아이디가 3단계(부총판이 있는 경우)거나, 구매자가 부총판인 경우
									queryParam.put("accm_pnt",	iSubAgencyAccmPnt);
									queryParam.put("family_id",	arrFamilyId[0].concat("-").concat(arrFamilyId[0]));
									//부총판업데이트
									tAccmDAO.mergeAccmPnt(queryParam);
								}
							}
							
							if(Grade.agency.equals(prchsGrade) && iAgencyAccmPnt != 0){
								//가맹점업데이트
								queryParam.put("accm_pnt", iAgencyAccmPnt);
								queryParam.put("family_id",prchsDetail[1]);
								tAccmDAO.mergeAccmPnt(queryParam);
							}
						} catch (NumberFormatException e){
							e.printStackTrace();
						}
						break;
					case 9://구매취소 prchs_cncl_date
						queryParam.put("prchs_cncl_date","SYSDATE");
						break;
					default:
						break;
					}
					
					int cnt = tprchsDAO.updateUserPrchsInfo(queryParam);
					if (cnt == 1) result++;
				} catch (Exception e) {
					e.printStackTrace();
				}
				
			}
			
			return result;

	}
}
