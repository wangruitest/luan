package com.funo.regionrealtimesum.dao;

import java.util.List;

import com.funo.base.dao.CommonDao;
import com.funo.regionCoords.model.RegionPolygon;
import com.funo.regionrealtimesum.model.ForeignCities;
import com.funo.regionrealtimesum.model.RRSum;
import com.funo.regionrealtimesum.model.RegionRealtimeSum;

public interface IRegionRealtimeSumDao extends CommonDao<RegionRealtimeSum> {
	
	//全省查询
	public List<RegionRealtimeSum> queryByAllCitys(RegionRealtimeSum regionRealtimeSum);
	
	//景点查询
	public List<RegionRealtimeSum> queryByCityidRegionid(RegionRealtimeSum regionRealtimeSum);
	
	//景点查询
	public List<RegionRealtimeSum> queryByCityidRegionidForMap(RegionRealtimeSum regionRealtimeSum);
	
	//获取指定地市的所有景区实时游客人数
	public List<RRSum> queryByCity(RegionRealtimeSum regionRealtimeSum);

	//获取所有景区实时游客人数
	public List<RegionRealtimeSum> queryByRealtimeList(RegionRealtimeSum regionRealtimeSum);

	//为大屏地市日数据获取实时数据
	public List<RegionRealtimeSum> queryByCityCodeForDaPing(RegionRealtimeSum realtimeSum);
	
	//为大屏地市日数据获取游客归属--实时
	public List<RegionRealtimeSum> queryByFromList(RegionRealtimeSum realtimeSum);
	
	//为大屏地市日数据获取游客归属--接待总数
	public List<RegionRealtimeSum> queryByAllDay(RegionRealtimeSum realtimeSum);
	
	//为大屏省日数据获取实时数据
	public List<RegionRealtimeSum> queryByProvinceForDaPing(RegionRealtimeSum realtimeSum);
	
	//根据景区IDS来获取接待统计信息
	public List<RRSum> queryByRegionsForDayData(RegionPolygon regionPolygon);
	
	//根据景区IDS获取24小时统计报表
	public List<RegionRealtimeSum>	queryByRegionsForLine(RegionPolygon regionPolygon);
	
	public List<ForeignCities>	queryByForeignCities(ForeignCities foreignCities);
}