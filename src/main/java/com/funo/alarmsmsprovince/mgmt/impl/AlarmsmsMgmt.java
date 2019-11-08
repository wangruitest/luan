package com.funo.alarmsmsprovince.mgmt.impl;

import java.util.List;

import com.funo.base.mgmt.BaseMgmt;
import com.funo.alarmsmsprovince.adapt.IAlarmsmsAdapt;
import com.funo.alarmsmsprovince.mgmt.IAlarmsmsMgmt;
import com.funo.alarmsmsprovince.model.Alarmsms;

public class AlarmsmsMgmt extends BaseMgmt implements IAlarmsmsMgmt {

	private static final long serialVersionUID = 1L;
	private IAlarmsmsAdapt alarmsmsprovinceAdapt;
	
	public String getKey() {
		return alarmsmsprovinceAdapt.getKey();
	}

	public Alarmsms createAlarmsms(Alarmsms alarmsms) {
		alarmsmsprovinceAdapt.createAlarmsms(alarmsms);
		return alarmsms;
	}

	public Alarmsms modifyAlarmsms(Alarmsms alarmsms) {
		alarmsmsprovinceAdapt.modifyAlarmsms(alarmsms);
		return alarmsms;
	}

	public void deleteAlarmsms(Alarmsms alarmsms) {
		alarmsmsprovinceAdapt.deleteAlarmsms(alarmsms);
	}

	public void batchDeleteAlarmsms(List<Alarmsms> alarmsmsList) {
		alarmsmsprovinceAdapt.batchDeleteAlarmsms(alarmsmsList);
	}

	public Alarmsms getAlarmsmsById(String alarmsmsId) {
		return alarmsmsprovinceAdapt.getAlarmsmsById(alarmsmsId);
	}

	public List<Alarmsms> queryAlarmsms(Alarmsms alarmsms) {
		return alarmsmsprovinceAdapt.queryAlarmsms(alarmsms);
	}

	public IAlarmsmsAdapt getAlarmsmsprovinceAdapt() {
		return alarmsmsprovinceAdapt;
	}

	public void setAlarmsmsprovinceAdapt(IAlarmsmsAdapt alarmsmsprovinceAdapt) {
		this.alarmsmsprovinceAdapt = alarmsmsprovinceAdapt;
	}
	
}