package com.funo.sysloginlog.adapt;

import java.util.List;

import com.funo.sysloginlog.model.SysLoginLog;


public interface ISysLoginLogAdapt {

	public String getKey();

	public SysLoginLog createSysLoginLog(SysLoginLog sysLoginLog);

	public SysLoginLog modifySysLoginLog(SysLoginLog sysLoginLog);

	public void deleteSysLoginLog(SysLoginLog sysLoginLog);

	public void batchDeleteSysLoginLog(List<SysLoginLog> sysLoginLogList);

	public SysLoginLog getSysLoginLogById(String unid);

	public List<SysLoginLog> querySysLoginLog(SysLoginLog sysLoginLog);

}