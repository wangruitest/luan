package com.funo.alarmPhone.adapt.impl;

import java.util.List;

import com.funo.alarmPhone.model.Region;
import com.funo.base.adapt.BaseAdapt;
import com.funo.alarmPhone.dao.IRegionAlarmPhoneDao;
import com.funo.alarmPhone.adapt.IRegionAlarmPhoneAdapt;
import com.funo.alarmPhone.model.RegionAlarmPhone;

public class RegionAlarmPhoneAdapt extends BaseAdapt implements IRegionAlarmPhoneAdapt {

	private static final long serialVersionUID = 1L;
	private IRegionAlarmPhoneDao regionAlarmPhoneDao;
	
	public IRegionAlarmPhoneDao getRegionAlarmPhoneDao() {
		return regionAlarmPhoneDao;
	}

	public void setRegionAlarmPhoneDao(IRegionAlarmPhoneDao regionAlarmPhoneDao) {
		this.regionAlarmPhoneDao = regionAlarmPhoneDao;
	}

	public String getKey() {
		return regionAlarmPhoneDao.getKey();
	}

	public RegionAlarmPhone createRegionAlarmPhone(RegionAlarmPhone regionAlarmPhone) {
		regionAlarmPhoneDao.create(regionAlarmPhone);
		return regionAlarmPhone;
	}

	public RegionAlarmPhone modifyRegionAlarmPhone(RegionAlarmPhone regionAlarmPhone) {
		regionAlarmPhoneDao.update(regionAlarmPhone);
		return regionAlarmPhone;
	}

	public void deleteRegionAlarmPhone(RegionAlarmPhone regionAlarmPhone) {
		regionAlarmPhoneDao.delete(regionAlarmPhone);
	}

	public void batchDeleteRegionAlarmPhone(List<RegionAlarmPhone> regionAlarmPhoneList) {
		regionAlarmPhoneDao.batchCreate(regionAlarmPhoneList);
	}

	public RegionAlarmPhone getRegionAlarmPhoneById(String regionAlarmPhoneId) {
		return regionAlarmPhoneDao.getById(regionAlarmPhoneId);
	}

	public List<RegionAlarmPhone> queryRegionAlarmPhone(RegionAlarmPhone regionAlarmPhone) {
		return regionAlarmPhoneDao.queryByArgs(regionAlarmPhone);
	}

	@Override
	public List<Region> queryRegions(RegionAlarmPhone regionAlarmPhone) {
		return regionAlarmPhoneDao.queryByRegions(regionAlarmPhone);
	}

	@Override
	public Boolean isUserExist(RegionAlarmPhone regionAlarmPhone) {
		List<RegionAlarmPhone> list = regionAlarmPhoneDao.queryByUser(regionAlarmPhone);
		if(list!=null&&list.size()>0){
			return true;
		}
		return false;
	}

}