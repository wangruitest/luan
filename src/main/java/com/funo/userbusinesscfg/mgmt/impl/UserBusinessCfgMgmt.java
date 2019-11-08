package com.funo.userbusinesscfg.mgmt.impl;

import java.util.List;

import com.funo.base.mgmt.BaseMgmt;
import com.funo.business.model.Business;
import com.funo.userbusinesscfg.adapt.IUserBusinessCfgAdapt;
import com.funo.userbusinesscfg.mgmt.IUserBusinessCfgMgmt;
import com.funo.userbusinesscfg.model.UserBusinessCfg;

public class UserBusinessCfgMgmt extends BaseMgmt implements IUserBusinessCfgMgmt {

	private static final long serialVersionUID = 1L;
	private IUserBusinessCfgAdapt userBusinessCfgAdapt;
	
	public IUserBusinessCfgAdapt getUserBusinessCfgAdapt() {
		return userBusinessCfgAdapt;
	}
	public void setUserBusinessCfgAdapt(IUserBusinessCfgAdapt userBusinessCfgAdapt) {
		this.userBusinessCfgAdapt = userBusinessCfgAdapt;
	}

	public String getKey() {
		return userBusinessCfgAdapt.getKey();
	}

	public UserBusinessCfg createUserBusinessCfg(UserBusinessCfg userBusinessCfg) {
		userBusinessCfgAdapt.createUserBusinessCfg(userBusinessCfg);
		return userBusinessCfg;
	}

	public UserBusinessCfg modifyUserBusinessCfg(UserBusinessCfg userBusinessCfg) {
		userBusinessCfgAdapt.modifyUserBusinessCfg(userBusinessCfg);
		return userBusinessCfg;
	}

	public void deleteUserBusinessCfg(UserBusinessCfg userBusinessCfg) {
		userBusinessCfgAdapt.deleteUserBusinessCfg(userBusinessCfg);
	}

	public void batchDeleteUserBusinessCfg(List<UserBusinessCfg> userBusinessCfgList) {
		userBusinessCfgAdapt.batchDeleteUserBusinessCfg(userBusinessCfgList);
	}

	public UserBusinessCfg getUserBusinessCfgById(String userBusinessCfgId) {
		return userBusinessCfgAdapt.getUserBusinessCfgById(userBusinessCfgId);
	}

	public List<UserBusinessCfg> queryUserBusinessCfg(UserBusinessCfg userBusinessCfg) {
		return userBusinessCfgAdapt.queryUserBusinessCfg(userBusinessCfg);
	}
	
	public List<Business> queryByUserId(String userId){
		return userBusinessCfgAdapt.queryByUserId(userId);
	}
}