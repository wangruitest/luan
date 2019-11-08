package com.funo.regionrealtimesumadd.mgmt;

import java.util.List;

import com.funo.regionrealtimesumadd.model.RegionRealtimeSumAdd;


public interface IRegionRealtimeSumAddMgmt {

	public String getKey();

	public RegionRealtimeSumAdd createRegionRealtimeSumAdd(RegionRealtimeSumAdd regionRealtimeSumAdd);

	public RegionRealtimeSumAdd modifyRegionRealtimeSumAdd(RegionRealtimeSumAdd regionRealtimeSumAdd);

	public void deleteRegionRealtimeSumAdd(RegionRealtimeSumAdd regionRealtimeSumAdd);

	public void batchDeleteRegionRealtimeSumAdd(List<RegionRealtimeSumAdd> regionRealtimeSumAddList);

	public RegionRealtimeSumAdd getRegionRealtimeSumAddById(String unid);

	public List<RegionRealtimeSumAdd> queryRegionRealtimeSumAdd(RegionRealtimeSumAdd regionRealtimeSumAdd);
	
	public List<RegionRealtimeSumAdd> queryCityidRegionid(RegionRealtimeSumAdd regionRealtimeSumAdd);
	
	public List<RegionRealtimeSumAdd> queryCityidRegionidIn(RegionRealtimeSumAdd regionRealtimeSumAdd);
	
	public List<RegionRealtimeSumAdd> queryCityidRegionidOut(RegionRealtimeSumAdd regionRealtimeSumAdd);
	
	public List<RegionRealtimeSumAdd> queryAllcitysOut(RegionRealtimeSumAdd regionRealtimeSumAdd);
	
	public List<RegionRealtimeSumAdd> queryAllcitysIn(RegionRealtimeSumAdd regionRealtimeSumAdd);

}