package com.funo.overnight.adapt.impl;

import java.util.List;

import com.funo.base.adapt.BaseAdapt;
import com.funo.overnight.dao.ITouristRoamingOvernightDayDao;
import com.funo.overnight.adapt.ITouristRoamingOvernightDayAdapt;
import com.funo.overnight.model.TouristRoamingOvernightDay;

public class TouristRoamingOvernightDayAdapt extends BaseAdapt implements ITouristRoamingOvernightDayAdapt {

	private static final long serialVersionUID = 1L;
	private ITouristRoamingOvernightDayDao touristRoamingOvernightDayDao;
	
	public ITouristRoamingOvernightDayDao getTouristRoamingOvernightDayDao() {
		return touristRoamingOvernightDayDao;
	}

	public void setTouristRoamingOvernightDayDao(ITouristRoamingOvernightDayDao touristRoamingOvernightDayDao) {
		this.touristRoamingOvernightDayDao = touristRoamingOvernightDayDao;
	}

	public String getKey() {
		return touristRoamingOvernightDayDao.getKey();
	}

	public TouristRoamingOvernightDay createTouristRoamingOvernightDay(TouristRoamingOvernightDay touristRoamingOvernightDay) {
		touristRoamingOvernightDayDao.create(touristRoamingOvernightDay);
		return touristRoamingOvernightDay;
	}

	public TouristRoamingOvernightDay modifyTouristRoamingOvernightDay(TouristRoamingOvernightDay touristRoamingOvernightDay) {
		touristRoamingOvernightDayDao.update(touristRoamingOvernightDay);
		return touristRoamingOvernightDay;
	}

	public void deleteTouristRoamingOvernightDay(TouristRoamingOvernightDay touristRoamingOvernightDay) {
		touristRoamingOvernightDayDao.delete(touristRoamingOvernightDay);
	}

	public void batchDeleteTouristRoamingOvernightDay(List<TouristRoamingOvernightDay> touristRoamingOvernightDayList) {
		touristRoamingOvernightDayDao.batchCreate(touristRoamingOvernightDayList);
	}

	public TouristRoamingOvernightDay getTouristRoamingOvernightDayById(String touristRoamingOvernightDayId) {
		return touristRoamingOvernightDayDao.getById(touristRoamingOvernightDayId);
	}

	public List<TouristRoamingOvernightDay> queryTouristRoamingOvernightDay(TouristRoamingOvernightDay touristRoamingOvernightDay) {
		return touristRoamingOvernightDayDao.queryByArgs(touristRoamingOvernightDay);
	}
	
}