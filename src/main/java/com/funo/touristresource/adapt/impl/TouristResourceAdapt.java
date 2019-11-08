package com.funo.touristresource.adapt.impl;

import java.util.List;

import com.funo.base.adapt.BaseAdapt;
import com.funo.touristresource.dao.ITouristResourceDao;
import com.funo.touristresource.adapt.ITouristResourceAdapt;
import com.funo.touristresource.model.TPDSum;
import com.funo.touristresource.model.TouristResource;

public class TouristResourceAdapt extends BaseAdapt implements ITouristResourceAdapt {

	private static final long serialVersionUID = 1L;
	private ITouristResourceDao touristResourceDao;
	
	public ITouristResourceDao getTouristResourceDao() {
		return touristResourceDao;
	}

	public void setTouristResourceDao(ITouristResourceDao touristResourceDao) {
		this.touristResourceDao = touristResourceDao;
	}

	public String getKey() {
		return touristResourceDao.getKey();
	}

	public TouristResource createTouristResource(TouristResource touristResource) {
		touristResourceDao.create(touristResource);
		return touristResource;
	}

	public TouristResource modifyTouristResource(TouristResource touristResource) {
		touristResourceDao.update(touristResource);
		return touristResource;
	}

	public void deleteTouristResource(TouristResource touristResource) {
		touristResourceDao.delete(touristResource);
	}

	public void batchDeleteTouristResource(List<TouristResource> touristResourceList) {
		touristResourceDao.batchCreate(touristResourceList);
	}

	public TouristResource getTouristResourceById(String touristResourceId) {
		return touristResourceDao.getById(touristResourceId);
	}

	public List<TouristResource> queryTouristResource(TouristResource touristResource) {
		return touristResourceDao.queryByArgs(touristResource);
	}
	
	public List<TPDSum> queryByCityCode(TouristResource touristResource){
		return touristResourceDao.queryByCityCode(touristResource);
	}

	@Override
	public List<TouristResource> queryCityResources(TouristResource touristResource) {
		return touristResourceDao.queryByCityResources(touristResource);
	}

	@Override
	public List<TouristResource> queryProvinceResources(TouristResource touristResource) {
		return touristResourceDao.queryByProvinceResources(touristResource);
		
	}
}