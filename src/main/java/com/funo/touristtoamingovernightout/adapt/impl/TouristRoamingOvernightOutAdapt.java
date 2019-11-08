package com.funo.touristtoamingovernightout.adapt.impl;

import java.util.List;

import com.funo.base.adapt.BaseAdapt;
import com.funo.region.model.Areas;
import com.funo.touristtoamingout.model.TouristRoamingOut2;
import com.funo.touristtoamingovernightout.dao.ITouristRoamingOvernightOutDao;
import com.funo.touristtoamingovernightout.adapt.ITouristRoamingOvernightOutAdapt;
import com.funo.touristtoamingovernightout.model.TouristRoamingOvernightOut;

public class TouristRoamingOvernightOutAdapt extends BaseAdapt implements ITouristRoamingOvernightOutAdapt {

	private static final long serialVersionUID = 1L;
	private ITouristRoamingOvernightOutDao touristRoamingOvernightOutDao;
	
	public ITouristRoamingOvernightOutDao getTouristRoamingOvernightOutDao() {
		return touristRoamingOvernightOutDao;
	}

	public void setTouristRoamingOvernightOutDao(ITouristRoamingOvernightOutDao touristRoamingOvernightOutDao) {
		this.touristRoamingOvernightOutDao = touristRoamingOvernightOutDao;
	}

	public String getKey() {
		return touristRoamingOvernightOutDao.getKey();
	}

	public TouristRoamingOvernightOut createTouristRoamingOvernightOut(TouristRoamingOvernightOut touristRoamingOvernightOut) {
		touristRoamingOvernightOutDao.create(touristRoamingOvernightOut);
		return touristRoamingOvernightOut;
	}

	public TouristRoamingOvernightOut modifyTouristRoamingOvernightOut(TouristRoamingOvernightOut touristRoamingOvernightOut) {
		touristRoamingOvernightOutDao.update(touristRoamingOvernightOut);
		return touristRoamingOvernightOut;
	}

//	public void deleteTouristRoamingOvernightOut(TouristRoamingOvernightOut touristRoamingOvernightOut) {
//		touristRoamingOvernightOutDao.delete(touristRoamingOvernightOut);
//	}
//
//	public void batchDeleteTouristRoamingOvernightOut(List<TouristRoamingOvernightOut> touristRoamingOvernightOutList) {
//		touristRoamingOvernightOutDao.batchCreate(touristRoamingOvernightOutList);
//	}
//
//	public TouristRoamingOvernightOut getTouristRoamingOvernightOutById(String touristRoamingOvernightOutId) {
//		return touristRoamingOvernightOutDao.getById(touristRoamingOvernightOutId);
//	}
//
//	public List<TouristRoamingOvernightOut> queryTouristRoamingOvernightOut(TouristRoamingOvernightOut touristRoamingOvernightOut) {
//		return touristRoamingOvernightOutDao.queryByArgs(touristRoamingOvernightOut);
//	}
	
	public List<TouristRoamingOvernightOut> queryTouristRoamingOvernightProvincesOut(TouristRoamingOvernightOut touristRoamingOvernightOut) {
		return touristRoamingOvernightOutDao.queryByProvincesMonthNight(touristRoamingOvernightOut);
	}

	@Override
	public List<TouristRoamingOut2> queryTouristRoamingOvernightProvincesOut2(TouristRoamingOut2 touristRoamingOut) {
		return touristRoamingOvernightOutDao.queryByProvincesMonthNight2(touristRoamingOut);
	}

	@Override
	public List<Areas> queryByCityid(String cityid) {
		// TODO Auto-generated method stub
		return touristRoamingOvernightOutDao.queryByCityid(cityid);
	}

	@Override
	public List<Areas> queryByCounty(String countyid) {
		// TODO Auto-generated method stub
		return touristRoamingOvernightOutDao.queryByCounty(countyid);
	}
	
}