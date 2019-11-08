package com.funo.touristroamingin.dao;

import java.util.List;

import com.funo.base.dao.CommonDao;
import com.funo.region.model.Areas;
import com.funo.touristroamingin.model.TouristRoamingIn;
import com.funo.touristroamingin.model.TouristRomaingIn2;

public interface ITouristRoamingInDao extends CommonDao<TouristRoamingIn> {
	public List<TouristRomaingIn2> queryByProvincesMonth(TouristRomaingIn2 touristRoamingIn);
	public List<Areas>  queryByCityid(String cityid);
	public List<Areas>  queryByCounty(String countyid);
}