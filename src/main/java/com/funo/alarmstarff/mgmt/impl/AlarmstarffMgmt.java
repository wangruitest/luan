package com.funo.alarmstarff.mgmt.impl;

import java.util.List;

import com.funo.base.mgmt.BaseMgmt;
import com.funo.alarmstarff.adapt.IAlarmstarffAdapt;
import com.funo.alarmstarff.mgmt.IAlarmstarffMgmt;
import com.funo.alarmstarff.model.Alarmstarff;

public class AlarmstarffMgmt extends BaseMgmt implements IAlarmstarffMgmt {

	private static final long serialVersionUID = 1L;
	private IAlarmstarffAdapt alarmstarffAdapt;
	
	public IAlarmstarffAdapt getAlarmstarffAdapt() {
		return alarmstarffAdapt;
	}
	public void setAlarmstarffAdapt(IAlarmstarffAdapt alarmstarffAdapt) {
		this.alarmstarffAdapt = alarmstarffAdapt;
	}

	public String getKey() {
		return alarmstarffAdapt.getKey();
	}

	public Alarmstarff createAlarmstarff(Alarmstarff alarmstarff) {
		alarmstarffAdapt.createAlarmstarff(alarmstarff);
		return alarmstarff;
	}

	public Alarmstarff modifyAlarmstarff(Alarmstarff alarmstarff) {
		alarmstarffAdapt.modifyAlarmstarff(alarmstarff);
		return alarmstarff;
	}

	public void deleteAlarmstarff(Alarmstarff alarmstarff) {
		alarmstarffAdapt.deleteAlarmstarff(alarmstarff);
	}

	public void batchDeleteAlarmstarff(List<Alarmstarff> alarmstarffList) {
		alarmstarffAdapt.batchDeleteAlarmstarff(alarmstarffList);
	}

	public Alarmstarff getAlarmstarffById(String alarmstarffId) {
		return alarmstarffAdapt.getAlarmstarffById(alarmstarffId);
	}

	public List<Alarmstarff> queryAlarmstarff(Alarmstarff alarmstarff) {
		return alarmstarffAdapt.queryAlarmstarff(alarmstarff);
	}
	
	public List<Alarmstarff> queryPhoneNumExistence(Alarmstarff alarmstarff) {
		return alarmstarffAdapt.queryPhoneNumExistence(alarmstarff);
	}
	
	public List<Alarmstarff> queryPhoneNum(Alarmstarff alarmstarff) {
		return alarmstarffAdapt.queryPhoneNum(alarmstarff);
	}
	
}