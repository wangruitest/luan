package com.funo.regionCoords.adapt.impl;

import java.util.List;

import com.funo.base.adapt.BaseAdapt;
import com.funo.regionCoords.dao.IRegionCoordsDao;
import com.funo.regionCoords.dao.IRegionPolygonDao;
import com.funo.regionCoords.adapt.IRegionCoordsAdapt;
import com.funo.regionCoords.model.RegionCoords;
import com.funo.regionCoords.model.RegionPolygon;

public class RegionCoordsAdapt extends BaseAdapt implements IRegionCoordsAdapt {

	private static final long serialVersionUID = 1L;
	private IRegionCoordsDao regionCoordsDao;
	
	private IRegionPolygonDao regionPolygonDao;
	
	public IRegionCoordsDao getRegionCoordsDao() {
		return regionCoordsDao;
	}
	
	public List<RegionPolygon> queryByCityDayView(RegionPolygon regionPolygon){
		return regionPolygonDao.queryByCityDayView(regionPolygon);
	}
	
	public List<RegionPolygon> getAllRegionInfo(RegionPolygon regionPolygon) {
		return regionPolygonDao.queryByArgs(regionPolygon);
	}

	public void setRegionCoordsDao(IRegionCoordsDao regionCoordsDao) {
		this.regionCoordsDao = regionCoordsDao;
	}

	public String getKey() {
		return regionCoordsDao.getKey();
	}

	public RegionCoords createRegionCoords(RegionCoords regionCoords) {
		regionCoordsDao.create(regionCoords);
		return regionCoords;
	}

	public RegionCoords modifyRegionCoords(RegionCoords regionCoords) {
		regionCoordsDao.update(regionCoords);
		return regionCoords;
	}

	public void deleteRegionCoords(RegionCoords regionCoords) {
		regionCoordsDao.delete(regionCoords);
	}

	public void batchDeleteRegionCoords(List<RegionCoords> regionCoordsList) {
		regionCoordsDao.batchCreate(regionCoordsList);
	}

	public RegionCoords getRegionCoordsById(String regionCoordsId) {
		return regionCoordsDao.getById(regionCoordsId);
	}

	public List<RegionCoords> queryRegionCoords(RegionCoords regionCoords) {
		return regionCoordsDao.queryByArgs(regionCoords);
	}

	public IRegionPolygonDao getRegionPolygonDao() {
		return regionPolygonDao;
	}

	public void setRegionPolygonDao(IRegionPolygonDao regionPolygonDao) {
		this.regionPolygonDao = regionPolygonDao;
	}

	/* (non-Javadoc)
	 * @see com.funo.regionCoords.adapt.IRegionCoordsAdapt#queryByCityDayView(com.funo.regionCoords.model.RegionPolygon)
	 */
//	@Override
//	public List<RegionPolygon> queryByCityDayView(RegionPolygon regionPolygon) {
//		// TODO Auto-generated method stub
//		return regionPolygonDao.queryByCityDayView(regionPolygon);
//	}

	/* (non-Javadoc)
	 * @see com.funo.regionCoords.adapt.IRegionCoordsAdapt#queryByRegionDayView(com.funo.regionCoords.model.RegionPolygon)
	 */
	@Override
	public List<RegionPolygon> queryByRegionDayView(RegionPolygon regionPolygon) {
		// TODO Auto-generated method stub
		return regionPolygonDao.queryByRegionDayView(regionPolygon);
	}

	/* (non-Javadoc)
	 * @see com.funo.regionCoords.adapt.IRegionCoordsAdapt#queryByRegionIdsForCoords(java.lang.String)
	 */
	@Override
	public List<RegionCoords> queryByRegionIdsForCoords(RegionCoords regionCoords) {
		// TODO Auto-generated method stub
		return regionCoordsDao.queryByRegionIdsForCoords(regionCoords);
	}

	@Override
	public List<RegionPolygon> queryByLuanRegionDayView(RegionPolygon regionPolygon) {
		// TODO Auto-generated method stub
		return regionPolygonDao.queryByLuanRegionDayView(regionPolygon);
	}
	
}