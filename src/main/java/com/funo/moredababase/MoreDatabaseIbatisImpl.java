package com.funo.moredababase;

import java.lang.reflect.Method;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.commons.id.Hex;
import org.apache.commons.id.uuid.UUID;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.funo.base.dao.CommonDao;
import com.funo.base.dao.impl.FinderExecutor;
import com.funo.base.vo.IPageAbleObj;
import com.funo.base.vo.Page;
import com.funo.base.vo.Result;
import com.ibatis.sqlmap.client.SqlMapClient;
 
public class MoreDatabaseIbatisImpl<T> extends SqlMapClientDaoSupport implements
		CommonDao<T>, FinderExecutor {
	private Map<String, SqlMapClient> targetSqlMapClients; 
	
	protected Log logger = LogFactory.getLog(getClass());

	private Class<T> type;

	public MoreDatabaseIbatisImpl(Class<T> type) {
		this.type = type;
	}

	private SqlMapClientTemplate getCurSqlMapClientTemplate(){
		SqlMapClientTemplate result=getSqlMapClientTemplate();
		String tagDb=MoreDatabaseUtils.getCurRoutingTag(true);
		if(StringUtils.isNotEmpty(tagDb)){
			result.setSqlMapClient(this.targetSqlMapClients.get(tagDb));
		}
		return result;
	}
	
	public void create(T newObj) {
		getCurSqlMapClientTemplate()
				.insert(getStatementName() + ".create", newObj);
	}

	public int update(T newObj) {
		return getCurSqlMapClientTemplate().update(getStatementName() + ".update",
				newObj);
	}

	public int delete(T obj) {
		return getCurSqlMapClientTemplate().delete(getStatementName() + ".delete",
				obj);
	}

	public void batchCreate(final List<T> objectList) {
		if(null==objectList || objectList.size()==0)return;
		SqlMapClientTemplate curSqlMapClient=this.getCurSqlMapClientTemplate();
		try {
			curSqlMapClient.getSqlMapClient().startTransaction();
			for (int i = 0; i < objectList.size(); i++) {
				if (i % 10000 == 0) {
					curSqlMapClient.getSqlMapClient().startBatch();
				}
				curSqlMapClient.getSqlMapClient().insert(getStatementName() + ".create", objectList.get(i));
				if ((i + 1) % 10000 == 0) {
					curSqlMapClient.getSqlMapClient().executeBatch();
				}
			}
			curSqlMapClient.getSqlMapClient().executeBatch();  
			curSqlMapClient.getSqlMapClient().commitTransaction();  
			curSqlMapClient.getSqlMapClient().endTransaction();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void batchDelete(List<T> objectList) {
		if (objectList != null) {
			for (T t : objectList) {
				delete(t);
			}
		}
	}

	public void batchUpdate(List<T> objectList) {
		if (objectList != null) {
			for (T t : objectList) {
				update(t);
			}
		}
	}

	@SuppressWarnings("unchecked")
	public T getById(String key) {
		return (T) getCurSqlMapClientTemplate().queryForObject(
				getStatementName() + ".getById", key);
	}

	@SuppressWarnings("unchecked")
	public List<T> queryByArgs(Object queryObj) {
		if (queryObj == null)
			return getCurSqlMapClientTemplate().queryForList(
					getStatementName() + ".queryByArgs");
		else
			return getCurSqlMapClientTemplate().queryForList(
					getStatementName() + ".queryByArgs", queryObj);
	}
	@SuppressWarnings("unchecked")
	public Result<T> pageCountByArgs(IPageAbleObj queryObj) {
		Long count = (Long)getCurSqlMapClientTemplate().queryForObject(getStatementName() + ".pageCountByArgs.count", queryObj);
		List<T> list =getCurSqlMapClientTemplate().queryForList(
					getStatementName() + ".pageCountByArgs", queryObj);
		Result<T> result = new Result<T>();
		result.setContent(list);
		Page page = queryObj.getPage();
		page.setTotalItems(count);
		result.setPage(page);
		return result;
	}

	public void execDelete(Method method, Object arg) {
		getCurSqlMapClientTemplate().delete(getStatementName(method), arg);
	}

	public void execInsert(Method method, Object arg) {
		getCurSqlMapClientTemplate().insert(getStatementName(method), arg);
	}

	public void execUpdate(Method method, Object arg) {
		getCurSqlMapClientTemplate().update(getStatementName(method), arg);
	}

	public Object execGet(Method method, Object arg) {
		return getCurSqlMapClientTemplate().queryForObject(
				getStatementName(method), arg);
	}

	public List execSelect(Method method, Object arg) {
		if (arg == null)
			return getCurSqlMapClientTemplate().queryForList(
					getStatementName(method));
		else
			return getCurSqlMapClientTemplate().queryForList(
					getStatementName(method), arg);
	}

	public Long execCount(Method method, Object arg) {
		if (arg == null)
			return (Long) getCurSqlMapClientTemplate().queryForObject(
					getStatementName(method));
		else
			return (Long) getCurSqlMapClientTemplate().queryForObject(
					getStatementName(method), arg);
	}

	private String getStatementName(Method method) {
		return (new StringBuilder(String.valueOf(type.getSimpleName())))
				.append(".").append(method.getName()).toString();
	}

	private String getStatementName() {
		return type.getSimpleName();
	}

	public String getKey() {
		return (new String(Hex.encodeHex(UUID.randomUUID().getRawBytes())))
				.toUpperCase();
	}

	public Map<String, SqlMapClient> getTargetSqlMapClients() {
		return targetSqlMapClients;
	}

	public void setTargetSqlMapClients(Map<String, SqlMapClient> targetSqlMapClients) {
		this.targetSqlMapClients = targetSqlMapClients;
	}

}
