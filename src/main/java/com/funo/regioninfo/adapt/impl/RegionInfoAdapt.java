package com.funo.regioninfo.adapt.impl;

import java.util.List;
import java.util.Map;

import com.funo.base.adapt.BaseAdapt;
import com.funo.regioninfo.dao.IRegionInfoDao;
import com.funo.regioninfo.adapt.IRegionInfoAdapt;
import com.funo.regioninfo.model.RegionInfo;

public class RegionInfoAdapt extends BaseAdapt implements IRegionInfoAdapt {

	private static final long serialVersionUID = 1L;
	private IRegionInfoDao regionInfoDao;
	
	public IRegionInfoDao getRegionInfoDao() {
		return regionInfoDao;
	}

	public void setRegionInfoDao(IRegionInfoDao regionInfoDao) {
		this.regionInfoDao = regionInfoDao;
	}

	public String getKey() {
		return regionInfoDao.getKey();
	}

	public RegionInfo createRegionInfo(RegionInfo regionInfo) {
		regionInfoDao.create(regionInfo);
		return regionInfo;
	}

	public RegionInfo modifyRegionInfo(RegionInfo regionInfo) {
		regionInfoDao.update(regionInfo);
		return regionInfo;
	}

	public void deleteRegionInfo(RegionInfo regionInfo) {
		regionInfoDao.delete(regionInfo);
	}

	public void batchDeleteRegionInfo(List<RegionInfo> regionInfoList) {
		regionInfoDao.batchCreate(regionInfoList);
	}

	public RegionInfo getRegionInfoById(String regionInfoId) {
		return regionInfoDao.getById(regionInfoId);
	}

	public List<RegionInfo> queryRegionInfo(RegionInfo regionInfo) {
		return regionInfoDao.queryByArgs(regionInfo);
	}

	/* (non-Javadoc)
	 * @see com.funo.regioninfo.adapt.IRegionInfoAdapt#queryByAlevel(com.funo.regioninfo.model.RegionInfo)
	 */
	@Override
	public List<Map<String, Object>> queryByAlevel(RegionInfo regionInfo) {
		// TODO Auto-generated method stub
		return regionInfoDao.queryByAlevel(regionInfo);
	}
	
}