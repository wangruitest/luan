package com.funo.regiontouristtrend.adapt;

import java.util.List;

import com.funo.regiontouristtrend.model.RegionTouristTrend;


public interface IRegionTouristTrendAdapt {

	public String getKey();

	public RegionTouristTrend createRegionTouristTrend(RegionTouristTrend regionTouristTrend);

	public RegionTouristTrend modifyRegionTouristTrend(RegionTouristTrend regionTouristTrend);

	public void deleteRegionTouristTrend(RegionTouristTrend regionTouristTrend);

	public void batchDeleteRegionTouristTrend(List<RegionTouristTrend> regionTouristTrendList);

	public RegionTouristTrend getRegionTouristTrendById(String unid);

	public List<RegionTouristTrend> queryRegionTouristTrend(RegionTouristTrend regionTouristTrend);

}