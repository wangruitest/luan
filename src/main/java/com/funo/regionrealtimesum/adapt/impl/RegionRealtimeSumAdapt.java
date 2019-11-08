package com.funo.regionrealtimesum.adapt.impl;

import java.util.List;

import com.funo.base.adapt.BaseAdapt;
import com.funo.regionCoords.model.RegionPolygon;
import com.funo.regionrealtimesum.adapt.IRegionRealtimeSumAdapt;
import com.funo.regionrealtimesum.dao.IRegionRealtimeSumDao;
import com.funo.regionrealtimesum.model.ForeignCities;
import com.funo.regionrealtimesum.model.RRSum;
import com.funo.regionrealtimesum.model.RegionRealtimeSum;

public class RegionRealtimeSumAdapt extends BaseAdapt implements IRegionRealtimeSumAdapt {

	private static final long serialVersionUID = 1L;
	private IRegionRealtimeSumDao regionRealtimeSumDao;
	
	public IRegionRealtimeSumDao getRegionRealtimeSumDao() {
		return regionRealtimeSumDao;
	}

	public void setRegionRealtimeSumDao(IRegionRealtimeSumDao regionRealtimeSumDao) {
		this.regionRealtimeSumDao = regionRealtimeSumDao;
	}

	public String getKey() {
		return regionRealtimeSumDao.getKey();
	}

	public RegionRealtimeSum createRegionRealtimeSum(RegionRealtimeSum regionRealtimeSum) {
		regionRealtimeSumDao.create(regionRealtimeSum);
		return regionRealtimeSum;
	}

	public RegionRealtimeSum modifyRegionRealtimeSum(RegionRealtimeSum regionRealtimeSum) {
		regionRealtimeSumDao.update(regionRealtimeSum);
		return regionRealtimeSum;
	}

	public void deleteRegionRealtimeSum(RegionRealtimeSum regionRealtimeSum) {
		regionRealtimeSumDao.delete(regionRealtimeSum);
	}

	public void batchDeleteRegionRealtimeSum(List<RegionRealtimeSum> regionRealtimeSumList) {
		regionRealtimeSumDao.batchCreate(regionRealtimeSumList);
	}

	public RegionRealtimeSum getRegionRealtimeSumById(String regionRealtimeSumId) {
		return regionRealtimeSumDao.getById(regionRealtimeSumId);
	}

	public List<RegionRealtimeSum> queryRegionRealtimeSum(RegionRealtimeSum regionRealtimeSum) {
		return regionRealtimeSumDao.queryByArgs(regionRealtimeSum);
	}
	
	public List<RegionRealtimeSum> queryAllCitys(RegionRealtimeSum regionRealtimeSum) {
		return regionRealtimeSumDao.queryByAllCitys(regionRealtimeSum);
	}
	
	public List<RegionRealtimeSum> queryCityidRegionid(RegionRealtimeSum regionRealtimeSum) {
		return regionRealtimeSumDao.queryByCityidRegionid(regionRealtimeSum);
	}
	
	public List<RegionRealtimeSum> queryByCityidRegionidForMap(RegionRealtimeSum regionRealtimeSum) {
		return regionRealtimeSumDao.queryByCityidRegionidForMap(regionRealtimeSum);
	}

	public List<RRSum> queryByCity(RegionRealtimeSum regionRealtimeSum){
		return regionRealtimeSumDao.queryByCity(regionRealtimeSum);
	}

	//获取所有景区实时游客人数
	public List<RegionRealtimeSum> queryRealtimeList(RegionRealtimeSum regionRealtimeSum) {
		return regionRealtimeSumDao.queryByRealtimeList(regionRealtimeSum);
	}

	/* (non-Javadoc)
	 * @see com.funo.regionrealtimesum.adapt.IRegionRealtimeSumAdapt#queryByCityCodeForDaPing(com.funo.regionrealtimesum.model.RegionRealtimeSum)
	 */
	@Override
	public List<RegionRealtimeSum> queryByCityCodeForDaPing(
			RegionRealtimeSum realtimeSum) {
		// TODO Auto-generated method stub
		return regionRealtimeSumDao.queryByCityCodeForDaPing(realtimeSum);
	}

	/* (non-Javadoc)
	 * @see com.funo.regionrealtimesum.adapt.IRegionRealtimeSumAdapt#queryByFromList(com.funo.regionrealtimesum.model.RegionRealtimeSum)
	 */
	@Override
	public List<RegionRealtimeSum> queryByFromList(RegionRealtimeSum realtimeSum) {
		// TODO Auto-generated method stub
		return regionRealtimeSumDao.queryByFromList(realtimeSum);
	}

	/* (non-Javadoc)
	 * @see com.funo.regionrealtimesum.adapt.IRegionRealtimeSumAdapt#queryByProvinceForDaPing(com.funo.regionrealtimesum.model.RegionRealtimeSum)
	 */
	@Override
	public List<RegionRealtimeSum> queryByProvinceForDaPing(
			RegionRealtimeSum realtimeSum) {
		// TODO Auto-generated method stub
		return regionRealtimeSumDao.queryByProvinceForDaPing(realtimeSum);
	}

	/* (non-Javadoc)
	 * @see com.funo.regionrealtimesum.adapt.IRegionRealtimeSumAdapt#queryByAllDay(com.funo.regionrealtimesum.model.RegionRealtimeSum)
	 */
	@Override
	public List<RegionRealtimeSum> queryByAllDay(RegionRealtimeSum realtimeSum) {
		// TODO Auto-generated method stub
		return regionRealtimeSumDao.queryByAllDay(realtimeSum);
	}

	/* (non-Javadoc)
	 * @see com.funo.regionrealtimesum.adapt.IRegionRealtimeSumAdapt#queryByRegionsForDayData(com.funo.regionCoords.model.RegionPolygon)
	 */
	@Override
	public List<RRSum> queryByRegionsForDayData(RegionPolygon regionPolygon) {
		// TODO Auto-generated method stub
		return regionRealtimeSumDao.queryByRegionsForDayData(regionPolygon);
	}

	/* (non-Javadoc)
	 * @see com.funo.regionrealtimesum.adapt.IRegionRealtimeSumAdapt#queryByRegionsForLine(com.funo.regionCoords.model.RegionPolygon)
	 */
	@Override
	public List<RegionRealtimeSum> queryByRegionsForLine(
			RegionPolygon regionPolygon) {
		// TODO Auto-generated method stub
		return regionRealtimeSumDao.queryByRegionsForLine(regionPolygon);
	}

	@Override
	public List<ForeignCities> queryByForeignCities(ForeignCities foreignCities) {
		// TODO Auto-generated method stub
		return regionRealtimeSumDao.queryByForeignCities(foreignCities);
	}
}