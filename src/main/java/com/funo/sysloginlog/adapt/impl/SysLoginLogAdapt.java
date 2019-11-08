package com.funo.sysloginlog.adapt.impl;

import java.util.List;

import com.funo.base.adapt.BaseAdapt;
import com.funo.sysloginlog.dao.ISysLoginLogDao;
import com.funo.sysloginlog.adapt.ISysLoginLogAdapt;
import com.funo.sysloginlog.model.SysLoginLog;

public class SysLoginLogAdapt extends BaseAdapt implements ISysLoginLogAdapt {

	private static final long serialVersionUID = 1L;
	private ISysLoginLogDao sysLoginLogDao;
	
	public ISysLoginLogDao getSysLoginLogDao() {
		return sysLoginLogDao;
	}

	public void setSysLoginLogDao(ISysLoginLogDao sysLoginLogDao) {
		this.sysLoginLogDao = sysLoginLogDao;
	}

	public String getKey() {
		return sysLoginLogDao.getKey();
	}

	public SysLoginLog createSysLoginLog(SysLoginLog sysLoginLog) {
		sysLoginLogDao.create(sysLoginLog);
		return sysLoginLog;
	}

	public SysLoginLog modifySysLoginLog(SysLoginLog sysLoginLog) {
		sysLoginLogDao.update(sysLoginLog);
		return sysLoginLog;
	}

	public void deleteSysLoginLog(SysLoginLog sysLoginLog) {
		sysLoginLogDao.delete(sysLoginLog);
	}

	public void batchDeleteSysLoginLog(List<SysLoginLog> sysLoginLogList) {
		sysLoginLogDao.batchCreate(sysLoginLogList);
	}

	public SysLoginLog getSysLoginLogById(String sysLoginLogId) {
		return sysLoginLogDao.getById(sysLoginLogId);
	}

	public List<SysLoginLog> querySysLoginLog(SysLoginLog sysLoginLog) {
		return sysLoginLogDao.queryByArgs(sysLoginLog);
	}
	
}