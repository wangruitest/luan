package com.funo.regionsummarybyday.mgmt.impl;

import java.util.List;

import com.funo.base.mgmt.BaseMgmt;
import com.funo.regionsummarybyday.adapt.IRegionSummaryBydayAdapt;
import com.funo.regionsummarybyday.mgmt.IRegionSummaryBydayMgmt;
import com.funo.regionsummarybyday.model.RegionSummaryByday;
import com.funo.regionsummarybyday.model.RegionSummaryBydaySum;

public class RegionSummaryBydayMgmt extends BaseMgmt implements IRegionSummaryBydayMgmt {

	private static final long serialVersionUID = 1L;
	private IRegionSummaryBydayAdapt regionSummaryBydayAdapt;
	
	public IRegionSummaryBydayAdapt getRegionSummaryBydayAdapt() {
		return regionSummaryBydayAdapt;
	}
	public void setRegionSummaryBydayAdapt(IRegionSummaryBydayAdapt regionSummaryBydayAdapt) {
		this.regionSummaryBydayAdapt = regionSummaryBydayAdapt;
	}

	public String getKey() {
		return regionSummaryBydayAdapt.getKey();
	}

	public RegionSummaryByday createRegionSummaryByday(RegionSummaryByday regionSummaryByday) {
		regionSummaryBydayAdapt.createRegionSummaryByday(regionSummaryByday);
		return regionSummaryByday;
	}

	public RegionSummaryByday modifyRegionSummaryByday(RegionSummaryByday regionSummaryByday) {
		regionSummaryBydayAdapt.modifyRegionSummaryByday(regionSummaryByday);
		return regionSummaryByday;
	}

	public void deleteRegionSummaryByday(RegionSummaryByday regionSummaryByday) {
		regionSummaryBydayAdapt.deleteRegionSummaryByday(regionSummaryByday);
	}

	public void batchDeleteRegionSummaryByday(List<RegionSummaryByday> regionSummaryBydayList) {
		regionSummaryBydayAdapt.batchDeleteRegionSummaryByday(regionSummaryBydayList);
	}

	public RegionSummaryByday getRegionSummaryBydayById(String regionSummaryBydayId) {
		return regionSummaryBydayAdapt.getRegionSummaryBydayById(regionSummaryBydayId);
	}

	public List<RegionSummaryByday> queryRegionSummaryByday(RegionSummaryByday regionSummaryByday) {
		return regionSummaryBydayAdapt.queryRegionSummaryByday(regionSummaryByday);
	}
	
	public List<RegionSummaryBydaySum> queryBySum(RegionSummaryByday regionSummaryByday) {
		return regionSummaryBydayAdapt.queryBySum(regionSummaryByday);
	}
	
}