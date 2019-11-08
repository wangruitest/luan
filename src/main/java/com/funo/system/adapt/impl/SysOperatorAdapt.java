package com.funo.system.adapt.impl;

import java.util.List;

import com.funo.base.adapt.BaseAdapt;
import com.funo.system.dao.ISysOperatorDao;
import com.funo.system.adapt.ISysOperatorAdapt;
import com.funo.system.model.SysOperator;

public class SysOperatorAdapt extends BaseAdapt implements ISysOperatorAdapt {

	private static final long serialVersionUID = 1L;
	private ISysOperatorDao sysOperatorDao;
	
	public ISysOperatorDao getSysOperatorDao() {
		return sysOperatorDao;
	}

	public void setSysOperatorDao(ISysOperatorDao sysOperatorDao) {
		this.sysOperatorDao = sysOperatorDao;
	}

	public String getKey() {
		return sysOperatorDao.getKey();
	}

	public SysOperator createSysOperator(SysOperator sysOperator) {
		sysOperatorDao.create(sysOperator);
		return sysOperator;
	}

	public SysOperator modifySysOperator(SysOperator sysOperator) {
		sysOperatorDao.update(sysOperator);
		return sysOperator;
	}

	public void deleteSysOperator(SysOperator sysOperator) {
		sysOperatorDao.delete(sysOperator);
	}

	public void batchDeleteSysOperator(List<SysOperator> sysOperatorList) {
		sysOperatorDao.batchCreate(sysOperatorList);
	}

	public SysOperator getSysOperatorById(String sysOperatorId) {
		return sysOperatorDao.getById(sysOperatorId);
	}

	public List<SysOperator> querySysOperator(SysOperator sysOperator) {
		return sysOperatorDao.queryByArgs(sysOperator);
	}
	
	public List<SysOperator> querySysOperatorList(SysOperator sysOperator) {
		return sysOperatorDao.queryBySearchList(sysOperator);
	}
	public List<SysOperator> querySysOperatorParentUser(SysOperator sysOperator) {
		return sysOperatorDao.queryBySearchParentUser(sysOperator);
	}
	
	public List<SysOperator> queryInsertIsLoginNameExist(SysOperator sysOperator) {
		return sysOperatorDao.queryByInsertIsLoginNameExist(sysOperator);
	}
	
	public List<SysOperator> queryUpdateIsLoginNameExist(SysOperator sysOperator) {
		return sysOperatorDao.queryByUpdateIsLoginNameExist(sysOperator);
	}
	
}