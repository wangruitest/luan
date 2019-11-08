package com.funo.provinceregioncoords.dao;

import java.util.List;

import com.funo.base.dao.CommonDao;
import com.funo.provinceregioncoords.model.ProvinceRegionCoords;

public interface IProvinceRegionCoordsDao extends CommonDao<ProvinceRegionCoords> {
	
	//获取所有景区
	public List<ProvinceRegionCoords> queryByRegionIdCityCode(ProvinceRegionCoords p);
	
	//重置景区中心坐标点
	public ProvinceRegionCoords updateByRegionLnglat(ProvinceRegionCoords prc);
	
	//根据城市id获取景区
	public List<ProvinceRegionCoords> queryByRegionCfgByCityCode(ProvinceRegionCoords p);

}