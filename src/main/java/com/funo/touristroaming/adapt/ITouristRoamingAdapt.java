package com.funo.touristroaming.adapt;

import java.util.List;

import com.funo.touristroaming.model.ShitaiRoaming;
import com.funo.touristroaming.model.TouristRoaming;


public interface ITouristRoamingAdapt {

	public String getKey();

	public TouristRoaming createTouristRoaming(TouristRoaming touristRoaming);

	public TouristRoaming modifyTouristRoaming(TouristRoaming touristRoaming);

	public void deleteTouristRoaming(TouristRoaming touristRoaming);

	public void batchDeleteTouristRoaming(List<TouristRoaming> touristRoamingList);

	public TouristRoaming getTouristRoamingById(String unid);

	public List<TouristRoaming> queryTouristRoaming(TouristRoaming touristRoaming);
	
	public List<TouristRoaming> queryAllCityTouristRoaming(TouristRoaming touristRoaming);
	
	public List<TouristRoaming> queryByAllCounty(TouristRoaming touristRoaming);
	
	public List<ShitaiRoaming>  queryByShitai(ShitaiRoaming shitaiRoaming);

}