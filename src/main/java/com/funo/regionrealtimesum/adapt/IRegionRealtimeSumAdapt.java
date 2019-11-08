package com.funo.regionrealtimesum.adapt;

import java.util.List;




import com.funo.regionCoords.model.RegionPolygon;
import com.funo.regionrealtimesum.model.ForeignCities;
import com.funo.regionrealtimesum.model.RRSum;
import com.funo.regionrealtimesum.model.RegionRealtimeSum;


public interface IRegionRealtimeSumAdapt {

	public String getKey();

	public RegionRealtimeSum createRegionRealtimeSum(RegionRealtimeSum regionRealtimeSum);

	public RegionRealtimeSum modifyRegionRealtimeSum(RegionRealtimeSum regionRealtimeSum);

	public void deleteRegionRealtimeSum(RegionRealtimeSum regionRealtimeSum);

	public void batchDeleteRegionRealtimeSum(List<RegionRealtimeSum> regionRealtimeSumList);

	public RegionRealtimeSum getRegionRealtimeSumById(String unid);

	public List<RegionRealtimeSum> queryRegionRealtimeSum(RegionRealtimeSum regionRealtimeSum);
	
	public List<RegionRealtimeSum> queryAllCitys(RegionRealtimeSum regionRealtimeSum);
	
	public List<RegionRealtimeSum> queryCityidRegionid(RegionRealtimeSum regionRealtimeSum);
	
	public List<RegionRealtimeSum> queryByCityidRegionidForMap(RegionRealtimeSum regionRealtimeSum);

	public List<RRSum> queryByCity(RegionRealtimeSum regionRealtimeSum);
	
	//获取所有景区实时游客人数
	public List<RegionRealtimeSum> queryRealtimeList(RegionRealtimeSum regionRealtimeSum);
	
	public List<RegionRealtimeSum> queryByAllDay(RegionRealtimeSum realtimeSum);
	
	public List<RegionRealtimeSum> queryByCityCodeForDaPing(RegionRealtimeSum realtimeSum);
	
	public List<RegionRealtimeSum> queryByFromList(RegionRealtimeSum realtimeSum);
	
	public List<RegionRealtimeSum> queryByProvinceForDaPing(RegionRealtimeSum realtimeSum);
	
	public List<RRSum> queryByRegionsForDayData(RegionPolygon regionPolygon);
	
	public List<RegionRealtimeSum>	queryByRegionsForLine(RegionPolygon regionPolygon);
	
	public List<ForeignCities>	queryByForeignCities(ForeignCities foreignCities);
}