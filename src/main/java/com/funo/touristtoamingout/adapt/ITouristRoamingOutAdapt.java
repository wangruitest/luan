package com.funo.touristtoamingout.adapt;

import java.util.List;

import com.funo.region.model.Areas;
import com.funo.touristtoamingout.model.TouristRoamingOut;
import com.funo.touristtoamingout.model.TouristRoamingOut2;


public interface ITouristRoamingOutAdapt {

	public String getKey();

//	public TouristRoamingOut createTouristRoamingOut(TouristRoamingOut touristRoamingOut);
//
//	public TouristRoamingOut modifyTouristRoamingOut(TouristRoamingOut touristRoamingOut);
//
//	public void deleteTouristRoamingOut(TouristRoamingOut touristRoamingOut);
//
//	public void batchDeleteTouristRoamingOut(List<TouristRoamingOut> touristRoamingOutList);
//
//	public TouristRoamingOut getTouristRoamingOutById(String unid);
//
//	public List<TouristRoamingOut> queryTouristRoamingOut(TouristRoamingOut touristRoamingOut);
	
	public List<TouristRoamingOut> queryTouristMonth(TouristRoamingOut touristRoamingOut);
	public List<TouristRoamingOut> queryTouristMonth2(TouristRoamingOut2 touristRoamingOut);
	public List<Areas>  queryByCityid(String cityid);
	public List<Areas>  queryByCounty(String countyid);

}