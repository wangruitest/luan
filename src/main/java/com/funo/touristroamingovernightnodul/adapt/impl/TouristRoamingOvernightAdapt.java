package com.funo.touristroamingovernightnodul.adapt.impl;

import java.util.List;

import com.funo.base.adapt.BaseAdapt;
import com.funo.region.model.Areas;
import com.funo.touristroamingovernightnodul.dao.ITouristRoamingOvernightDao;
import com.funo.touristroamingovernightnodul.adapt.ITouristRoamingOvernightAdapt;
import com.funo.touristroamingovernightnodul.model.TouristRoamingOvernight;
import com.funo.touristtoamingout.model.TouristRoamingOut2;

public class TouristRoamingOvernightAdapt extends BaseAdapt implements ITouristRoamingOvernightAdapt {

	private static final long serialVersionUID = 1L;
	private ITouristRoamingOvernightDao touristRoamingOvernightDao;
	
	public ITouristRoamingOvernightDao getTouristRoamingOvernightDao() {
		return touristRoamingOvernightDao;
	}

	public void setTouristRoamingOvernightDao(ITouristRoamingOvernightDao touristRoamingOvernightDao) {
		this.touristRoamingOvernightDao = touristRoamingOvernightDao;
	}

	public String getKey() {
		return touristRoamingOvernightDao.getKey();
	}

	public TouristRoamingOvernight createTouristRoamingOvernight(TouristRoamingOvernight touristRoamingOvernight) {
		touristRoamingOvernightDao.create(touristRoamingOvernight);
		return touristRoamingOvernight;
	}

	public TouristRoamingOvernight modifyTouristRoamingOvernight(TouristRoamingOvernight touristRoamingOvernight) {
		touristRoamingOvernightDao.update(touristRoamingOvernight);
		return touristRoamingOvernight;
	}

	public void deleteTouristRoamingOvernight(TouristRoamingOvernight touristRoamingOvernight) {
		touristRoamingOvernightDao.delete(touristRoamingOvernight);
	}

	public void batchDeleteTouristRoamingOvernight(List<TouristRoamingOvernight> touristRoamingOvernightList) {
		touristRoamingOvernightDao.batchCreate(touristRoamingOvernightList);
	}

	public TouristRoamingOvernight getTouristRoamingOvernightById(String touristRoamingOvernightId) {
		return touristRoamingOvernightDao.getById(touristRoamingOvernightId);
	}

	public List<TouristRoamingOvernight> queryTouristRoamingOvernight(TouristRoamingOvernight touristRoamingOvernight) {
		return touristRoamingOvernightDao.queryByArgs(touristRoamingOvernight);
	}

	@Override
	public List<TouristRoamingOut2> queryTouristRoamingOvernight2(TouristRoamingOut2 touristRoamingOut) {
		return touristRoamingOvernightDao.queryByProvincesMonthNightDul2(touristRoamingOut);
	}

	@Override
	public List<Areas> queryByCityid(String cityid) {
		// TODO Auto-generated method stub
		return touristRoamingOvernightDao.queryByCityid(cityid);
	}

	@Override
	public List<Areas> queryByCounty(String countyid) {
		// TODO Auto-generated method stub
		return touristRoamingOvernightDao.queryByCounty(countyid);
	}
	
}