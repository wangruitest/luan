package com.funo.userbusinesscfg.mgmt;

import java.util.List;

import com.funo.business.model.Business;
import com.funo.userbusinesscfg.model.UserBusinessCfg;


public interface IUserBusinessCfgMgmt {

	public String getKey();

	public UserBusinessCfg createUserBusinessCfg(UserBusinessCfg userBusinessCfg);

	public UserBusinessCfg modifyUserBusinessCfg(UserBusinessCfg userBusinessCfg);

	public void deleteUserBusinessCfg(UserBusinessCfg userBusinessCfg);

	public void batchDeleteUserBusinessCfg(List<UserBusinessCfg> userBusinessCfgList);

	public UserBusinessCfg getUserBusinessCfgById(String unid);

	public List<UserBusinessCfg> queryUserBusinessCfg(UserBusinessCfg userBusinessCfg);

	public List<Business> queryByUserId(String userId);
}