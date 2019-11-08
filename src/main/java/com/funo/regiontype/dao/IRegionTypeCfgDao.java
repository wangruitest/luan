package com.funo.regiontype.dao;

import java.util.List;

import com.funo.base.dao.CommonDao;
import com.funo.regiontype.model.RegionTypeCfg;

public interface IRegionTypeCfgDao extends CommonDao<RegionTypeCfg> {
	
	public List<RegionTypeCfg> queryByIsExist(RegionTypeCfg regionTypeCfg);
	public List<RegionTypeCfg> queryByInsertIsExist(RegionTypeCfg regionTypeCfg);
}