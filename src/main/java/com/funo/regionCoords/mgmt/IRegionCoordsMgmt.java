package com.funo.regionCoords.mgmt;

import java.util.List;

import com.funo.regionCoords.model.RegionCoords;
import com.funo.regionCoords.model.RegionPolygon;


public interface IRegionCoordsMgmt {

	public String getKey();

	public RegionCoords createRegionCoords(RegionCoords regionCoords);

	public RegionCoords modifyRegionCoords(RegionCoords regionCoords);

	public void deleteRegionCoords(RegionCoords regionCoords);

	public void batchDeleteRegionCoords(List<RegionCoords> regionCoordsList);

	public RegionCoords getRegionCoordsById(String unid);

	public List<RegionCoords> queryRegionCoords(RegionCoords regionCoords);
	
	public void uptRegionCoordsList(RegionPolygon regionPolygon);
	
	public List<RegionPolygon> getAllRegionInfo(RegionPolygon regionPolygon);

	public List<RegionPolygon> queryByCityDayView(RegionPolygon regionPolygon);
	
	public List<RegionPolygon> queryByRegionDayView(RegionPolygon regionPolygon);
	
	public List<RegionPolygon> queryByLuanRegionDayView(RegionPolygon regionPolygon);

	public List<RegionCoords> queryByRegionIdsForCoords(RegionCoords regionCoords );
}