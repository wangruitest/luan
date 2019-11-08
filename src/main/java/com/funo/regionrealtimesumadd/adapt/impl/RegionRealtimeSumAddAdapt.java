package com.funo.regionrealtimesumadd.adapt.impl;

import java.util.List;

import com.funo.base.adapt.BaseAdapt;
import com.funo.regionrealtimesumadd.dao.IRegionRealtimeSumAddDao;
import com.funo.regionrealtimesumadd.adapt.IRegionRealtimeSumAddAdapt;
import com.funo.regionrealtimesumadd.model.RegionRealtimeSumAdd;

public class RegionRealtimeSumAddAdapt extends BaseAdapt implements IRegionRealtimeSumAddAdapt {

	private static final long serialVersionUID = 1L;
	private IRegionRealtimeSumAddDao regionRealtimeSumAddDao;
	
	public IRegionRealtimeSumAddDao getRegionRealtimeSumAddDao() {
		return regionRealtimeSumAddDao;
	}

	public void setRegionRealtimeSumAddDao(IRegionRealtimeSumAddDao regionRealtimeSumAddDao) {
		this.regionRealtimeSumAddDao = regionRealtimeSumAddDao;
	}

	public String getKey() {
		return regionRealtimeSumAddDao.getKey();
	}

	public RegionRealtimeSumAdd createRegionRealtimeSumAdd(RegionRealtimeSumAdd regionRealtimeSumAdd) {
		regionRealtimeSumAddDao.create(regionRealtimeSumAdd);
		return regionRealtimeSumAdd;
	}

	public RegionRealtimeSumAdd modifyRegionRealtimeSumAdd(RegionRealtimeSumAdd regionRealtimeSumAdd) {
		regionRealtimeSumAddDao.update(regionRealtimeSumAdd);
		return regionRealtimeSumAdd;
	}

	public void deleteRegionRealtimeSumAdd(RegionRealtimeSumAdd regionRealtimeSumAdd) {
		regionRealtimeSumAddDao.delete(regionRealtimeSumAdd);
	}

	public void batchDeleteRegionRealtimeSumAdd(List<RegionRealtimeSumAdd> regionRealtimeSumAddList) {
		regionRealtimeSumAddDao.batchCreate(regionRealtimeSumAddList);
	}

	public RegionRealtimeSumAdd getRegionRealtimeSumAddById(String regionRealtimeSumAddId) {
		return regionRealtimeSumAddDao.getById(regionRealtimeSumAddId);
	}

	public List<RegionRealtimeSumAdd> queryRegionRealtimeSumAdd(RegionRealtimeSumAdd regionRealtimeSumAdd) {
		return regionRealtimeSumAddDao.queryByArgs(regionRealtimeSumAdd);
	}
	
	public List<RegionRealtimeSumAdd> queryCityidRegionid(RegionRealtimeSumAdd regionRealtimeSumAdd) {
		return regionRealtimeSumAddDao.queryByCityidRegionid(regionRealtimeSumAdd);
	}
	
	public List<RegionRealtimeSumAdd> queryCityidRegionidIn(RegionRealtimeSumAdd regionRealtimeSumAdd) {
		return regionRealtimeSumAddDao.queryByCityidRegionidIn(regionRealtimeSumAdd);
	}
	
	public List<RegionRealtimeSumAdd> queryCityidRegionidOut(RegionRealtimeSumAdd regionRealtimeSumAdd) {
		return regionRealtimeSumAddDao.queryByCityidRegionidOut(regionRealtimeSumAdd);
	}
	
	public List<RegionRealtimeSumAdd> queryAllcitysOut(RegionRealtimeSumAdd regionRealtimeSumAdd) {
		return regionRealtimeSumAddDao.queryByAllcitysOut(regionRealtimeSumAdd);
	}
	
	public List<RegionRealtimeSumAdd> queryAllcitysIn(RegionRealtimeSumAdd regionRealtimeSumAdd) {
		return regionRealtimeSumAddDao.queryByAllcitysIn(regionRealtimeSumAdd);
	}
	
}