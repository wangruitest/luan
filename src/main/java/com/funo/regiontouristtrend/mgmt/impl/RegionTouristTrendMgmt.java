package com.funo.regiontouristtrend.mgmt.impl;

import java.util.List;

import com.funo.base.mgmt.BaseMgmt;
import com.funo.regiontouristtrend.adapt.IRegionTouristTrendAdapt;
import com.funo.regiontouristtrend.mgmt.IRegionTouristTrendMgmt;
import com.funo.regiontouristtrend.model.RegionTouristTrend;

public class RegionTouristTrendMgmt extends BaseMgmt implements IRegionTouristTrendMgmt {

	private static final long serialVersionUID = 1L;
	private IRegionTouristTrendAdapt regionTouristTrendAdapt;
	
	public IRegionTouristTrendAdapt getRegionTouristTrendAdapt() {
		return regionTouristTrendAdapt;
	}
	public void setRegionTouristTrendAdapt(IRegionTouristTrendAdapt regionTouristTrendAdapt) {
		this.regionTouristTrendAdapt = regionTouristTrendAdapt;
	}

	public String getKey() {
		return regionTouristTrendAdapt.getKey();
	}

	public RegionTouristTrend createRegionTouristTrend(RegionTouristTrend regionTouristTrend) {
		regionTouristTrendAdapt.createRegionTouristTrend(regionTouristTrend);
		return regionTouristTrend;
	}

	public RegionTouristTrend modifyRegionTouristTrend(RegionTouristTrend regionTouristTrend) {
		regionTouristTrendAdapt.modifyRegionTouristTrend(regionTouristTrend);
		return regionTouristTrend;
	}

	public void deleteRegionTouristTrend(RegionTouristTrend regionTouristTrend) {
		regionTouristTrendAdapt.deleteRegionTouristTrend(regionTouristTrend);
	}

	public void batchDeleteRegionTouristTrend(List<RegionTouristTrend> regionTouristTrendList) {
		regionTouristTrendAdapt.batchDeleteRegionTouristTrend(regionTouristTrendList);
	}

	public RegionTouristTrend getRegionTouristTrendById(String regionTouristTrendId) {
		return regionTouristTrendAdapt.getRegionTouristTrendById(regionTouristTrendId);
	}

	public List<RegionTouristTrend> queryRegionTouristTrend(RegionTouristTrend regionTouristTrend) {
		return regionTouristTrendAdapt.queryRegionTouristTrend(regionTouristTrend);
	}
	
}