package com.funo.provinceregioncfg.mgmt.impl;

import java.util.List;

import com.funo.base.mgmt.BaseMgmt;
import com.funo.provinceregioncfg.adapt.IProvinceRegionCfgAdapt;
import com.funo.provinceregioncfg.mgmt.IProvinceRegionCfgMgmt;
import com.funo.provinceregioncfg.model.ProvinceRegionCfg;

public class ProvinceRegionCfgMgmt extends BaseMgmt implements IProvinceRegionCfgMgmt {

	private static final long serialVersionUID = 1L;
	private IProvinceRegionCfgAdapt provinceRegionCfgAdapt;
	
	public IProvinceRegionCfgAdapt getProvinceRegionCfgAdapt() {
		return provinceRegionCfgAdapt;
	}
	public void setProvinceRegionCfgAdapt(IProvinceRegionCfgAdapt provinceRegionCfgAdapt) {
		this.provinceRegionCfgAdapt = provinceRegionCfgAdapt;
	}

	public String getKey() {
		return provinceRegionCfgAdapt.getKey();
	}

	public ProvinceRegionCfg createProvinceRegionCfg(ProvinceRegionCfg provinceRegionCfg) {
		provinceRegionCfgAdapt.createProvinceRegionCfg(provinceRegionCfg);
		return provinceRegionCfg;
	}

	public ProvinceRegionCfg modifyProvinceRegionCfg(ProvinceRegionCfg provinceRegionCfg) {
		provinceRegionCfgAdapt.modifyProvinceRegionCfg(provinceRegionCfg);
		return provinceRegionCfg;
	}

	public void deleteProvinceRegionCfg(ProvinceRegionCfg provinceRegionCfg) {
		provinceRegionCfgAdapt.deleteProvinceRegionCfg(provinceRegionCfg);
	}

	public void batchDeleteProvinceRegionCfg(List<ProvinceRegionCfg> provinceRegionCfgList) {
		provinceRegionCfgAdapt.batchDeleteProvinceRegionCfg(provinceRegionCfgList);
	}

	public ProvinceRegionCfg getProvinceRegionCfgById(String provinceRegionCfgId) {
		return provinceRegionCfgAdapt.getProvinceRegionCfgById(provinceRegionCfgId);
	}

	public List<ProvinceRegionCfg> queryProvinceRegionCfg(ProvinceRegionCfg provinceRegionCfg) {
		return provinceRegionCfgAdapt.queryProvinceRegionCfg(provinceRegionCfg);
	}
	
}