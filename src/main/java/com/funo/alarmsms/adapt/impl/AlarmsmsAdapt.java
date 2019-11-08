package com.funo.alarmsms.adapt.impl;

import java.util.List;

import com.funo.base.adapt.BaseAdapt;
import com.funo.alarmsms.dao.IAlarmsmsDao;
import com.funo.alarmsms.adapt.IAlarmsmsAdapt;
import com.funo.alarmsms.model.Alarmsms;

public class AlarmsmsAdapt extends BaseAdapt implements IAlarmsmsAdapt {

	private static final long serialVersionUID = 1L;
	private IAlarmsmsDao alarmsmsDao;
	
	public IAlarmsmsDao getAlarmsmsDao() {
		return alarmsmsDao;
	}

	public void setAlarmsmsDao(IAlarmsmsDao alarmsmsDao) {
		this.alarmsmsDao = alarmsmsDao;
	}

	public String getKey() {
		return alarmsmsDao.getKey();
	}

	public Alarmsms createAlarmsms(Alarmsms alarmsms) {
		alarmsmsDao.create(alarmsms);
		return alarmsms;
	}

	public Alarmsms modifyAlarmsms(Alarmsms alarmsms) {
		alarmsmsDao.update(alarmsms);
		return alarmsms;
	}

	public void deleteAlarmsms(Alarmsms alarmsms) {
		alarmsmsDao.delete(alarmsms);
	}

	public void batchDeleteAlarmsms(List<Alarmsms> alarmsmsList) {
		alarmsmsDao.batchCreate(alarmsmsList);
	}

	public Alarmsms getAlarmsmsById(String alarmsmsId) {
		return alarmsmsDao.getById(alarmsmsId);
	}

	public List<Alarmsms> queryAlarmsms(Alarmsms alarmsms) {
		return alarmsmsDao.queryByArgs(alarmsms);
	}
	
}