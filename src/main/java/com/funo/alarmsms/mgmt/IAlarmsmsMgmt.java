package com.funo.alarmsms.mgmt;

import java.util.List;

import com.funo.alarmsms.model.Alarmsms;


public interface IAlarmsmsMgmt {

	public String getKey();

	public Alarmsms createAlarmsms(Alarmsms alarmsms);

	public Alarmsms modifyAlarmsms(Alarmsms alarmsms);

	public void deleteAlarmsms(Alarmsms alarmsms);

	public void batchDeleteAlarmsms(List<Alarmsms> alarmsmsList);

	public Alarmsms getAlarmsmsById(String unid);

	public List<Alarmsms> queryAlarmsms(Alarmsms alarmsms);

}