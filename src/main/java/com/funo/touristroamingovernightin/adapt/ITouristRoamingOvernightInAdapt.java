package com.funo.touristroamingovernightin.adapt;

import java.util.List;

import com.funo.region.model.Areas;
import com.funo.touristroamingin.model.TouristRomaingIn2;
import com.funo.touristroamingovernightin.model.TouristRoamingOvernightIn;


public interface ITouristRoamingOvernightInAdapt {

	public String getKey();

	public TouristRoamingOvernightIn createTouristRoamingOvernightIn(TouristRoamingOvernightIn touristRoamingOvernightIn);

	public TouristRoamingOvernightIn modifyTouristRoamingOvernightIn(TouristRoamingOvernightIn touristRoamingOvernightIn);

	public void deleteTouristRoamingOvernightIn(TouristRoamingOvernightIn touristRoamingOvernightIn);

	public void batchDeleteTouristRoamingOvernightIn(List<TouristRoamingOvernightIn> touristRoamingOvernightInList);

	public TouristRoamingOvernightIn getTouristRoamingOvernightInById(String unid);

	public List<TouristRoamingOvernightIn> queryTouristRoamingOvernightIn(TouristRoamingOvernightIn touristRoamingOvernightIn);
	
	public List<TouristRomaingIn2> queryTouristByCitysMonth(TouristRomaingIn2 touristRoamingIn);
	
	public List<Areas>  queryByCityid(String cityid);
	public List<Areas>  queryByCounty(String countyid);

}