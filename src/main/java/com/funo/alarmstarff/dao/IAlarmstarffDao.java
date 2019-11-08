package com.funo.alarmstarff.dao;

import java.util.List;

import com.funo.base.dao.CommonDao;
import com.funo.alarmstarff.model.Alarmstarff;

public interface IAlarmstarffDao extends CommonDao<Alarmstarff> {
	//添加时验证号码是否存在
	public List<Alarmstarff> queryByPhoneNumExistence(Alarmstarff alarmstarff);
	//修改时验证号码是否存在
	public List<Alarmstarff> queryByPhoneNum(Alarmstarff alarmstarff);
}