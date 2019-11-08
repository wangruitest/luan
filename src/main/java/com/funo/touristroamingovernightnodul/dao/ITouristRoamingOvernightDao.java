package com.funo.touristroamingovernightnodul.dao;

import java.util.List;

import com.funo.base.dao.CommonDao;
import com.funo.region.model.Areas;
import com.funo.touristroamingovernightnodul.model.TouristRoamingOvernight;
import com.funo.touristtoamingout.model.TouristRoamingOut2;

public interface ITouristRoamingOvernightDao extends CommonDao<TouristRoamingOvernight> {
	public List<TouristRoamingOut2> queryByProvincesMonthNightDul2(TouristRoamingOut2 touristRoamingOut);
	public List<Areas>  queryByCityid(String cityid);
	public List<Areas>  queryByCounty(String countyid);
}