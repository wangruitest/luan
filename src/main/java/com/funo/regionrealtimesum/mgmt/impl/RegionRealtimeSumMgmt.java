package com.funo.regionrealtimesum.mgmt.impl;

import java.util.List;

import com.funo.base.mgmt.BaseMgmt;
import com.funo.regionCoords.model.RegionPolygon;
import com.funo.regionrealtimesum.adapt.IRegionRealtimeSumAdapt;
import com.funo.regionrealtimesum.mgmt.IRegionRealtimeSumMgmt;
import com.funo.regionrealtimesum.model.ForeignCities;
import com.funo.regionrealtimesum.model.RRSum;
import com.funo.regionrealtimesum.model.RegionRealtimeSum;

public class RegionRealtimeSumMgmt extends BaseMgmt implements IRegionRealtimeSumMgmt {

	private static final long serialVersionUID = 1L;
	private IRegionRealtimeSumAdapt regionRealtimeSumAdapt;
	
	public IRegionRealtimeSumAdapt getRegionRealtimeSumAdapt() {
		return regionRealtimeSumAdapt;
	}
	public void setRegionRealtimeSumAdapt(IRegionRealtimeSumAdapt regionRealtimeSumAdapt) {
		this.regionRealtimeSumAdapt = regionRealtimeSumAdapt;
	}

	public String getKey() {
		return regionRealtimeSumAdapt.getKey();
	}

	public RegionRealtimeSum createRegionRealtimeSum(RegionRealtimeSum regionRealtimeSum) {
		regionRealtimeSumAdapt.createRegionRealtimeSum(regionRealtimeSum);
		return regionRealtimeSum;
	}

	public RegionRealtimeSum modifyRegionRealtimeSum(RegionRealtimeSum regionRealtimeSum) {
		regionRealtimeSumAdapt.modifyRegionRealtimeSum(regionRealtimeSum);
		return regionRealtimeSum;
	}

	public void deleteRegionRealtimeSum(RegionRealtimeSum regionRealtimeSum) {
		regionRealtimeSumAdapt.deleteRegionRealtimeSum(regionRealtimeSum);
	}

	public void batchDeleteRegionRealtimeSum(List<RegionRealtimeSum> regionRealtimeSumList) {
		regionRealtimeSumAdapt.batchDeleteRegionRealtimeSum(regionRealtimeSumList);
	}

	public RegionRealtimeSum getRegionRealtimeSumById(String regionRealtimeSumId) {
		return regionRealtimeSumAdapt.getRegionRealtimeSumById(regionRealtimeSumId);
	}

	public List<RegionRealtimeSum> queryRegionRealtimeSum(RegionRealtimeSum regionRealtimeSum) {
		return regionRealtimeSumAdapt.queryRegionRealtimeSum(regionRealtimeSum);
	}
	
	public List<RegionRealtimeSum> queryAllCitys(RegionRealtimeSum regionRealtimeSum) {
		return regionRealtimeSumAdapt.queryAllCitys(regionRealtimeSum);
	}
	
	public List<RegionRealtimeSum> queryCityidRegionid(RegionRealtimeSum regionRealtimeSum) {
		return regionRealtimeSumAdapt.queryCityidRegionid(regionRealtimeSum);
	}
	
	public List<RegionRealtimeSum> queryByCityidRegionidForMap(RegionRealtimeSum regionRealtimeSum) {
		return regionRealtimeSumAdapt.queryByCityidRegionidForMap(regionRealtimeSum);
	}

	public List<RRSum> queryByCity(RegionRealtimeSum regionRealtimeSum){
		return regionRealtimeSumAdapt.queryByCity(regionRealtimeSum);
	}

	//获取所有景区实时游客人数
	public List<RegionRealtimeSum> queryRealtimeList(RegionRealtimeSum regionRealtimeSum) {
		return regionRealtimeSumAdapt.queryRealtimeList(regionRealtimeSum);
	}
	/* (non-Javadoc)
	 * @see com.funo.regionrealtimesum.mgmt.IRegionRealtimeSumMgmt#queryByCityCodeForDaPing(com.funo.regionrealtimesum.model.RegionRealtimeSum)
	 */
	@Override
	public List<RegionRealtimeSum> queryByCityCodeForDaPing(
			RegionRealtimeSum realtimeSum) {
		// TODO Auto-generated method stub
		return regionRealtimeSumAdapt.queryByCityCodeForDaPing(realtimeSum);
	}
	/* (non-Javadoc)
	 * @see com.funo.regionrealtimesum.mgmt.IRegionRealtimeSumMgmt#queryByFromList(com.funo.regionrealtimesum.model.RegionRealtimeSum)
	 */
	@Override
	public List<RegionRealtimeSum> queryByFromList(RegionRealtimeSum realtimeSum) {
		// TODO Auto-generated method stub
		return regionRealtimeSumAdapt.queryByFromList(realtimeSum);
	}
	/* (non-Javadoc)
	 * @see com.funo.regionrealtimesum.mgmt.IRegionRealtimeSumMgmt#queryByProvinceForDaPing(com.funo.regionrealtimesum.model.RegionRealtimeSum)
	 */
	@Override
	public List<RegionRealtimeSum> queryByProvinceForDaPing(
			RegionRealtimeSum realtimeSum) {
		// TODO Auto-generated method stub
		return regionRealtimeSumAdapt.queryByProvinceForDaPing(realtimeSum);
	}
	/* (non-Javadoc)
	 * @see com.funo.regionrealtimesum.mgmt.IRegionRealtimeSumMgmt#queryByAllDay(com.funo.regionrealtimesum.model.RegionRealtimeSum)
	 */
	@Override
	public List<RegionRealtimeSum> queryByAllDay(RegionRealtimeSum realtimeSum) {
		// TODO Auto-generated method stub
		return regionRealtimeSumAdapt.queryByAllDay(realtimeSum);
	}
	/* (non-Javadoc)
	 * @see com.funo.regionrealtimesum.mgmt.IRegionRealtimeSumMgmt#queryByRegionsForDayData(com.funo.regionCoords.model.RegionPolygon)
	 */
	@Override
	public List<RRSum> queryByRegionsForDayData(RegionPolygon regionPolygon) {
		// TODO Auto-generated method stub
		return regionRealtimeSumAdapt.queryByRegionsForDayData(regionPolygon);
	}
	/* (non-Javadoc)
	 * @see com.funo.regionrealtimesum.mgmt.IRegionRealtimeSumMgmt#queryByRegionsForLine(com.funo.regionCoords.model.RegionPolygon)
	 */
	@Override
	public List<RegionRealtimeSum> queryByRegionsForLine(
			RegionPolygon regionPolygon) {
		// TODO Auto-generated method stub
		return regionRealtimeSumAdapt.queryByRegionsForLine(regionPolygon);
	}
	@Override
	public List<ForeignCities> queryByForeignCities(ForeignCities foreignCities) {
		// TODO Auto-generated method stub
		return regionRealtimeSumAdapt.queryByForeignCities(foreignCities);
	}
}