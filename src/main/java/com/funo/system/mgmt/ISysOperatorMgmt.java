package com.funo.system.mgmt;

import java.util.List;

import com.funo.system.model.SysOperator;


public interface ISysOperatorMgmt {

	public String getKey();

	public SysOperator createSysOperator(SysOperator sysOperator);
	
	public SysOperator createSysOperatorForWebS(SysOperator sysOperator);
	
	public SysOperator updateSysOperatorForWebS(SysOperator sysOperator);

	public SysOperator modifySysOperator(SysOperator sysOperator);

	public void deleteSysOperator(SysOperator sysOperator);

	public void batchDeleteSysOperator(List<SysOperator> sysOperatorList);

	public SysOperator getSysOperatorById(String unid);

	public List<SysOperator> querySysOperator(SysOperator sysOperator);
	
	public List<SysOperator> querySysOperatorList(SysOperator sysOperator);
	
	public List<SysOperator> queryInsertIsLoginNameExist(SysOperator sysOperator);
	
	public List<SysOperator> queryUpdateIsLoginNameExist(SysOperator sysOperator);

}