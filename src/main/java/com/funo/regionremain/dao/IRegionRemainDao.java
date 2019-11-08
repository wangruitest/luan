package com.funo.regionremain.dao;

import java.util.List;

import com.funo.base.dao.CommonDao;
import com.funo.regionremain.model.RegionRemain;

public interface IRegionRemainDao extends CommonDao<RegionRemain> {
	
	//按年查询
	public List<RegionRemain> queryBySearchYsearch(RegionRemain regionRemain);
	
	//按季查询
	public List<RegionRemain> queryBySearchQsearch(RegionRemain regionRemain);
	
	//按月查询
	public List<RegionRemain> queryBySearchMsearch(RegionRemain regionRemain);

}