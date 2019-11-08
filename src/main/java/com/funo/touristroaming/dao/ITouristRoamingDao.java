package com.funo.touristroaming.dao;

import java.util.List;

import com.funo.base.dao.CommonDao;
import com.funo.touristroaming.model.ShitaiRoaming;
import com.funo.touristroaming.model.TouristRoaming;

public interface ITouristRoamingDao extends CommonDao<TouristRoaming> {
	
	//查询全省人数
	public List<TouristRoaming> queryByAllCitys(TouristRoaming touristRoaming);
	//查询区县人数
	public List<TouristRoaming> queryByAllCounty(TouristRoaming touristRoaming);
	
	public List<ShitaiRoaming>  queryByShitai(ShitaiRoaming shitaiRoaming);

}