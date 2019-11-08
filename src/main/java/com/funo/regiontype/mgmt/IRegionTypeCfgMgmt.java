package com.funo.regiontype.mgmt;

import java.util.List;

import com.funo.regiontype.model.RegionTypeCfg;


public interface IRegionTypeCfgMgmt {

	public String getKey();

	public RegionTypeCfg createRegionTypeCfg(RegionTypeCfg regionTypeCfg);

	public RegionTypeCfg modifyRegionTypeCfg(RegionTypeCfg regionTypeCfg);

	public void deleteRegionTypeCfg(RegionTypeCfg regionTypeCfg);

	public void batchDeleteRegionTypeCfg(List<RegionTypeCfg> regionTypeCfgList);

	public RegionTypeCfg getRegionTypeCfgById(String unid);

	public List<RegionTypeCfg> queryRegionTypeCfg(RegionTypeCfg regionTypeCfg);
	
	public List<RegionTypeCfg> updateForIsExist(RegionTypeCfg regionTypeCfg);
	
	public List<RegionTypeCfg> insertForIsExist(RegionTypeCfg regionTypeCfg);
}