package com.funo.alarmPhone.mgmt;

import java.util.List;

import com.funo.alarmPhone.model.Region;
import com.funo.alarmPhone.model.RegionAlarmPhone;


public interface IRegionAlarmPhoneMgmt {

	public String getKey();

	public RegionAlarmPhone createRegionAlarmPhone(RegionAlarmPhone regionAlarmPhone);

	public RegionAlarmPhone modifyRegionAlarmPhone(RegionAlarmPhone regionAlarmPhone);

	public void deleteRegionAlarmPhone(RegionAlarmPhone regionAlarmPhone);

	public void batchDeleteRegionAlarmPhone(List<RegionAlarmPhone> regionAlarmPhoneList);

	public RegionAlarmPhone getRegionAlarmPhoneById(String unid);

	public List<RegionAlarmPhone> queryRegionAlarmPhone(RegionAlarmPhone regionAlarmPhone);

	List<Region> queryRegions(RegionAlarmPhone regionAlarmPhone);

	Boolean isUserExist(RegionAlarmPhone regionAlarmPhone);

}