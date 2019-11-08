package com.funo.alarmsmsprovince.adapt.impl;

import java.util.List;

import com.funo.base.adapt.BaseAdapt;
import com.funo.alarmsmsprovince.dao.IAlarmsmsDao;
import com.funo.alarmsmsprovince.adapt.IAlarmsmsAdapt;
import com.funo.alarmsmsprovince.model.Alarmsms;

public class AlarmsmsAdapt extends BaseAdapt implements IAlarmsmsAdapt {

	private static final long serialVersionUID = 1L;
	private IAlarmsmsDao alarmsmsprovinceDao;
	
	public String getKey() {
		return alarmsmsprovinceDao.getKey();
	}

	public Alarmsms createAlarmsms(Alarmsms alarmsms) {
		alarmsmsprovinceDao.create(alarmsms);
		return alarmsms;
	}

	public Alarmsms modifyAlarmsms(Alarmsms alarmsms) {
		alarmsmsprovinceDao.update(alarmsms);
		return alarmsms;
	}

	public void deleteAlarmsms(Alarmsms alarmsms) {
		alarmsmsprovinceDao.delete(alarmsms);
	}

	public void batchDeleteAlarmsms(List<Alarmsms> alarmsmsList) {
		alarmsmsprovinceDao.batchCreate(alarmsmsList);
	}

	public Alarmsms getAlarmsmsById(String alarmsmsId) {
		return alarmsmsprovinceDao.getById(alarmsmsId);
	}

	public List<Alarmsms> queryAlarmsms(Alarmsms alarmsms) {
		return alarmsmsprovinceDao.queryByArgs(alarmsms);
	}

	public IAlarmsmsDao getAlarmsmsprovinceDao() {
		return alarmsmsprovinceDao;
	}

	public void setAlarmsmsprovinceDao(IAlarmsmsDao alarmsmsprovinceDao) {
		this.alarmsmsprovinceDao = alarmsmsprovinceDao;
	}
	
}