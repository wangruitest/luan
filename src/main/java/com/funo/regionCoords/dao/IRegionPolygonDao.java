package com.funo.regionCoords.dao;

import java.util.List;

import com.funo.base.dao.CommonDao;
import com.funo.regionCoords.model.RegionPolygon;

public interface IRegionPolygonDao extends CommonDao<RegionPolygon> {
	
	public List<RegionPolygon> queryByCityDayView(RegionPolygon regionPolygon);
	
	public List<RegionPolygon> queryByLuanRegionDayView(RegionPolygon regionPolygon);
	
	public List<RegionPolygon> queryByRegionDayView(RegionPolygon regionPolygon);
}