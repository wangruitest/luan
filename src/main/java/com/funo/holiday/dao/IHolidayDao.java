package com.funo.holiday.dao;

import java.util.List;

import com.funo.base.dao.CommonDao;
import com.funo.holiday.model.Holiday;

public interface IHolidayDao extends CommonDao<Holiday> {

	public List<Holiday> queryByAYear(Holiday holiday);
	
	public List<Holiday> queryByAName(Holiday holiday);
	
	public List<Holiday> queryByAll(Holiday holiday);
}
