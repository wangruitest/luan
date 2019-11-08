package com.funo.regionremain.adapt.impl;

import java.util.List;

import com.funo.base.adapt.BaseAdapt;
import com.funo.regionremain.dao.IRegionRemainDao;
import com.funo.regionremain.adapt.IRegionRemainAdapt;
import com.funo.regionremain.model.RegionRemain;

public class RegionRemainAdapt extends BaseAdapt implements IRegionRemainAdapt {

	private static final long serialVersionUID = 1L;
	private IRegionRemainDao regionRemainDao;
	
	public IRegionRemainDao getRegionRemainDao() {
		return regionRemainDao;
	}

	public void setRegionRemainDao(IRegionRemainDao regionRemainDao) {
		this.regionRemainDao = regionRemainDao;
	}

	public String getKey() {
		return regionRemainDao.getKey();
	}

	public RegionRemain createRegionRemain(RegionRemain regionRemain) {
		regionRemainDao.create(regionRemain);
		return regionRemain;
	}

	public RegionRemain modifyRegionRemain(RegionRemain regionRemain) {
		regionRemainDao.update(regionRemain);
		return regionRemain;
	}

	public void deleteRegionRemain(RegionRemain regionRemain) {
		regionRemainDao.delete(regionRemain);
	}

	public void batchDeleteRegionRemain(List<RegionRemain> regionRemainList) {
		regionRemainDao.batchCreate(regionRemainList);
	}

	public RegionRemain getRegionRemainById(String regionRemainId) {
		return regionRemainDao.getById(regionRemainId);
	}

	public List<RegionRemain> queryRegionRemain(RegionRemain regionRemain) {
		return regionRemainDao.queryByArgs(regionRemain);
	}
	
	public List<RegionRemain> queryRegionRemainYsearch(RegionRemain regionRemain) {
		return regionRemainDao.queryBySearchYsearch(regionRemain);
	}
	
	public List<RegionRemain> queryRegionRemainQsearch(RegionRemain regionRemain) {
		return regionRemainDao.queryBySearchQsearch(regionRemain);
	}
	
	public List<RegionRemain> queryRegionRemainMsearch(RegionRemain regionRemain) {
		return regionRemainDao.queryBySearchMsearch(regionRemain);
	}
	
}