package com.funo.regioninfo.dao;

import java.util.List;
import java.util.Map;

import com.funo.base.dao.CommonDao;
import com.funo.regioninfo.model.RegionInfo;

public interface IRegionInfoDao extends CommonDao<RegionInfo> {

	public List<Map<String, Object>>  queryByAlevel(RegionInfo regionInfo);
}