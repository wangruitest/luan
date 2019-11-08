package com.funo.touristroaming.adapt.impl;

import java.util.List;

import com.funo.base.adapt.BaseAdapt;
import com.funo.touristroaming.dao.ITouristRoamingDao;
import com.funo.touristroaming.adapt.ITouristRoamingAdapt;
import com.funo.touristroaming.model.ShitaiRoaming;
import com.funo.touristroaming.model.TouristRoaming;

public class TouristRoamingAdapt extends BaseAdapt implements ITouristRoamingAdapt {

	private static final long serialVersionUID = 1L;
	private ITouristRoamingDao touristRoamingDao;
	
	public ITouristRoamingDao getTouristRoamingDao() {
		return touristRoamingDao;
	}

	public void setTouristRoamingDao(ITouristRoamingDao touristRoamingDao) {
		this.touristRoamingDao = touristRoamingDao;
	}

	public String getKey() {
		return touristRoamingDao.getKey();
	}

	public TouristRoaming createTouristRoaming(TouristRoaming touristRoaming) {
		touristRoamingDao.create(touristRoaming);
		return touristRoaming;
	}

	public TouristRoaming modifyTouristRoaming(TouristRoaming touristRoaming) {
		touristRoamingDao.update(touristRoaming);
		return touristRoaming;
	}

	public void deleteTouristRoaming(TouristRoaming touristRoaming) {
		touristRoamingDao.delete(touristRoaming);
	}

	public void batchDeleteTouristRoaming(List<TouristRoaming> touristRoamingList) {
		touristRoamingDao.batchCreate(touristRoamingList);
	}

	public TouristRoaming getTouristRoamingById(String touristRoamingId) {
		return touristRoamingDao.getById(touristRoamingId);
	}

	public List<TouristRoaming> queryTouristRoaming(TouristRoaming touristRoaming) {
		return touristRoamingDao.queryByArgs(touristRoaming);
	}
	
	public List<TouristRoaming> queryAllCityTouristRoaming(TouristRoaming touristRoaming) {
		return touristRoamingDao.queryByAllCitys(touristRoaming);
	}

	@Override
	public List<TouristRoaming> queryByAllCounty(TouristRoaming touristRoaming) {
		return touristRoamingDao.queryByAllCounty(touristRoaming);
	}

	@Override
	public List<ShitaiRoaming> queryByShitai(ShitaiRoaming shitaiRoaming) {
		return touristRoamingDao.queryByShitai(shitaiRoaming);
	}
	
}