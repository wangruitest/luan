package com.funo.alarmLevel.adapt;

import java.util.List;

import com.funo.alarmLevel.model.Region;
import com.funo.alarmLevel.model.RegionAlarmLevel;


public interface IRegionAlarmLevelAdapt {

	public String getKey();

	public RegionAlarmLevel createRegionAlarmLevel(RegionAlarmLevel regionAlarmLevel);

	public RegionAlarmLevel modifyRegionAlarmLevel(RegionAlarmLevel regionAlarmLevel);

	public void deleteRegionAlarmLevel(RegionAlarmLevel regionAlarmLevel);

	public void batchDeleteRegionAlarmLevel(List<RegionAlarmLevel> regionAlarmLevelList);

	public RegionAlarmLevel getRegionAlarmLevelById(String unid);

	public List<RegionAlarmLevel> queryRegionAlarmLevel(RegionAlarmLevel regionAlarmLevel);

	List<Region> queryByRegion();

}