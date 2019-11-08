package com.funo.regionnotice.mgmt.impl;

import java.util.List;

import com.funo.base.mgmt.BaseMgmt;
import com.funo.regionnotice.adapt.IRegionNoticeAdapt;
import com.funo.regionnotice.mgmt.IRegionNoticeMgmt;
import com.funo.regionnotice.model.RegionNotice;

public class RegionNoticeMgmt extends BaseMgmt implements IRegionNoticeMgmt {

	private static final long serialVersionUID = 1L;
	private IRegionNoticeAdapt regionNoticeAdapt;
	
	public IRegionNoticeAdapt getRegionNoticeAdapt() {
		return regionNoticeAdapt;
	}
	public void setRegionNoticeAdapt(IRegionNoticeAdapt regionNoticeAdapt) {
		this.regionNoticeAdapt = regionNoticeAdapt;
	}

	public String getKey() {
		return regionNoticeAdapt.getKey();
	}

	public RegionNotice createRegionNotice(RegionNotice regionNotice) {
		regionNoticeAdapt.createRegionNotice(regionNotice);
		return regionNotice;
	}

	public RegionNotice modifyRegionNotice(RegionNotice regionNotice) {
		regionNoticeAdapt.modifyRegionNotice(regionNotice);
		return regionNotice;
	}

	public void deleteRegionNotice(RegionNotice regionNotice) {
		regionNoticeAdapt.deleteRegionNotice(regionNotice);
	}

	public void batchDeleteRegionNotice(List<RegionNotice> regionNoticeList) {
		regionNoticeAdapt.batchDeleteRegionNotice(regionNoticeList);
	}

	public RegionNotice getRegionNoticeById(String regionNoticeId) {
		return regionNoticeAdapt.getRegionNoticeById(regionNoticeId);
	}

	public List<RegionNotice> queryRegionNotice(RegionNotice regionNotice) {
		return regionNoticeAdapt.queryRegionNotice(regionNotice);
	}
	
	public List<RegionNotice> queryByNotices(RegionNotice regionNotice){
		return regionNoticeAdapt.queryByNotices(regionNotice);
	}
}