package com.sise.ycj.dao;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.dao.support.DaoSupport;
import org.springframework.util.Assert;

public class BaseDao extends DaoSupport{
	protected final Log log = LogFactory.getLog(getClass());
	private SqlSessionFactory sqlSessionFactory;
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	protected void checkDaoConfig() throws IllegalArgumentException {	
		Assert.notNull(this.sqlSessionFactory, "sqlSessionFactory must be not null");
		
	}
	
	public SqlSessionFactory getSqlSessionFactory() {
		return this.sqlSessionFactory;
	}
			
	public void setSqlSessionFactory(SqlSessionFactory paramSqlSessionFactory) {
		this.sqlSessionFactory = paramSqlSessionFactory;
		this.sqlSessionTemplate = new SqlSessionTemplate(paramSqlSessionFactory);
	}
	
	public SqlSessionTemplate getSqlSessionTemplate() {
		return this.sqlSessionTemplate;
	}

}
