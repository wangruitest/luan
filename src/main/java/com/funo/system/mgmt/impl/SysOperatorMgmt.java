package com.funo.system.mgmt.impl;

import java.util.List;

import com.funo.base.mgmt.BaseMgmt;
import com.funo.system.adapt.ISysOperateRoleAdapt;
import com.funo.system.adapt.ISysOperatorAdapt;
import com.funo.system.adapt.ISysOrganizationAdapt;
import com.funo.system.adapt.ISysRoleAdapt;
import com.funo.system.mgmt.ISysOperatorMgmt;
import com.funo.system.model.SysOperateRole;
import com.funo.system.model.SysOperator;
import com.funo.system.model.SysOrganization;
import com.funo.system.model.SysRole;
import com.funo.utils.Md5PwdEncoder;

public class SysOperatorMgmt extends BaseMgmt implements ISysOperatorMgmt {

	private static final long serialVersionUID = 1L;
	private ISysOperatorAdapt sysOperatorAdapt;
	private ISysOperateRoleAdapt sysOperateRoleAdapt;
	private ISysRoleAdapt sysRoleAdapt;
	private ISysOrganizationAdapt sysOrganizationAdapt;
		
	public ISysOrganizationAdapt getSysOrganizationAdapt() {
		return sysOrganizationAdapt;
	}
	public void setSysOrganizationAdapt(ISysOrganizationAdapt sysOrganizationAdapt) {
		this.sysOrganizationAdapt = sysOrganizationAdapt;
	}
	public ISysRoleAdapt getSysRoleAdapt() {
		return sysRoleAdapt;
	}
	public void setSysRoleAdapt(ISysRoleAdapt sysRoleAdapt) {
		this.sysRoleAdapt = sysRoleAdapt;
	}
	public ISysOperatorAdapt getSysOperatorAdapt() {
		return sysOperatorAdapt;
	}
	public void setSysOperatorAdapt(ISysOperatorAdapt sysOperatorAdapt) {
		this.sysOperatorAdapt = sysOperatorAdapt;
	}

	public String getKey() {
		return sysOperatorAdapt.getKey();
	}

	public SysOperator createSysOperator(SysOperator sysOperator) {
		List<SysRole> sysRoles=sysOperator.getRoles();
		if(null!=sysRoles){
			for (int i = 0; i < sysRoles.size(); i++) {
				SysOperateRole sysOperateRole=new SysOperateRole();
				sysOperateRole.setUnid(getKey());
				sysOperateRole.setRoleUnid(sysRoles.get(i).getUnid());
				sysOperateRole.setOperateUnid(sysOperator.getUnid());
				sysOperateRoleAdapt.createSysOperateRole(sysOperateRole);
			}
		}
		
		Md5PwdEncoder pwdEncoder=new Md5PwdEncoder();
		sysOperator.setPassword(pwdEncoder.encodePassword(sysOperator.getPassword()));
		sysOperatorAdapt.createSysOperator(sysOperator);
		return sysOperator;
	}
	
	/**
	 * 商户接口调用创建用户
	 * */
	public SysOperator createSysOperatorForWebS(SysOperator sysOperator) {		
//		SysRole sysRole = new SysRole();
//		sysRole.setUnid(getKey());
//		sysRole.setName(sysOperator.getName());
//		sysRole.setStatus(1L);
//		sysRoleAdapt.createSysRole(sysRole);
		
		SysOperateRole sysOperateRole=new SysOperateRole();
		sysOperateRole.setUnid(getKey());
		sysOperateRole.setRoleUnid("C98D66BAE2E446D5A0DDC4F6015E5A39");
		sysOperateRole.setOperateUnid(sysOperator.getUnid());
		sysOperateRoleAdapt.createSysOperateRole(sysOperateRole);
		
		List<SysOperator> SysOperatorParentList = sysOperatorAdapt.querySysOperatorParentUser(sysOperator);
		sysOperator.setParentUnid(SysOperatorParentList.get(0).getUnid());
		sysOperator.setStatus(1L);
		sysOperator.setOperatorType(1L);
		sysOperator.setSex(1L);
		Md5PwdEncoder pwdEncoder=new Md5PwdEncoder();
		sysOperator.setPassword(pwdEncoder.encodePassword("123"));
		sysOperatorAdapt.createSysOperator(sysOperator);
		return sysOperator;
	}
	
	/**
	 * 商户接口调用修改用户
	 * */
	public SysOperator updateSysOperatorForWebS(SysOperator sysOperator) {
		sysOperatorAdapt.modifySysOperator(sysOperator);
		return sysOperator;
	}

	public SysOperator modifySysOperator(SysOperator sysOperator) {
		//先删除、再新增
		SysOperateRole delSysOperateRole=new SysOperateRole();
		delSysOperateRole.setOperateUnid(sysOperator.getUnid());
		sysOperateRoleAdapt.deleteSysOperateRole(delSysOperateRole);
		
		List<SysRole> sysRoles=sysOperator.getRoles();
		if(null!=sysRoles){
			for (int i = 0; i < sysRoles.size(); i++) {
				SysOperateRole sysOperateRole=new SysOperateRole();
				sysOperateRole.setUnid(getKey());
				sysOperateRole.setRoleUnid(sysRoles.get(i).getUnid());
				sysOperateRole.setOperateUnid(sysOperator.getUnid());
				sysOperateRoleAdapt.createSysOperateRole(sysOperateRole);
			}
		}
		
		//如果和旧密码一样，则不修改
		if(null!=sysOperator.getOldPassword() && !sysOperator.getOldPassword().equals(sysOperator.getPassword())){
			Md5PwdEncoder pwdEncoder=new Md5PwdEncoder();
			sysOperator.setPassword(pwdEncoder.encodePassword(sysOperator.getPassword()));
		}
		sysOperatorAdapt.modifySysOperator(sysOperator);
		return sysOperator;
	}

	public void deleteSysOperator(SysOperator sysOperator) {
		//删除关联关系
		SysOperateRole delSysOperateRole=new SysOperateRole();
		delSysOperateRole.setRoleUnid(sysOperator.getUnid());
		sysOperateRoleAdapt.deleteSysOperateRole(delSysOperateRole);
		
		sysOperatorAdapt.deleteSysOperator(sysOperator);
	}

	public void batchDeleteSysOperator(List<SysOperator> sysOperatorList) {
		sysOperatorAdapt.batchDeleteSysOperator(sysOperatorList);
	}

	public SysOperator getSysOperatorById(String sysOperatorId) {
		return sysOperatorAdapt.getSysOperatorById(sysOperatorId);
	}

	public List<SysOperator> querySysOperator(SysOperator sysOperator) {
		return sysOperatorAdapt.querySysOperator(sysOperator);
	}
	public List<SysOperator> querySysOperatorList(SysOperator sysOperator) {
		return sysOperatorAdapt.querySysOperatorList(sysOperator);
	}
	public ISysOperateRoleAdapt getSysOperateRoleAdapt() {
		return sysOperateRoleAdapt;
	}
	public void setSysOperateRoleAdapt(ISysOperateRoleAdapt sysOperateRoleAdapt) {
		this.sysOperateRoleAdapt = sysOperateRoleAdapt;
	}
	
	public List<SysOperator> queryInsertIsLoginNameExist(SysOperator sysOperator) {
		return sysOperatorAdapt.queryInsertIsLoginNameExist(sysOperator);
	}
	
	public List<SysOperator> queryUpdateIsLoginNameExist(SysOperator sysOperator) {
		return sysOperatorAdapt.queryUpdateIsLoginNameExist(sysOperator);
	}
	
}