package com.funo.system.dao;

import java.util.List;

import com.funo.base.dao.CommonDao;
import com.funo.system.model.SysOperator;

public interface ISysOperatorDao extends CommonDao<SysOperator> {
	
	public List<SysOperator> queryBySearchList(SysOperator SysOperator);
	
	public List<SysOperator> queryBySearchParentUser(SysOperator SysOperator);
	
	//添加是验证登录名是否唯一
	public List<SysOperator> queryByInsertIsLoginNameExist(SysOperator SysOperator);
	//修改是验证登录名是否唯一
	public List<SysOperator> queryByUpdateIsLoginNameExist(SysOperator SysOperator);

}