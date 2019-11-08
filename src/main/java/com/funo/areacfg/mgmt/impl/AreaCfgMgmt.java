package com.funo.areacfg.mgmt.impl;

import java.util.List;

import com.funo.base.mgmt.BaseMgmt;
import com.funo.areacfg.adapt.IAreaCfgAdapt;
import com.funo.areacfg.mgmt.IAreaCfgMgmt;
import com.funo.areacfg.model.AreaCfg;

public class AreaCfgMgmt extends BaseMgmt implements IAreaCfgMgmt {

	private static final long serialVersionUID = 1L;
	private IAreaCfgAdapt areaCfgAdapt;
	
	public IAreaCfgAdapt getAreaCfgAdapt() {
		return areaCfgAdapt;
	}
	public void setAreaCfgAdapt(IAreaCfgAdapt areaCfgAdapt) {
		this.areaCfgAdapt = areaCfgAdapt;
	}

	public String getKey() {
		return areaCfgAdapt.getKey();
	}

	public AreaCfg createAreaCfg(AreaCfg areaCfg) {
		areaCfgAdapt.createAreaCfg(areaCfg);
		return areaCfg;
	}

	public AreaCfg modifyAreaCfg(AreaCfg areaCfg) {
		areaCfgAdapt.modifyAreaCfg(areaCfg);
		return areaCfg;
	}

	public void deleteAreaCfg(AreaCfg areaCfg) {
		areaCfgAdapt.deleteAreaCfg(areaCfg);
	}

	public void batchDeleteAreaCfg(List<AreaCfg> areaCfgList) {
		areaCfgAdapt.batchDeleteAreaCfg(areaCfgList);
	}

	public AreaCfg getAreaCfgById(String areaCfgId) {
		return areaCfgAdapt.getAreaCfgById(areaCfgId);
	}

	public List<AreaCfg> queryAreaCfg(AreaCfg areaCfg) {
		return areaCfgAdapt.queryAreaCfg(areaCfg);
	}
	
}