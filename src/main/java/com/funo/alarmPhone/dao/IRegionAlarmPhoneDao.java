package com.funo.alarmPhone.dao;

import com.funo.alarmPhone.model.Region;
import com.funo.base.dao.CommonDao;
import com.funo.alarmPhone.model.RegionAlarmPhone;

import java.util.List;

public interface IRegionAlarmPhoneDao extends CommonDao<RegionAlarmPhone> {

    List<Region> queryByRegions(RegionAlarmPhone regionAlarmPhone);

    List<RegionAlarmPhone> queryByUser(RegionAlarmPhone regionAlarmPhone);
}