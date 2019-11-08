package com.funo.touristtoamingout.adapt.impl;

import java.util.List;

import com.funo.base.adapt.BaseAdapt;
import com.funo.region.model.Areas;
import com.funo.touristtoamingout.adapt.ITouristRoamingOutAdapt;
import com.funo.touristtoamingout.dao.ITouristRoamingOutDao;
import com.funo.touristtoamingout.model.TouristRoamingOut;
import com.funo.touristtoamingout.model.TouristRoamingOut2;

public class TouristRoamingOutAdapt extends BaseAdapt implements ITouristRoamingOutAdapt {

	private static final long serialVersionUID = 1L;
	private ITouristRoamingOutDao touristRoamingOutDao;
	
	public ITouristRoamingOutDao getTouristRoamingOutDao() {
		return touristRoamingOutDao;
	}

	public void setTouristRoamingOutDao(ITouristRoamingOutDao touristRoamingOutDao) {
		this.touristRoamingOutDao = touristRoamingOutDao;
	}

	public String getKey() {
		return touristRoamingOutDao.getKey();
	}

//	public TouristRoamingOut createTouristRoamingOut(TouristRoamingOut touristRoamingOut) {
//		touristRoamingOutDao.create(touristRoamingOut);
//		return touristRoamingOut;
//	}
//
//	public TouristRoamingOut modifyTouristRoamingOut(TouristRoamingOut touristRoamingOut) {
//		touristRoamingOutDao.update(touristRoamingOut);
//		return touristRoamingOut;
//	}
//
//	public void deleteTouristRoamingOut(TouristRoamingOut touristRoamingOut) {
//		touristRoamingOutDao.delete(touristRoamingOut);
//	}
//
//	public void batchDeleteTouristRoamingOut(List<TouristRoamingOut> touristRoamingOutList) {
//		touristRoamingOutDao.batchCreate(touristRoamingOutList);
//	}
//
//	public TouristRoamingOut getTouristRoamingOutById(String touristRoamingOutId) {
//		return touristRoamingOutDao.getById(touristRoamingOutId);
//	}
//
//	public List<TouristRoamingOut> queryTouristRoamingOut(TouristRoamingOut touristRoamingOut) {
//		return touristRoamingOutDao.queryByArgs(touristRoamingOut);
//	}
	
	public List<TouristRoamingOut> queryTouristMonth(TouristRoamingOut touristRoamingOut) {
		return touristRoamingOutDao.queryByProvincesMonth(touristRoamingOut);
	}
	public List<TouristRoamingOut> queryTouristMonth2(TouristRoamingOut2 touristRoamingOut) {
		return touristRoamingOutDao.queryByProvincesMonth2(touristRoamingOut);
	}

	@Override
	public List<Areas> queryByCityid(String cityid) {
		// TODO Auto-generated method stub
		return touristRoamingOutDao.queryByCityid(cityid);
	}

	@Override
	public List<Areas> queryByCounty(String countyid) {
		// TODO Auto-generated method stub
		return touristRoamingOutDao.queryByCounty(countyid);
	}
	
}