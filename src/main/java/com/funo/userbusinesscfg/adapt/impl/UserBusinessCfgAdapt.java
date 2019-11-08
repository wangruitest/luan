package com.funo.userbusinesscfg.adapt.impl;

import java.util.List;

import com.funo.base.adapt.BaseAdapt;
import com.funo.business.model.Business;
import com.funo.userbusinesscfg.dao.IUserBusinessCfgDao;
import com.funo.userbusinesscfg.adapt.IUserBusinessCfgAdapt;
import com.funo.userbusinesscfg.model.UserBusinessCfg;

public class UserBusinessCfgAdapt extends BaseAdapt implements IUserBusinessCfgAdapt {

	private static final long serialVersionUID = 1L;
	private IUserBusinessCfgDao userBusinessCfgDao;
	
	public IUserBusinessCfgDao getUserBusinessCfgDao() {
		return userBusinessCfgDao;
	}

	public void setUserBusinessCfgDao(IUserBusinessCfgDao userBusinessCfgDao) {
		this.userBusinessCfgDao = userBusinessCfgDao;
	}

	public String getKey() {
		return userBusinessCfgDao.getKey();
	}

	public UserBusinessCfg createUserBusinessCfg(UserBusinessCfg userBusinessCfg) {
		userBusinessCfgDao.create(userBusinessCfg);
		return userBusinessCfg;
	}

	public UserBusinessCfg modifyUserBusinessCfg(UserBusinessCfg userBusinessCfg) {
		userBusinessCfgDao.update(userBusinessCfg);
		return userBusinessCfg;
	}

	public void deleteUserBusinessCfg(UserBusinessCfg userBusinessCfg) {
		userBusinessCfgDao.delete(userBusinessCfg);
	}

	public void batchDeleteUserBusinessCfg(List<UserBusinessCfg> userBusinessCfgList) {
		userBusinessCfgDao.batchCreate(userBusinessCfgList);
	}

	public UserBusinessCfg getUserBusinessCfgById(String userBusinessCfgId) {
		return userBusinessCfgDao.getById(userBusinessCfgId);
	}

	public List<UserBusinessCfg> queryUserBusinessCfg(UserBusinessCfg userBusinessCfg) {
		return userBusinessCfgDao.queryByArgs(userBusinessCfg);
	}
	
	public List<Business> queryByUserId(String userId){
		return userBusinessCfgDao.queryByUserId(userId);
	}
}