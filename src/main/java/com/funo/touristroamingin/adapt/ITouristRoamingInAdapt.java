package com.funo.touristroamingin.adapt;

import java.util.List;

import com.funo.region.model.Areas;
import com.funo.touristroaming.model.TouristRoaming;
import com.funo.touristroamingin.model.TouristRoamingIn;
import com.funo.touristroamingin.model.TouristRomaingIn2;


public interface ITouristRoamingInAdapt {

	//public String getKey();

	//public TouristRoamingIn createTouristRoamingIn(TouristRoamingIn touristRoamingIn);

	//public TouristRoamingIn modifyTouristRoamingIn(TouristRoamingIn touristRoamingIn);

	//public void deleteTouristRoamingIn(TouristRoamingIn touristRoamingIn);

	//public void batchDeleteTouristRoamingIn(List<TouristRoamingIn> touristRoamingInList);

	//public TouristRoamingIn getTouristRoamingInById(String unid);

	public List<TouristRoamingIn> queryTouristRoamingIn(TouristRoaming touristRoaming);
	public List<TouristRomaingIn2> queryTouristMonth(TouristRomaingIn2 touristRoamingIn);
	public List<Areas>  queryByCityid(String cityid);
	public List<Areas>  queryByCounty(String countyid);

}