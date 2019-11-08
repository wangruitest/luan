package com.funo.alarmLevel.dao;

import com.funo.alarmLevel.model.Region;
import com.funo.base.dao.CommonDao;
import com.funo.alarmLevel.model.RegionAlarmLevel;

import java.util.List;

public interface IRegionAlarmLevelDao extends CommonDao<RegionAlarmLevel> {

     List<Region> queryByRegion();
}