package com.funo.touristroamingovernightin.adapt.impl;

import java.util.List;

import com.funo.base.adapt.BaseAdapt;
import com.funo.region.model.Areas;
import com.funo.touristroamingin.model.TouristRomaingIn2;
import com.funo.touristroamingovernightin.adapt.ITouristRoamingOvernightInAdapt;
import com.funo.touristroamingovernightin.dao.ITouristRoamingOvernightInDao;
import com.funo.touristroamingovernightin.model.TouristRoamingOvernightIn;

public class TouristRoamingOvernightInAdapt extends BaseAdapt implements ITouristRoamingOvernightInAdapt {

	private static final long serialVersionUID = 1L;
	private ITouristRoamingOvernightInDao touristRoamingOvernightInDao;
	
	public ITouristRoamingOvernightInDao getTouristRoamingOvernightInDao() {
		return touristRoamingOvernightInDao;
	}

	public void setTouristRoamingOvernightInDao(ITouristRoamingOvernightInDao touristRoamingOvernightInDao) {
		this.touristRoamingOvernightInDao = touristRoamingOvernightInDao;
	}

	public String getKey() {
		return touristRoamingOvernightInDao.getKey();
	}

	public TouristRoamingOvernightIn createTouristRoamingOvernightIn(TouristRoamingOvernightIn touristRoamingOvernightIn) {
		touristRoamingOvernightInDao.create(touristRoamingOvernightIn);
		return touristRoamingOvernightIn;
	}

	public TouristRoamingOvernightIn modifyTouristRoamingOvernightIn(TouristRoamingOvernightIn touristRoamingOvernightIn) {
		touristRoamingOvernightInDao.update(touristRoamingOvernightIn);
		return touristRoamingOvernightIn;
	}

	public void deleteTouristRoamingOvernightIn(TouristRoamingOvernightIn touristRoamingOvernightIn) {
		touristRoamingOvernightInDao.delete(touristRoamingOvernightIn);
	}

	public void batchDeleteTouristRoamingOvernightIn(List<TouristRoamingOvernightIn> touristRoamingOvernightInList) {
		touristRoamingOvernightInDao.batchCreate(touristRoamingOvernightInList);
	}

	public TouristRoamingOvernightIn getTouristRoamingOvernightInById(String touristRoamingOvernightInId) {
		return touristRoamingOvernightInDao.getById(touristRoamingOvernightInId);
	}

	public List<TouristRoamingOvernightIn> queryTouristRoamingOvernightIn(TouristRoamingOvernightIn touristRoamingOvernightIn) {
		return touristRoamingOvernightInDao.queryByArgs(touristRoamingOvernightIn);
	}

	@Override
	public List<TouristRomaingIn2> queryTouristByCitysMonth(TouristRomaingIn2 touristRoamingIn) {
		return touristRoamingOvernightInDao.queryByCitysMonth(touristRoamingIn);
	}

	@Override
	public List<Areas> queryByCityid(String cityid) {
		// TODO Auto-generated method stub
		return touristRoamingOvernightInDao.queryByCityid(cityid);
	}

	@Override
	public List<Areas> queryByCounty(String countyid) {
		// TODO Auto-generated method stub
		return touristRoamingOvernightInDao.queryByCounty(countyid);
	}
	
}