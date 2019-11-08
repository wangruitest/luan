package com.funo.userbusinesscfg.dao;

import java.util.List;

import com.funo.base.dao.CommonDao;
import com.funo.business.model.Business;
import com.funo.userbusinesscfg.model.UserBusinessCfg;

public interface IUserBusinessCfgDao extends CommonDao<UserBusinessCfg> {

	public List<Business> queryByUserId(String userId);
}