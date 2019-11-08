package com.funo.regionnotice.mgmt;

import java.util.List;

import com.funo.regionnotice.model.RegionNotice;


public interface IRegionNoticeMgmt {

	public String getKey();

	public RegionNotice createRegionNotice(RegionNotice regionNotice);

	public RegionNotice modifyRegionNotice(RegionNotice regionNotice);

	public void deleteRegionNotice(RegionNotice regionNotice);

	public void batchDeleteRegionNotice(List<RegionNotice> regionNoticeList);

	public RegionNotice getRegionNoticeById(String unid);

	public List<RegionNotice> queryRegionNotice(RegionNotice regionNotice);

	public List<RegionNotice> queryByNotices(RegionNotice regionNotice);
}