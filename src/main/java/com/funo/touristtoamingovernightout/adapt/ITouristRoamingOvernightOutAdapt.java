package com.funo.touristtoamingovernightout.adapt;

import java.util.List;

import com.funo.region.model.Areas;
import com.funo.touristtoamingout.model.TouristRoamingOut2;
import com.funo.touristtoamingovernightout.model.TouristRoamingOvernightOut;


public interface ITouristRoamingOvernightOutAdapt {

	public String getKey();

	public TouristRoamingOvernightOut createTouristRoamingOvernightOut(TouristRoamingOvernightOut touristRoamingOvernightOut);

	public TouristRoamingOvernightOut modifyTouristRoamingOvernightOut(TouristRoamingOvernightOut touristRoamingOvernightOut);

//	public void deleteTouristRoamingOvernightOut(TouristRoamingOvernightOut touristRoamingOvernightOut);
//
//	public void batchDeleteTouristRoamingOvernightOut(List<TouristRoamingOvernightOut> touristRoamingOvernightOutList);
//
//	public TouristRoamingOvernightOut getTouristRoamingOvernightOutById(String unid);

	public List<TouristRoamingOvernightOut> queryTouristRoamingOvernightProvincesOut(TouristRoamingOvernightOut touristRoamingOvernightOut);
	public List<TouristRoamingOut2> queryTouristRoamingOvernightProvincesOut2(TouristRoamingOut2 touristRoamingOut);
	public List<Areas>  queryByCityid(String cityid);
	public List<Areas>  queryByCounty(String countyid);

}