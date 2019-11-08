package com.funo.regiontype.mgmt.impl;

import java.util.List;

import com.funo.base.mgmt.BaseMgmt;
import com.funo.regiontype.adapt.IRegionTypeCfgAdapt;
import com.funo.regiontype.mgmt.IRegionTypeCfgMgmt;
import com.funo.regiontype.model.RegionTypeCfg;

public class RegionTypeCfgMgmt extends BaseMgmt implements IRegionTypeCfgMgmt {

	private static final long serialVersionUID = 1L;
	private IRegionTypeCfgAdapt regionTypeCfgAdapt;
	
	public IRegionTypeCfgAdapt getRegionTypeCfgAdapt() {
		return regionTypeCfgAdapt;
	}
	public void setRegionTypeCfgAdapt(IRegionTypeCfgAdapt regionTypeCfgAdapt) {
		this.regionTypeCfgAdapt = regionTypeCfgAdapt;
	}

	public String getKey() {
		return regionTypeCfgAdapt.getKey();
	}

	public RegionTypeCfg createRegionTypeCfg(RegionTypeCfg regionTypeCfg) {
		regionTypeCfgAdapt.createRegionTypeCfg(regionTypeCfg);
		return regionTypeCfg;
	}

	public RegionTypeCfg modifyRegionTypeCfg(RegionTypeCfg regionTypeCfg) {
		regionTypeCfgAdapt.modifyRegionTypeCfg(regionTypeCfg);
		return regionTypeCfg;
	}

	public void deleteRegionTypeCfg(RegionTypeCfg regionTypeCfg) {
		regionTypeCfgAdapt.deleteRegionTypeCfg(regionTypeCfg);
	}

	public void batchDeleteRegionTypeCfg(List<RegionTypeCfg> regionTypeCfgList) {
		regionTypeCfgAdapt.batchDeleteRegionTypeCfg(regionTypeCfgList);
	}

	public RegionTypeCfg getRegionTypeCfgById(String regionTypeCfgId) {
		return regionTypeCfgAdapt.getRegionTypeCfgById(regionTypeCfgId);
	}

	public List<RegionTypeCfg> queryRegionTypeCfg(RegionTypeCfg regionTypeCfg) {
		return regionTypeCfgAdapt.queryRegionTypeCfg(regionTypeCfg);
	}
	@Override
	public List<RegionTypeCfg> updateForIsExist(RegionTypeCfg regionTypeCfg) {
		return regionTypeCfgAdapt.updateForIsExist(regionTypeCfg);
	}
	@Override
	public List<RegionTypeCfg> insertForIsExist(RegionTypeCfg regionTypeCfg) {
		return regionTypeCfgAdapt.insertForIsExist(regionTypeCfg);
	}
	
}