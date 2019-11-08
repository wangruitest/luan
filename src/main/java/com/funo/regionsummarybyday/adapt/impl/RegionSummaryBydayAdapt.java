package com.funo.regionsummarybyday.adapt.impl;

import java.util.List;

import com.funo.base.adapt.BaseAdapt;
import com.funo.regionsummarybyday.adapt.IRegionSummaryBydayAdapt;
import com.funo.regionsummarybyday.dao.IRegionSummaryBydayDao;
import com.funo.regionsummarybyday.model.RegionSummaryByday;
import com.funo.regionsummarybyday.model.RegionSummaryBydaySum;

public class RegionSummaryBydayAdapt extends BaseAdapt implements IRegionSummaryBydayAdapt {

	private static final long serialVersionUID = 1L;
	private IRegionSummaryBydayDao regionSummaryBydayDao;
	
	public IRegionSummaryBydayDao getRegionSummaryBydayDao() {
		return regionSummaryBydayDao;
	}

	public void setRegionSummaryBydayDao(IRegionSummaryBydayDao regionSummaryBydayDao) {
		this.regionSummaryBydayDao = regionSummaryBydayDao;
	}

	public String getKey() {
		return regionSummaryBydayDao.getKey();
	}

	public RegionSummaryByday createRegionSummaryByday(RegionSummaryByday regionSummaryByday) {
		regionSummaryBydayDao.create(regionSummaryByday);
		return regionSummaryByday;
	}

	public RegionSummaryByday modifyRegionSummaryByday(RegionSummaryByday regionSummaryByday) {
		regionSummaryBydayDao.update(regionSummaryByday);
		return regionSummaryByday;
	}

	public void deleteRegionSummaryByday(RegionSummaryByday regionSummaryByday) {
		regionSummaryBydayDao.delete(regionSummaryByday);
	}

	public void batchDeleteRegionSummaryByday(List<RegionSummaryByday> regionSummaryBydayList) {
		regionSummaryBydayDao.batchCreate(regionSummaryBydayList);
	}

	public RegionSummaryByday getRegionSummaryBydayById(String regionSummaryBydayId) {
		return regionSummaryBydayDao.getById(regionSummaryBydayId);
	}

	public List<RegionSummaryByday> queryRegionSummaryByday(RegionSummaryByday regionSummaryByday) {
		return regionSummaryBydayDao.queryByArgs(regionSummaryByday);
	}
	
	public List<RegionSummaryBydaySum> queryBySum(RegionSummaryByday regionSummaryByday) {
		return regionSummaryBydayDao.queryBySum(regionSummaryByday);
	}
	
}