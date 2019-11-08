package com.funo.regiontype.adapt;

import java.util.List;

import com.funo.regiontype.model.RegionTypeCfg;


public interface IRegionTypeCfgAdapt {

	public String getKey();

	public RegionTypeCfg createRegionTypeCfg(RegionTypeCfg regionTypeCfg);

	public RegionTypeCfg modifyRegionTypeCfg(RegionTypeCfg regionTypeCfg);

	public void deleteRegionTypeCfg(RegionTypeCfg regionTypeCfg);

	public void batchDeleteRegionTypeCfg(List<RegionTypeCfg> regionTypeCfgList);

	public RegionTypeCfg getRegionTypeCfgById(String unid);

	public List<RegionTypeCfg> queryRegionTypeCfg(RegionTypeCfg regionTypeCfg);
	
	public List<RegionTypeCfg> updateForIsExist(RegionTypeCfg regionTypeCfg);
	
	List<RegionTypeCfg> insertForIsExist(RegionTypeCfg regionTypeCfg);
}