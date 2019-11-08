package com.funo.touristroamingovernightin.dao;

import java.util.List;

import com.funo.base.dao.CommonDao;
import com.funo.region.model.Areas;
import com.funo.touristroamingin.model.TouristRomaingIn2;
import com.funo.touristroamingovernightin.model.TouristRoamingOvernightIn;

public interface ITouristRoamingOvernightInDao extends CommonDao<TouristRoamingOvernightIn> {
	public List<TouristRomaingIn2> queryByCitysMonth(TouristRomaingIn2 touristRoamingIn);
	public List<Areas>  queryByCityid(String cityid);
	public List<Areas>  queryByCounty(String countyid);
}