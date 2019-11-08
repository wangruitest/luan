package com.funo.regionCoords.dao;

import java.util.List;

import com.funo.base.dao.CommonDao;
import com.funo.regionCoords.model.RegionCoords;
import com.funo.regionCoords.model.RegionPolygon;

public interface IRegionCoordsDao extends CommonDao<RegionCoords> {
	public List<RegionCoords> getAllRegionInfo();
	
	public List<RegionCoords> queryByRegionIdsForCoords(RegionCoords regionCoords );
}