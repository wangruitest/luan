package com.funo.holiday.adapt.impl;

import java.util.List;

import com.funo.base.adapt.BaseAdapt;
import com.funo.holiday.adapt.IHolidayAdapt;
import com.funo.holiday.dao.IHolidayDao;
import com.funo.holiday.model.Holiday;

public class HolidayAdapt extends BaseAdapt implements IHolidayAdapt {

	private static final long serialVersionUID = 1L;
	
	private IHolidayDao holidayDao;
	
	public IHolidayDao getHolidayDao() {
		return holidayDao;
	}

	public void setHolidayDao(IHolidayDao holidayDao) {
		this.holidayDao = holidayDao;
	}

	@Override
	public void batchDeleteHoliday(List<Holiday> holidayList) {
		holidayDao.batchDelete(holidayList);

	}

	@Override
	public Holiday createHoliday(Holiday holiday) {
		holidayDao.create(holiday);
		return holiday;
	}

	@Override
	public void deleteHoliday(Holiday holiday) {
		holidayDao.delete(holiday);

	}

	@Override
	public Holiday getHolidayById(String unid) {
		
		return holidayDao.getById(unid);
	}

	@Override
	public String getKey() {
		// TODO Auto-generated method stub
		return holidayDao.getKey();
	}

	@Override
	public Holiday modifyHoliday(Holiday holiday) {
		holidayDao.update(holiday);
		return holiday;
	}

	@Override
	public List<Holiday> queryHoliday(Holiday holiday) {
		// TODO Auto-generated method stub
		return holidayDao.queryByArgs(holiday);
	}

	@Override
	public List<Holiday> queryListByYear(Holiday holiday) {
		// TODO Auto-generated method stub
		return holidayDao.queryByAYear(holiday);
	}

	@Override
	public List<Holiday> queryListByName(Holiday holiday) {
		// TODO Auto-generated method stub
		return holidayDao.queryByAName(holiday);
	}

	@Override
	public List<Holiday> queryAll(Holiday holiday) {
		return holidayDao.queryByAll(holiday);
	}

}
