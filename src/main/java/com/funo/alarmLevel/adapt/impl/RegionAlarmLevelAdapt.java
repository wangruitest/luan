package com.funo.alarmLevel.adapt.impl;

import java.util.List;

import com.funo.alarmLevel.model.Region;
import com.funo.base.adapt.BaseAdapt;
import com.funo.alarmLevel.dao.IRegionAlarmLevelDao;
import com.funo.alarmLevel.adapt.IRegionAlarmLevelAdapt;
import com.funo.alarmLevel.model.RegionAlarmLevel;

public class RegionAlarmLevelAdapt extends BaseAdapt implements IRegionAlarmLevelAdapt {

	private static final long serialVersionUID = 1L;
	private IRegionAlarmLevelDao regionAlarmLevelDao;
	
	public IRegionAlarmLevelDao getRegionAlarmLevelDao() {
		return regionAlarmLevelDao;
	}

	public void setRegionAlarmLevelDao(IRegionAlarmLevelDao regionAlarmLevelDao) {
		this.regionAlarmLevelDao = regionAlarmLevelDao;
	}

	public String getKey() {
		return regionAlarmLevelDao.getKey();
	}

	public RegionAlarmLevel createRegionAlarmLevel(RegionAlarmLevel regionAlarmLevel) {
		regionAlarmLevelDao.create(regionAlarmLevel);
		return regionAlarmLevel;
	}

	public RegionAlarmLevel modifyRegionAlarmLevel(RegionAlarmLevel regionAlarmLevel) {
		regionAlarmLevelDao.update(regionAlarmLevel);
		return regionAlarmLevel;
	}

	public void deleteRegionAlarmLevel(RegionAlarmLevel regionAlarmLevel) {
		regionAlarmLevelDao.delete(regionAlarmLevel);
	}

	public void batchDeleteRegionAlarmLevel(List<RegionAlarmLevel> regionAlarmLevelList) {
		regionAlarmLevelDao.batchCreate(regionAlarmLevelList);
	}

	public RegionAlarmLevel getRegionAlarmLevelById(String regionAlarmLevelId) {
		return regionAlarmLevelDao.getById(regionAlarmLevelId);
	}

	public List<RegionAlarmLevel> queryRegionAlarmLevel(RegionAlarmLevel regionAlarmLevel) {
		return regionAlarmLevelDao.queryByArgs(regionAlarmLevel);
	}

	@Override
	public List<Region> queryByRegion() {
		return regionAlarmLevelDao.queryByRegion();
	}

}