package com.funo.holidayAreaOrScenic.adapt.impl;

import java.util.List;
import java.util.Map;

import com.funo.base.adapt.BaseAdapt;
import com.funo.holidayAreaOrScenic.dao.IHolidayAreaScenicDao;
import com.funo.holidayAreaOrScenic.adapt.IHolidayAreaScenicAdapt;
import com.funo.holidayAreaOrScenic.model.HolidayAreaScenic;

public class HolidayAreaScenicAdapt extends BaseAdapt implements IHolidayAreaScenicAdapt {

	private static final long serialVersionUID = 1L;
	private IHolidayAreaScenicDao holidayAreaScenicDao;
	
	public IHolidayAreaScenicDao getHolidayAreaScenicDao() {
		return holidayAreaScenicDao;
	}

	public void setHolidayAreaScenicDao(IHolidayAreaScenicDao holidayAreaScenicDao) {
		this.holidayAreaScenicDao = holidayAreaScenicDao;
	}

	public String getKey() {
		return holidayAreaScenicDao.getKey();
	}

	public HolidayAreaScenic createHolidayAreaScenic(HolidayAreaScenic holidayAreaScenic) {
		holidayAreaScenicDao.create(holidayAreaScenic);
		return holidayAreaScenic;
	}

	public HolidayAreaScenic modifyHolidayAreaScenic(HolidayAreaScenic holidayAreaScenic) {
		holidayAreaScenicDao.update(holidayAreaScenic);
		return holidayAreaScenic;
	}

	public void deleteHolidayAreaScenic(HolidayAreaScenic holidayAreaScenic) {
		holidayAreaScenicDao.delete(holidayAreaScenic);
	}

	public void batchDeleteHolidayAreaScenic(List<HolidayAreaScenic> holidayAreaScenicList) {
		holidayAreaScenicDao.batchCreate(holidayAreaScenicList);
	}

	public HolidayAreaScenic getHolidayAreaScenicById(String holidayAreaScenicId) {
		return holidayAreaScenicDao.getById(holidayAreaScenicId);
	}

	public List<HolidayAreaScenic> queryHolidayAreaScenic(HolidayAreaScenic holidayAreaScenic) {
		return holidayAreaScenicDao.queryByArgs(holidayAreaScenic);
	}

	@Override
	public Map<String, Object> queryAreaRegion(HolidayAreaScenic holidayAreaScenic) {
		// TODO Auto-generated method stub
		return holidayAreaScenicDao.areaRegion(holidayAreaScenic);
	}
	
}