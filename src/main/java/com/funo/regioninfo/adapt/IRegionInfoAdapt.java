package com.funo.regioninfo.adapt;

import java.util.List;
import java.util.Map;

import com.funo.regioninfo.model.RegionInfo;


public interface IRegionInfoAdapt {

	public String getKey();

	public RegionInfo createRegionInfo(RegionInfo regionInfo);

	public RegionInfo modifyRegionInfo(RegionInfo regionInfo);

	public void deleteRegionInfo(RegionInfo regionInfo);

	public void batchDeleteRegionInfo(List<RegionInfo> regionInfoList);

	public RegionInfo getRegionInfoById(String unid);

	public List<RegionInfo> queryRegionInfo(RegionInfo regionInfo);

	public List<Map<String, Object>> queryByAlevel(RegionInfo regionInfo);
}