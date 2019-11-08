package com.funo.regionnotice.dao;

import java.util.List;

import com.funo.base.dao.CommonDao;
import com.funo.regionnotice.model.RegionNotice;

public interface IRegionNoticeDao extends CommonDao<RegionNotice> {
	public List<RegionNotice> queryByNotices(RegionNotice regionNotice);
}