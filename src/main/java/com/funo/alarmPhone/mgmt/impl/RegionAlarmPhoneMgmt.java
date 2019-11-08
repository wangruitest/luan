package com.funo.alarmPhone.mgmt.impl;

import java.util.List;

import com.funo.alarmPhone.model.Region;
import com.funo.base.mgmt.BaseMgmt;
import com.funo.alarmPhone.adapt.IRegionAlarmPhoneAdapt;
import com.funo.alarmPhone.mgmt.IRegionAlarmPhoneMgmt;
import com.funo.alarmPhone.model.RegionAlarmPhone;

public class RegionAlarmPhoneMgmt extends BaseMgmt implements IRegionAlarmPhoneMgmt {

	private static final long serialVersionUID = 1L;
	private IRegionAlarmPhoneAdapt regionAlarmPhoneAdapt;
	
	public IRegionAlarmPhoneAdapt getRegionAlarmPhoneAdapt() {
		return regionAlarmPhoneAdapt;
	}
	public void setRegionAlarmPhoneAdapt(IRegionAlarmPhoneAdapt regionAlarmPhoneAdapt) {
		this.regionAlarmPhoneAdapt = regionAlarmPhoneAdapt;
	}

	public String getKey() {
		return regionAlarmPhoneAdapt.getKey();
	}

	public RegionAlarmPhone createRegionAlarmPhone(RegionAlarmPhone regionAlarmPhone) {
		regionAlarmPhoneAdapt.createRegionAlarmPhone(regionAlarmPhone);
		return regionAlarmPhone;
	}

	public RegionAlarmPhone modifyRegionAlarmPhone(RegionAlarmPhone regionAlarmPhone) {
		regionAlarmPhoneAdapt.modifyRegionAlarmPhone(regionAlarmPhone);
		return regionAlarmPhone;
	}

	public void deleteRegionAlarmPhone(RegionAlarmPhone regionAlarmPhone) {
		regionAlarmPhoneAdapt.deleteRegionAlarmPhone(regionAlarmPhone);
	}

	public void batchDeleteRegionAlarmPhone(List<RegionAlarmPhone> regionAlarmPhoneList) {
		regionAlarmPhoneAdapt.batchDeleteRegionAlarmPhone(regionAlarmPhoneList);
	}

	public RegionAlarmPhone getRegionAlarmPhoneById(String regionAlarmPhoneId) {
		return regionAlarmPhoneAdapt.getRegionAlarmPhoneById(regionAlarmPhoneId);
	}

	public List<RegionAlarmPhone> queryRegionAlarmPhone(RegionAlarmPhone regionAlarmPhone) {
		return regionAlarmPhoneAdapt.queryRegionAlarmPhone(regionAlarmPhone);
	}

	@Override
	public List<Region> queryRegions(RegionAlarmPhone regionAlarmPhone) {

		return regionAlarmPhoneAdapt.queryRegions(regionAlarmPhone);
	}

	@Override
	public Boolean isUserExist(RegionAlarmPhone regionAlarmPhone) {
		return regionAlarmPhoneAdapt.isUserExist(regionAlarmPhone);
	}

}