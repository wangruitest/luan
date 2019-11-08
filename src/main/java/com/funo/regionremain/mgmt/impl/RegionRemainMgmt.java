package com.funo.regionremain.mgmt.impl;

import java.util.List;

import com.funo.base.mgmt.BaseMgmt;
import com.funo.regionremain.adapt.IRegionRemainAdapt;
import com.funo.regionremain.mgmt.IRegionRemainMgmt;
import com.funo.regionremain.model.RegionRemain;

public class RegionRemainMgmt extends BaseMgmt implements IRegionRemainMgmt {

	private static final long serialVersionUID = 1L;
	private IRegionRemainAdapt regionRemainAdapt;
	
	public IRegionRemainAdapt getRegionRemainAdapt() {
		return regionRemainAdapt;
	}
	public void setRegionRemainAdapt(IRegionRemainAdapt regionRemainAdapt) {
		this.regionRemainAdapt = regionRemainAdapt;
	}

	public String getKey() {
		return regionRemainAdapt.getKey();
	}

	public RegionRemain createRegionRemain(RegionRemain regionRemain) {
		regionRemainAdapt.createRegionRemain(regionRemain);
		return regionRemain;
	}

	public RegionRemain modifyRegionRemain(RegionRemain regionRemain) {
		regionRemainAdapt.modifyRegionRemain(regionRemain);
		return regionRemain;
	}

	public void deleteRegionRemain(RegionRemain regionRemain) {
		regionRemainAdapt.deleteRegionRemain(regionRemain);
	}

	public void batchDeleteRegionRemain(List<RegionRemain> regionRemainList) {
		regionRemainAdapt.batchDeleteRegionRemain(regionRemainList);
	}

	public RegionRemain getRegionRemainById(String regionRemainId) {
		return regionRemainAdapt.getRegionRemainById(regionRemainId);
	}

	public List<RegionRemain> queryRegionRemain(RegionRemain regionRemain) {
		return regionRemainAdapt.queryRegionRemain(regionRemain);
	}
	
	public List<RegionRemain> queryRegionRemainYsearch(RegionRemain regionRemain) {
		return regionRemainAdapt.queryRegionRemainYsearch(regionRemain);
	}
	
	public List<RegionRemain> queryRegionRemainQsearch(RegionRemain regionRemain) {
		return regionRemainAdapt.queryRegionRemainQsearch(regionRemain);
	}
	
	public List<RegionRemain> queryRegionRemainMsearch(RegionRemain regionRemain) {
		return regionRemainAdapt.queryRegionRemainMsearch(regionRemain);
	}
	
}