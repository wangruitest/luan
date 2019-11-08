package com.funo.alarmsms.mgmt.impl;

import java.util.List;

import com.funo.base.mgmt.BaseMgmt;
import com.funo.alarmsms.adapt.IAlarmsmsAdapt;
import com.funo.alarmsms.mgmt.IAlarmsmsMgmt;
import com.funo.alarmsms.model.Alarmsms;

public class AlarmsmsMgmt extends BaseMgmt implements IAlarmsmsMgmt {

	private static final long serialVersionUID = 1L;
	private IAlarmsmsAdapt alarmsmsAdapt;
	
	public IAlarmsmsAdapt getAlarmsmsAdapt() {
		return alarmsmsAdapt;
	}
	public void setAlarmsmsAdapt(IAlarmsmsAdapt alarmsmsAdapt) {
		this.alarmsmsAdapt = alarmsmsAdapt;
	}

	public String getKey() {
		return alarmsmsAdapt.getKey();
	}

	public Alarmsms createAlarmsms(Alarmsms alarmsms) {
		alarmsmsAdapt.createAlarmsms(alarmsms);
		return alarmsms;
	}

	public Alarmsms modifyAlarmsms(Alarmsms alarmsms) {
		alarmsmsAdapt.modifyAlarmsms(alarmsms);
		return alarmsms;
	}

	public void deleteAlarmsms(Alarmsms alarmsms) {
		alarmsmsAdapt.deleteAlarmsms(alarmsms);
	}

	public void batchDeleteAlarmsms(List<Alarmsms> alarmsmsList) {
		alarmsmsAdapt.batchDeleteAlarmsms(alarmsmsList);
	}

	public Alarmsms getAlarmsmsById(String alarmsmsId) {
		return alarmsmsAdapt.getAlarmsmsById(alarmsmsId);
	}

	public List<Alarmsms> queryAlarmsms(Alarmsms alarmsms) {
		return alarmsmsAdapt.queryAlarmsms(alarmsms);
	}
	
}