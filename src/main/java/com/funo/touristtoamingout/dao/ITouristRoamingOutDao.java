package com.funo.touristtoamingout.dao;

import java.util.List;

import com.funo.base.dao.CommonDao;
import com.funo.region.model.Areas;
import com.funo.touristtoamingout.model.TouristRoamingOut;
import com.funo.touristtoamingout.model.TouristRoamingOut2;

public interface ITouristRoamingOutDao extends CommonDao<TouristRoamingOut> {
	
	public List<TouristRoamingOut> queryByProvincesMonth(TouristRoamingOut touristRoamingOut);
	public List<TouristRoamingOut> queryByProvincesMonth2(TouristRoamingOut2 touristRoamingOut);
	public List<Areas>  queryByCityid(String cityid);
	public List<Areas>  queryByCounty(String countyid);

}