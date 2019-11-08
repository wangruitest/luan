package com.funo.regionrealtimesumadd.mgmt.impl;

import java.util.List;

import com.funo.base.mgmt.BaseMgmt;
import com.funo.regionrealtimesumadd.adapt.IRegionRealtimeSumAddAdapt;
import com.funo.regionrealtimesumadd.mgmt.IRegionRealtimeSumAddMgmt;
import com.funo.regionrealtimesumadd.model.RegionRealtimeSumAdd;

public class RegionRealtimeSumAddMgmt extends BaseMgmt implements IRegionRealtimeSumAddMgmt {

	private static final long serialVersionUID = 1L;
	private IRegionRealtimeSumAddAdapt regionRealtimeSumAddAdapt;
	
	public IRegionRealtimeSumAddAdapt getRegionRealtimeSumAddAdapt() {
		return regionRealtimeSumAddAdapt;
	}
	public void setRegionRealtimeSumAddAdapt(IRegionRealtimeSumAddAdapt regionRealtimeSumAddAdapt) {
		this.regionRealtimeSumAddAdapt = regionRealtimeSumAddAdapt;
	}

	public String getKey() {
		return regionRealtimeSumAddAdapt.getKey();
	}

	public RegionRealtimeSumAdd createRegionRealtimeSumAdd(RegionRealtimeSumAdd regionRealtimeSumAdd) {
		regionRealtimeSumAddAdapt.createRegionRealtimeSumAdd(regionRealtimeSumAdd);
		return regionRealtimeSumAdd;
	}

	public RegionRealtimeSumAdd modifyRegionRealtimeSumAdd(RegionRealtimeSumAdd regionRealtimeSumAdd) {
		regionRealtimeSumAddAdapt.modifyRegionRealtimeSumAdd(regionRealtimeSumAdd);
		return regionRealtimeSumAdd;
	}

	public void deleteRegionRealtimeSumAdd(RegionRealtimeSumAdd regionRealtimeSumAdd) {
		regionRealtimeSumAddAdapt.deleteRegionRealtimeSumAdd(regionRealtimeSumAdd);
	}

	public void batchDeleteRegionRealtimeSumAdd(List<RegionRealtimeSumAdd> regionRealtimeSumAddList) {
		regionRealtimeSumAddAdapt.batchDeleteRegionRealtimeSumAdd(regionRealtimeSumAddList);
	}

	public RegionRealtimeSumAdd getRegionRealtimeSumAddById(String regionRealtimeSumAddId) {
		return regionRealtimeSumAddAdapt.getRegionRealtimeSumAddById(regionRealtimeSumAddId);
	}

	public List<RegionRealtimeSumAdd> queryRegionRealtimeSumAdd(RegionRealtimeSumAdd regionRealtimeSumAdd) {
		return regionRealtimeSumAddAdapt.queryRegionRealtimeSumAdd(regionRealtimeSumAdd);
	}
	
	public List<RegionRealtimeSumAdd> queryCityidRegionid(RegionRealtimeSumAdd regionRealtimeSumAdd) {
		return regionRealtimeSumAddAdapt.queryCityidRegionid(regionRealtimeSumAdd);
	}
	
	public List<RegionRealtimeSumAdd> queryAllcitysIn(RegionRealtimeSumAdd regionRealtimeSumAdd) {
		return regionRealtimeSumAddAdapt.queryAllcitysIn(regionRealtimeSumAdd);
	}
	
	public List<RegionRealtimeSumAdd> queryAllcitysOut(RegionRealtimeSumAdd regionRealtimeSumAdd) {
		return regionRealtimeSumAddAdapt.queryAllcitysOut(regionRealtimeSumAdd);
	}
	
	public List<RegionRealtimeSumAdd> queryCityidRegionidOut(RegionRealtimeSumAdd regionRealtimeSumAdd) {
		return regionRealtimeSumAddAdapt.queryCityidRegionidOut(regionRealtimeSumAdd);
	}
	
	public List<RegionRealtimeSumAdd> queryCityidRegionidIn(RegionRealtimeSumAdd regionRealtimeSumAdd) {
		return regionRealtimeSumAddAdapt.queryCityidRegionidIn(regionRealtimeSumAdd);
	}
	
}