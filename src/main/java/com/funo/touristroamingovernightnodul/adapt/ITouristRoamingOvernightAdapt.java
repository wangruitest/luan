package com.funo.touristroamingovernightnodul.adapt;

import java.util.List;

import com.funo.region.model.Areas;
import com.funo.touristroamingovernightnodul.model.TouristRoamingOvernight;
import com.funo.touristtoamingout.model.TouristRoamingOut2;


public interface ITouristRoamingOvernightAdapt {

	public String getKey();

	public TouristRoamingOvernight createTouristRoamingOvernight(TouristRoamingOvernight touristRoamingOvernight);

	public TouristRoamingOvernight modifyTouristRoamingOvernight(TouristRoamingOvernight touristRoamingOvernight);

	public void deleteTouristRoamingOvernight(TouristRoamingOvernight touristRoamingOvernight);

	public void batchDeleteTouristRoamingOvernight(List<TouristRoamingOvernight> touristRoamingOvernightList);

	public TouristRoamingOvernight getTouristRoamingOvernightById(String unid);

	public List<TouristRoamingOvernight> queryTouristRoamingOvernight(TouristRoamingOvernight touristRoamingOvernight);
	public List<TouristRoamingOut2> queryTouristRoamingOvernight2(TouristRoamingOut2 touristRoamingOut);
	public List<Areas>  queryByCityid(String cityid);
	public List<Areas>  queryByCounty(String countyid);

}