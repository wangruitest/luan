package com.funo.touristresource.dao;

import java.util.List;

import com.funo.base.dao.CommonDao;
import com.funo.touristresource.model.TPDSum;
import com.funo.touristresource.model.TouristResource;

public interface ITouristResourceDao extends CommonDao<TouristResource> {

	public List<TPDSum> queryByCityCode(TouristResource touristResource);

	public List<TouristResource> queryByCityResources(TouristResource touristResource);

	public List<TouristResource> queryByProvinceResources(TouristResource touristResource);

}