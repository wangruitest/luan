package com.funo.regionremain.adapt;

import java.util.List;

import com.funo.regionremain.model.RegionRemain;


public interface IRegionRemainAdapt {

	public String getKey();

	public RegionRemain createRegionRemain(RegionRemain regionRemain);

	public RegionRemain modifyRegionRemain(RegionRemain regionRemain);

	public void deleteRegionRemain(RegionRemain regionRemain);

	public void batchDeleteRegionRemain(List<RegionRemain> regionRemainList);

	public RegionRemain getRegionRemainById(String unid);

	public List<RegionRemain> queryRegionRemain(RegionRemain regionRemain);
	
	public List<RegionRemain> queryRegionRemainYsearch(RegionRemain regionRemain);
	
	public List<RegionRemain> queryRegionRemainQsearch(RegionRemain regionRemain);
	
	public List<RegionRemain> queryRegionRemainMsearch(RegionRemain regionRemain);

}