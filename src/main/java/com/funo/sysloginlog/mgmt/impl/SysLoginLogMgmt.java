package com.funo.sysloginlog.mgmt.impl;

import java.util.List;

import com.funo.base.mgmt.BaseMgmt;
import com.funo.sysloginlog.adapt.ISysLoginLogAdapt;
import com.funo.sysloginlog.mgmt.ISysLoginLogMgmt;
import com.funo.sysloginlog.model.SysLoginLog;

public class SysLoginLogMgmt extends BaseMgmt implements ISysLoginLogMgmt {

	private static final long serialVersionUID = 1L;
	private ISysLoginLogAdapt sysLoginLogAdapt;
	
	public ISysLoginLogAdapt getSysLoginLogAdapt() {
		return sysLoginLogAdapt;
	}
	public void setSysLoginLogAdapt(ISysLoginLogAdapt sysLoginLogAdapt) {
		this.sysLoginLogAdapt = sysLoginLogAdapt;
	}

	public String getKey() {
		return sysLoginLogAdapt.getKey();
	}

	public SysLoginLog createSysLoginLog(SysLoginLog sysLoginLog) {
		sysLoginLogAdapt.createSysLoginLog(sysLoginLog);
		return sysLoginLog;
	}

	public SysLoginLog modifySysLoginLog(SysLoginLog sysLoginLog) {
		sysLoginLogAdapt.modifySysLoginLog(sysLoginLog);
		return sysLoginLog;
	}

	public void deleteSysLoginLog(SysLoginLog sysLoginLog) {
		sysLoginLogAdapt.deleteSysLoginLog(sysLoginLog);
	}

	public void batchDeleteSysLoginLog(List<SysLoginLog> sysLoginLogList) {
		sysLoginLogAdapt.batchDeleteSysLoginLog(sysLoginLogList);
	}

	public SysLoginLog getSysLoginLogById(String sysLoginLogId) {
		return sysLoginLogAdapt.getSysLoginLogById(sysLoginLogId);
	}

	public List<SysLoginLog> querySysLoginLog(SysLoginLog sysLoginLog) {
		return sysLoginLogAdapt.querySysLoginLog(sysLoginLog);
	}
	
}