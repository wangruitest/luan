package com.funo.regiontouristtrend.adapt.impl;

import java.util.List;

import com.funo.base.adapt.BaseAdapt;
import com.funo.regiontouristtrend.dao.IRegionTouristTrendDao;
import com.funo.regiontouristtrend.adapt.IRegionTouristTrendAdapt;
import com.funo.regiontouristtrend.model.RegionTouristTrend;

public class RegionTouristTrendAdapt extends BaseAdapt implements IRegionTouristTrendAdapt {

	private static final long serialVersionUID = 1L;
	private IRegionTouristTrendDao regionTouristTrendDao;
	
	public IRegionTouristTrendDao getRegionTouristTrendDao() {
		return regionTouristTrendDao;
	}

	public void setRegionTouristTrendDao(IRegionTouristTrendDao regionTouristTrendDao) {
		this.regionTouristTrendDao = regionTouristTrendDao;
	}

	public String getKey() {
		return regionTouristTrendDao.getKey();
	}

	public RegionTouristTrend createRegionTouristTrend(RegionTouristTrend regionTouristTrend) {
		regionTouristTrendDao.create(regionTouristTrend);
		return regionTouristTrend;
	}

	public RegionTouristTrend modifyRegionTouristTrend(RegionTouristTrend regionTouristTrend) {
		regionTouristTrendDao.update(regionTouristTrend);
		return regionTouristTrend;
	}

	public void deleteRegionTouristTrend(RegionTouristTrend regionTouristTrend) {
		regionTouristTrendDao.delete(regionTouristTrend);
	}

	public void batchDeleteRegionTouristTrend(List<RegionTouristTrend> regionTouristTrendList) {
		regionTouristTrendDao.batchCreate(regionTouristTrendList);
	}

	public RegionTouristTrend getRegionTouristTrendById(String regionTouristTrendId) {
		return regionTouristTrendDao.getById(regionTouristTrendId);
	}

	public List<RegionTouristTrend> queryRegionTouristTrend(RegionTouristTrend regionTouristTrend) {
		return regionTouristTrendDao.queryByArgs(regionTouristTrend);
	}
	
}