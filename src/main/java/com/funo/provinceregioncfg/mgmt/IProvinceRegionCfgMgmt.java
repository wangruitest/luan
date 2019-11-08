package com.funo.provinceregioncfg.mgmt;

import java.util.List;

import com.funo.provinceregioncfg.model.ProvinceRegionCfg;


public interface IProvinceRegionCfgMgmt {

	public String getKey();

	public ProvinceRegionCfg createProvinceRegionCfg(ProvinceRegionCfg provinceRegionCfg);

	public ProvinceRegionCfg modifyProvinceRegionCfg(ProvinceRegionCfg provinceRegionCfg);

	public void deleteProvinceRegionCfg(ProvinceRegionCfg provinceRegionCfg);

	public void batchDeleteProvinceRegionCfg(List<ProvinceRegionCfg> provinceRegionCfgList);

	public ProvinceRegionCfg getProvinceRegionCfgById(String unid);

	public List<ProvinceRegionCfg> queryProvinceRegionCfg(ProvinceRegionCfg provinceRegionCfg);

}