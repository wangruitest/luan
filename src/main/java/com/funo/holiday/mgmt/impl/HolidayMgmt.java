package com.funo.holiday.mgmt.impl;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.funo.base.mgmt.BaseMgmt;
import com.funo.holiday.adapt.IHolidayAdapt;
import com.funo.holiday.mgmt.IHolidayMgmt;
import com.funo.holiday.model.Holiday;

public class HolidayMgmt extends BaseMgmt implements IHolidayMgmt {

	private static final long serialVersionUID = 1L;
	
	private IHolidayAdapt holidayAdapt;
	
	public IHolidayAdapt getHolidayAdapt() {
		return holidayAdapt;
	}

	public void setHolidayAdapt(IHolidayAdapt holidayAdapt) {
		this.holidayAdapt = holidayAdapt;
	}

	@Override
	public void batchDeleteHoliday(List<Holiday> holidayList) {
		holidayAdapt.batchDeleteHoliday(holidayList);

	}

	@Override
	public Holiday createHoliday(Holiday holiday) {
		holidayAdapt.createHoliday(holiday);
		return holiday;
	}

	@Override
	public void deleteHoliday(Holiday holiday) {
		holidayAdapt.deleteHoliday(holiday);

	}

	@Override
	public Holiday getHolidayById(String unid) {
	
		return holidayAdapt.getHolidayById(unid);
	}

	@Override
	public String getKey() {
		// TODO Auto-generated method stub
		return holidayAdapt.getKey();
	}

	@Override
	public Holiday modifyHoliday(Holiday holiday) {
		holidayAdapt.modifyHoliday(holiday);
		return holiday;
	}

	@Override
	public List<Holiday> queryHoliday(Holiday holiday) {
		// TODO Auto-generated method stub
		return holidayAdapt.queryHoliday(holiday);
	}
	

	@Override
	public List<Holiday> queryListByYear(Holiday holiday) {
		// TODO Auto-generated method stub
		String start=holiday.getFirstDay();
		int temp=Integer.parseInt(start);
		holiday.setFirstDay(start+"-01-01");
		holiday.setLastDay(String.valueOf(temp+1)+"-01-01");
		return holidayAdapt.queryListByYear(holiday);
	}

	@Override
	public List<Holiday> queryListByName(Holiday holiday) {
		// TODO Auto-generated method stub
		return holidayAdapt.queryListByName(holiday);
	}

	@Override
	public List<Holiday> queryAll(Holiday holiday) {
		return holidayAdapt.queryAll(holiday);
	}

}
