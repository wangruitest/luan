package com.funo.alarmLevel.mgmt.impl;

import java.util.List;

import com.funo.alarmLevel.model.Region;
import com.funo.base.mgmt.BaseMgmt;
import com.funo.alarmLevel.adapt.IRegionAlarmLevelAdapt;
import com.funo.alarmLevel.mgmt.IRegionAlarmLevelMgmt;
import com.funo.alarmLevel.model.RegionAlarmLevel;

public class RegionAlarmLevelMgmt extends BaseMgmt implements IRegionAlarmLevelMgmt {

	private static final long serialVersionUID = 1L;
	private IRegionAlarmLevelAdapt regionAlarmLevelAdapt;
	
	public IRegionAlarmLevelAdapt getRegionAlarmLevelAdapt() {
		return regionAlarmLevelAdapt;
	}
	public void setRegionAlarmLevelAdapt(IRegionAlarmLevelAdapt regionAlarmLevelAdapt) {
		this.regionAlarmLevelAdapt = regionAlarmLevelAdapt;
	}

	public String getKey() {
		return regionAlarmLevelAdapt.getKey();
	}

	public RegionAlarmLevel createRegionAlarmLevel(RegionAlarmLevel regionAlarmLevel) {
		regionAlarmLevelAdapt.createRegionAlarmLevel(regionAlarmLevel);
		return regionAlarmLevel;
	}

	public RegionAlarmLevel modifyRegionAlarmLevel(RegionAlarmLevel regionAlarmLevel) {
		regionAlarmLevelAdapt.modifyRegionAlarmLevel(regionAlarmLevel);
		return regionAlarmLevel;
	}

	public void deleteRegionAlarmLevel(RegionAlarmLevel regionAlarmLevel) {
		regionAlarmLevelAdapt.deleteRegionAlarmLevel(regionAlarmLevel);
	}

	public void batchDeleteRegionAlarmLevel(List<RegionAlarmLevel> regionAlarmLevelList) {
		regionAlarmLevelAdapt.batchDeleteRegionAlarmLevel(regionAlarmLevelList);
	}

	public RegionAlarmLevel getRegionAlarmLevelById(String regionAlarmLevelId) {
		return regionAlarmLevelAdapt.getRegionAlarmLevelById(regionAlarmLevelId);
	}

	public List<RegionAlarmLevel> queryRegionAlarmLevel(RegionAlarmLevel regionAlarmLevel) {
		return regionAlarmLevelAdapt.queryRegionAlarmLevel(regionAlarmLevel);
	}

	@Override
	public List<Region> queryByRegion() {
		return regionAlarmLevelAdapt.queryByRegion();
	}

}