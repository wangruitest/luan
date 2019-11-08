package com.funo.touristresource.mgmt;

import java.util.List;

import com.funo.touristresource.model.TPDSum;
import com.funo.touristresource.model.TouristResource;


public interface ITouristResourceMgmt {

	public String getKey();

	public TouristResource createTouristResource(TouristResource touristResource);

	public TouristResource modifyTouristResource(TouristResource touristResource);

	public void deleteTouristResource(TouristResource touristResource);

	public void batchDeleteTouristResource(List<TouristResource> touristResourceList);

	public TouristResource getTouristResourceById(String unid);

	public List<TouristResource> queryTouristResource(TouristResource touristResource);

	public List<TPDSum> queryByCityCode(TouristResource touristResource);
	
	public List<TouristResource> queryCityResources(TouristResource touristResource);

	public List<TouristResource> queryProvinceResources(TouristResource touristResource);

}