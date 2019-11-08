package com.funo.touristtoamingovernightout.dao;

import java.util.List;

import com.funo.base.dao.CommonDao;
import com.funo.region.model.Areas;
import com.funo.touristtoamingout.model.TouristRoamingOut2;
import com.funo.touristtoamingovernightout.model.TouristRoamingOvernightOut;

public interface ITouristRoamingOvernightOutDao extends CommonDao<TouristRoamingOvernightOut> {
	
	public List<TouristRoamingOvernightOut> queryByProvincesMonthNight(TouristRoamingOvernightOut touristRoamingOvernightOut);
	public List<TouristRoamingOut2> queryByProvincesMonthNight2(TouristRoamingOut2 touristRoamingOut);
	public List<Areas>  queryByCityid(String cityid);
	public List<Areas>  queryByCounty(String countyid);
}