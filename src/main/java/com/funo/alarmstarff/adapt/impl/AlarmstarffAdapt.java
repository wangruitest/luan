package com.funo.alarmstarff.adapt.impl;

import java.util.List;

import com.funo.base.adapt.BaseAdapt;
import com.funo.alarmstarff.dao.IAlarmstarffDao;
import com.funo.alarmstarff.adapt.IAlarmstarffAdapt;
import com.funo.alarmstarff.model.Alarmstarff;

public class AlarmstarffAdapt extends BaseAdapt implements IAlarmstarffAdapt {

	private static final long serialVersionUID = 1L;
	private IAlarmstarffDao alarmstarffDao;
	
	public IAlarmstarffDao getAlarmstarffDao() {
		return alarmstarffDao;
	}

	public void setAlarmstarffDao(IAlarmstarffDao alarmstarffDao) {
		this.alarmstarffDao = alarmstarffDao;
	}

	public String getKey() {
		return alarmstarffDao.getKey();
	}

	public Alarmstarff createAlarmstarff(Alarmstarff alarmstarff) {
		alarmstarffDao.create(alarmstarff);
		return alarmstarff;
	}

	public Alarmstarff modifyAlarmstarff(Alarmstarff alarmstarff) {
		alarmstarffDao.update(alarmstarff);
		return alarmstarff;
	}

	public void deleteAlarmstarff(Alarmstarff alarmstarff) {
		alarmstarffDao.delete(alarmstarff);
	}

	public void batchDeleteAlarmstarff(List<Alarmstarff> alarmstarffList) {
		alarmstarffDao.batchCreate(alarmstarffList);
	}

	public Alarmstarff getAlarmstarffById(String alarmstarffId) {
		return alarmstarffDao.getById(alarmstarffId);
	}

	public List<Alarmstarff> queryAlarmstarff(Alarmstarff alarmstarff) {
		return alarmstarffDao.queryByArgs(alarmstarff);
	}
	
	public List<Alarmstarff> queryPhoneNumExistence(Alarmstarff alarmstarff) {
		return alarmstarffDao.queryByPhoneNumExistence(alarmstarff);
	}
	
	public List<Alarmstarff> queryPhoneNum(Alarmstarff alarmstarff) {
		return alarmstarffDao.queryByPhoneNum(alarmstarff);
	}
	
}