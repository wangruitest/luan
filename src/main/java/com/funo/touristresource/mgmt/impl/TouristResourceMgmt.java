package com.funo.touristresource.mgmt.impl;

import java.util.List;

import com.funo.base.mgmt.BaseMgmt;
import com.funo.touristresource.adapt.ITouristResourceAdapt;
import com.funo.touristresource.mgmt.ITouristResourceMgmt;
import com.funo.touristresource.model.TPDSum;
import com.funo.touristresource.model.TouristResource;

public class TouristResourceMgmt extends BaseMgmt implements ITouristResourceMgmt {

	private static final long serialVersionUID = 1L;
	private ITouristResourceAdapt touristResourceAdapt;
	
	public ITouristResourceAdapt getTouristResourceAdapt() {
		return touristResourceAdapt;
	}
	public void setTouristResourceAdapt(ITouristResourceAdapt touristResourceAdapt) {
		this.touristResourceAdapt = touristResourceAdapt;
	}

	public String getKey() {
		return touristResourceAdapt.getKey();
	}

	public TouristResource createTouristResource(TouristResource touristResource) {
		touristResourceAdapt.createTouristResource(touristResource);
		return touristResource;
	}

	public TouristResource modifyTouristResource(TouristResource touristResource) {
		touristResourceAdapt.modifyTouristResource(touristResource);
		return touristResource;
	}

	public void deleteTouristResource(TouristResource touristResource) {
		touristResourceAdapt.deleteTouristResource(touristResource);
	}

	public void batchDeleteTouristResource(List<TouristResource> touristResourceList) {
		touristResourceAdapt.batchDeleteTouristResource(touristResourceList);
	}

	public TouristResource getTouristResourceById(String touristResourceId) {
		return touristResourceAdapt.getTouristResourceById(touristResourceId);
	}

	public List<TouristResource> queryTouristResource(TouristResource touristResource) {
		return touristResourceAdapt.queryTouristResource(touristResource);
	}
	
	public List<TPDSum> queryByCityCode(TouristResource touristResource) {
		return touristResourceAdapt.queryByCityCode(touristResource);
	}
	@Override
	public List<TouristResource> queryCityResources(TouristResource touristResource) {
		return touristResourceAdapt.queryCityResources(touristResource);
	}
	@Override
	public List<TouristResource> queryProvinceResources(TouristResource touristResource) {
		return touristResourceAdapt.queryProvinceResources(touristResource);
	}
	
}