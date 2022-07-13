package com.ytcares.common;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.apache.commons.collections.map.ListOrderedMap;
import org.springframework.stereotype.Repository;

import com.ytcares.bean.YTCaresBean;
import com.ytcares.dao.YTCaresAbstractDAO;
@Repository
public class YTCaresCsvUtil extends YTCaresAbstractDAO {
	public YTCaresCsvUtil(){};
	public String csvInput(String qId, Object paramMap, String pathname) throws IOException{
		Calendar cal = Calendar.getInstance();
		String yyyy = Integer.toString(cal.get(Calendar.YEAR));
		String mm = Integer.toString(cal.get(Calendar.MONTH)+1);
		String dd = Integer.toString(cal.get(Calendar.DAY_OF_MONTH));
		String HH = Integer.toString(cal.get(Calendar.HOUR_OF_DAY));
		String MM = Integer.toString(cal.get(Calendar.MINUTE));
		String SS = Integer.toString(cal.get(Calendar.SECOND));
		String fileName = yyyy+mm+dd+HH+MM+SS+".csv";
		List<?> csvList = sqlMapClientTemplate.queryForList(qId, paramMap);
		File fileDir= new File(pathname);
		File file = new File(pathname, fileName);
		if(!fileDir.exists()){
			fileDir.mkdir();
		}
		if(fileDir.exists()){
			file.createNewFile();
			FileOutputStream fos = new FileOutputStream(file);
			for(int i=0; i<csvList.size(); i++){
				Object obj = csvList.get(i);
				if(obj instanceof Map) {
					fos.write(map2String((Map)obj).getBytes("MS949"));
				} else if (obj instanceof YTCaresBean) {
					YTCaresBean bean = (YTCaresBean)obj;
					fos.write((map2String(bean.bean2Map())).getBytes("MS949"));
				} else {
					continue;
				}
			}
			fos.close();
		}
		return fileName;
	}
	@SuppressWarnings("unchecked")
	private String map2String(Map map) {
		StringBuilder sb = new StringBuilder();
		Iterator<String> iter  = map.keySet().iterator();
		int i = 0;
		while(iter.hasNext()){
			String key = iter.next();
			if (i++ != 0) sb.append(",");
			if (map.get(key) != null) {
				if(map.get(key).toString().indexOf(",") == -1){
					sb.append(map.get(key));
				}
				else{
					sb.append(map.get(key).toString().replace(",",""));
				}
			}
		}
		sb.append("\n");
		return sb.toString();
	}
//루트의 CSV파일을 로딩하여 ByteArrayOutputStream으로 리턴
	public ByteArrayOutputStream csvReader(String realPath, String filename) throws IOException{

		File f = new File(realPath+"\\"+filename);
		File fdir = new File(realPath);
		ByteArrayOutputStream bos = new ByteArrayOutputStream();
		if(fdir.exists()){
			if(f.isFile()){
				try {
					FileInputStream fis = new FileInputStream(f) ;
					byte[] buf = new byte[1024];
					int readCnt = 0;
					while((readCnt = fis.read(buf))!= -1){
						bos.write(buf, 0, readCnt);
					}
				} catch (FileNotFoundException e) {
					e.printStackTrace();
				}
			}
		}
		return bos;
	}
}
