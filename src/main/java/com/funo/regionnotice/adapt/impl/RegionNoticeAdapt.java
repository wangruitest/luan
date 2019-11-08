package com.funo.regionnotice.adapt.impl;

import java.util.List;

import com.funo.base.adapt.BaseAdapt;
import com.funo.regionnotice.dao.IRegionNoticeDao;
import com.funo.regionnotice.adapt.IRegionNoticeAdapt;
import com.funo.regionnotice.model.RegionNotice;

public class RegionNoticeAdapt extends BaseAdapt implements IRegionNoticeAdapt {

	private static final long serialVersionUID = 1L;
	private IRegionNoticeDao regionNoticeDao;
	
	public IRegionNoticeDao getRegionNoticeDao() {
		return regionNoticeDao;
	}

	public void setRegionNoticeDao(IRegionNoticeDao regionNoticeDao) {
		this.regionNoticeDao = regionNoticeDao;
	}

	public String getKey() {
		return regionNoticeDao.getKey();
	}

	public RegionNotice createRegionNotice(RegionNotice regionNotice) {
		regionNoticeDao.create(regionNotice);
		return regionNotice;
	}

	public RegionNotice modifyRegionNotice(RegionNotice regionNotice) {
		regionNoticeDao.update(regionNotice);
		return regionNotice;
	}

	public void deleteRegionNotice(RegionNotice regionNotice) {
		regionNoticeDao.delete(regionNotice);
	}

	public void batchDeleteRegionNotice(List<RegionNotice> regionNoticeList) {
		regionNoticeDao.batchCreate(regionNoticeList);
	}

	public RegionNotice getRegionNoticeById(String regionNoticeId) {
		return regionNoticeDao.getById(regionNoticeId);
	}

	public List<RegionNotice> queryRegionNotice(RegionNotice regionNotice) {
		return regionNoticeDao.queryByArgs(regionNotice);
	}
	
	public List<RegionNotice> queryByNotices(RegionNotice regionNotice){
		return regionNoticeDao.queryByNotices(regionNotice);
	}
}