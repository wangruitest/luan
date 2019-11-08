package com.funo.roleregioncfg.dao;

import java.util.List;

import com.funo.base.dao.CommonDao;
import com.funo.roleregioncfg.model.RoleRegionCfg;

public interface IRoleRegionCfgDao extends CommonDao<RoleRegionCfg> {
	
	public List<RoleRegionCfg> queryByRegionForCity(RoleRegionCfg roleRegionCfg);

}