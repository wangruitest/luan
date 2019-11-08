package com.funo.alarmstarff.mgmt;

import java.util.List;

import com.funo.alarmstarff.model.Alarmstarff;


public interface IAlarmstarffMgmt {

	public String getKey();

	public Alarmstarff createAlarmstarff(Alarmstarff alarmstarff);

	public Alarmstarff modifyAlarmstarff(Alarmstarff alarmstarff);

	public void deleteAlarmstarff(Alarmstarff alarmstarff);

	public void batchDeleteAlarmstarff(List<Alarmstarff> alarmstarffList);

	public Alarmstarff getAlarmstarffById(String unid);

	public List<Alarmstarff> queryAlarmstarff(Alarmstarff alarmstarff);
	
	public List<Alarmstarff> queryPhoneNumExistence(Alarmstarff alarmstarff);
	
	public List<Alarmstarff> queryPhoneNum(Alarmstarff alarmstarff);

}