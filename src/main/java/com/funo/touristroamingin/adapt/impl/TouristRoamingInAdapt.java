package com.funo.touristroamingin.adapt.impl;

import java.util.List;

import com.funo.base.adapt.BaseAdapt;
import com.funo.region.model.Areas;
import com.funo.touristroaming.model.TouristRoaming;
import com.funo.touristroamingin.adapt.ITouristRoamingInAdapt;
import com.funo.touristroamingin.dao.ITouristRoamingInDao;
import com.funo.touristroamingin.model.TouristRoamingIn;
import com.funo.touristroamingin.model.TouristRomaingIn2;

public class TouristRoamingInAdapt extends BaseAdapt implements ITouristRoamingInAdapt {

	private static final long serialVersionUID = 1L;
	private ITouristRoamingInDao touristRoamingInDao;
	
	public ITouristRoamingInDao getTouristRoamingInDao() {
		return touristRoamingInDao;
	}

	public void setTouristRoamingInDao(ITouristRoamingInDao touristRoamingInDao) {
		this.touristRoamingInDao = touristRoamingInDao;
	}
	/**
	public String getKey() {
		return touristRoamingInDao.getKey();
	}

	public TouristRoamingIn createTouristRoamingIn(TouristRoamingIn touristRoamingIn) {
		touristRoamingInDao.create(touristRoamingIn);
		return touristRoamingIn;
	}

	public TouristRoamingIn modifyTouristRoamingIn(TouristRoamingIn touristRoamingIn) {
		touristRoamingInDao.update(touristRoamingIn);
		return touristRoamingIn;
	}

	public void deleteTouristRoamingIn(TouristRoamingIn touristRoamingIn) {
		touristRoamingInDao.delete(touristRoamingIn);
	}

	public void batchDeleteTouristRoamingIn(List<TouristRoamingIn> touristRoamingInList) {
		touristRoamingInDao.batchCreate(touristRoamingInList);
	}

	public TouristRoamingIn getTouristRoamingInById(String touristRoamingInId) {
		return touristRoamingInDao.getById(touristRoamingInId);
	}
**/
	public List<TouristRoamingIn> queryTouristRoamingIn(TouristRoaming touristRoaming) {
		return touristRoamingInDao.queryByArgs(touristRoaming);
	}


	@Override
	public List<TouristRomaingIn2> queryTouristMonth(TouristRomaingIn2 touristRoamingIn) {
		// TODO Auto-generated method stub
		return touristRoamingInDao.queryByProvincesMonth(touristRoamingIn);
	}

	@Override
	public List<Areas> queryByCityid(String cityid) {
		// TODO Auto-generated method stub
		return touristRoamingInDao.queryByCityid(cityid);
	}

	@Override
	public List<Areas> queryByCounty(String countyid) {
		// TODO Auto-generated method stub
		return touristRoamingInDao.queryByCounty(countyid);
	}
	
}