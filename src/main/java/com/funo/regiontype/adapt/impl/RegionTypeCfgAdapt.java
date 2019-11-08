package com.funo.regiontype.adapt.impl;

import java.util.List;

import com.funo.base.adapt.BaseAdapt;
import com.funo.regiontype.dao.IRegionTypeCfgDao;
import com.funo.regiontype.adapt.IRegionTypeCfgAdapt;
import com.funo.regiontype.model.RegionTypeCfg;

public class RegionTypeCfgAdapt extends BaseAdapt implements IRegionTypeCfgAdapt {

	private static final long serialVersionUID = 1L;
	private IRegionTypeCfgDao regionTypeCfgDao;
	
	public IRegionTypeCfgDao getRegionTypeCfgDao() {
		return regionTypeCfgDao;
	}

	public void setRegionTypeCfgDao(IRegionTypeCfgDao regionTypeCfgDao) {
		this.regionTypeCfgDao = regionTypeCfgDao;
	}

	public String getKey() {
		return regionTypeCfgDao.getKey();
	}

	public RegionTypeCfg createRegionTypeCfg(RegionTypeCfg regionTypeCfg) {
		regionTypeCfgDao.create(regionTypeCfg);
		return regionTypeCfg;
	}

	public RegionTypeCfg modifyRegionTypeCfg(RegionTypeCfg regionTypeCfg) {
		regionTypeCfgDao.update(regionTypeCfg);
		return regionTypeCfg;
	}

	public void deleteRegionTypeCfg(RegionTypeCfg regionTypeCfg) {
		regionTypeCfgDao.delete(regionTypeCfg);
	}

	public void batchDeleteRegionTypeCfg(List<RegionTypeCfg> regionTypeCfgList) {
		regionTypeCfgDao.batchCreate(regionTypeCfgList);
	}

	public RegionTypeCfg getRegionTypeCfgById(String regionTypeCfgId) {
		return regionTypeCfgDao.getById(regionTypeCfgId);
	}

	public List<RegionTypeCfg> queryRegionTypeCfg(RegionTypeCfg regionTypeCfg) {
		return regionTypeCfgDao.queryByArgs(regionTypeCfg);
	}

	@Override
	public List<RegionTypeCfg> updateForIsExist(RegionTypeCfg regionTypeCfg) {
		return regionTypeCfgDao.queryByIsExist(regionTypeCfg);
	}

	@Override
	public List<RegionTypeCfg> insertForIsExist(RegionTypeCfg regionTypeCfg) {
		return regionTypeCfgDao.queryByInsertIsExist(regionTypeCfg);
	}
	
}