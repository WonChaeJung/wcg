package com.ytcares.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.ibatis.SqlMapClientCallback;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapExecutor;

@Repository
public abstract class YTCaresAbstractDAO {
	@Autowired
	protected SqlMapClientTemplate sqlMapClientTemplate;
	
	@Autowired
	protected ResourceBundleMessageSource messageSource;
	
	protected Connection getConnection() {
		Connection con = null;
		try {
			con = sqlMapClientTemplate.getDataSource().getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return con;
	}
	
	public String getMessage(String key) {
		return this.getMessage(key, null);
	}
	
	public String getMessage(String key, Object[] args) {
		return messageSource.getMessage(key, args, key, Locale.getDefault());
	}
	
	public int doUpdate (String queryId, Object param) throws DataAccessException {
		return sqlMapClientTemplate.update(queryId, param);
	}

	@SuppressWarnings("unchecked")
	public Object executeBatch(final String queriId, final List<Map<String, Object>> param ) throws DataAccessException {
		return sqlMapClientTemplate.execute(new SqlMapClientCallback() {
			public Object doInSqlMapClient(SqlMapExecutor excutor) throws SQLException {
				excutor.startBatch();
				int[] result = new int[param.size()];
				for ( int i = 0 ; i < param.size() ; i++ ) {
					int count = doUpdate(queriId, param.get(i));
					result[i] = count;
				}
				excutor.executeBatch();
				return result;
			}
		});
	}

}
