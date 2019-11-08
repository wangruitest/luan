package com.funo.regioninfo.mgmt.impl;

import java.util.List;
import java.util.Map;

import com.funo.base.mgmt.BaseMgmt;
import com.funo.regioninfo.adapt.IRegionInfoAdapt;
import com.funo.regioninfo.mgmt.IRegionInfoMgmt;
import com.funo.regioninfo.model.RegionInfo;

public class RegionInfoMgmt extends BaseMgmt implements IRegionInfoMgmt {

	private static final long serialVersionUID = 1L;
	private IRegionInfoAdapt regionInfoAdapt;
	
	public IRegionInfoAdapt getRegionInfoAdapt() {
		return regionInfoAdapt;
	}
	public void setRegionInfoAdapt(IRegionInfoAdapt regionInfoAdapt) {
		this.regionInfoAdapt = regionInfoAdapt;
	}

	public String getKey() {
		return regionInfoAdapt.getKey();
	}

	public RegionInfo createRegionInfo(RegionInfo regionInfo) {
		regionInfoAdapt.createRegionInfo(regionInfo);
		return regionInfo;
	}

	public RegionInfo modifyRegionInfo(RegionInfo regionInfo) {
		regionInfoAdapt.modifyRegionInfo(regionInfo);
		return regionInfo;
	}

	public void deleteRegionInfo(RegionInfo regionInfo) {
		regionInfoAdapt.deleteRegionInfo(regionInfo);
	}

	public void batchDeleteRegionInfo(List<RegionInfo> regionInfoList) {
		regionInfoAdapt.batchDeleteRegionInfo(regionInfoList);
	}

	public RegionInfo getRegionInfoById(String regionInfoId) {
		return regionInfoAdapt.getRegionInfoById(regionInfoId);
	}

	public List<RegionInfo> queryRegionInfo(RegionInfo regionInfo) {
		return regionInfoAdapt.queryRegionInfo(regionInfo);
	}
	/* (non-Javadoc)
	 * @see com.funo.regioninfo.mgmt.IRegionInfoMgmt#queryByAlevel(com.funo.regioninfo.model.RegionInfo)
	 */
	@Override
	public List<Map<String, Object>> queryByAlevel(RegionInfo regionInfo) {
		// TODO Auto-generated method stub
		return regionInfoAdapt.queryByAlevel(regionInfo);
	}
	
}