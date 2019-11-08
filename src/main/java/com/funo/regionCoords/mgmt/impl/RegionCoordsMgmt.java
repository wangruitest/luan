package com.funo.regionCoords.mgmt.impl;

import java.util.List;

import com.funo.base.mgmt.BaseMgmt;
import com.funo.regionCoords.adapt.IRegionCoordsAdapt;
import com.funo.regionCoords.mgmt.IRegionCoordsMgmt;
import com.funo.regionCoords.model.RegionCoords;
import com.funo.regionCoords.model.RegionPolygon;

public class RegionCoordsMgmt extends BaseMgmt implements IRegionCoordsMgmt {

	private static final long serialVersionUID = 1L;
	private IRegionCoordsAdapt regionCoordsAdapt;
	
	public List<RegionPolygon> getAllRegionInfo(RegionPolygon regionPolygon) {
		return regionCoordsAdapt.getAllRegionInfo(regionPolygon);
	}
	
	public IRegionCoordsAdapt getRegionCoordsAdapt() {
		return regionCoordsAdapt;
	}
	public void setRegionCoordsAdapt(IRegionCoordsAdapt regionCoordsAdapt) {
		this.regionCoordsAdapt = regionCoordsAdapt;
	}
	
	public void uptRegionCoordsList(RegionPolygon regionPolygon) {
		RegionCoords rc = new RegionCoords();
		rc.setRegionId(regionPolygon.getRegionId());
		regionCoordsAdapt.deleteRegionCoords(rc);
		for(RegionCoords temprc : regionPolygon.getaRegionCoords()) {
			regionCoordsAdapt.createRegionCoords(temprc);
		}
	}

	public String getKey() {
		return regionCoordsAdapt.getKey();
	}

	public RegionCoords createRegionCoords(RegionCoords regionCoords) {
		regionCoordsAdapt.createRegionCoords(regionCoords);
		return regionCoords;
	}

	public RegionCoords modifyRegionCoords(RegionCoords regionCoords) {
		regionCoordsAdapt.modifyRegionCoords(regionCoords);
		return regionCoords;
	}

	public void deleteRegionCoords(RegionCoords regionCoords) {
		regionCoordsAdapt.deleteRegionCoords(regionCoords);
	}

	public void batchDeleteRegionCoords(List<RegionCoords> regionCoordsList) {
		regionCoordsAdapt.batchDeleteRegionCoords(regionCoordsList);
	}

	public RegionCoords getRegionCoordsById(String regionCoordsId) {
		return regionCoordsAdapt.getRegionCoordsById(regionCoordsId);
	}

	public List<RegionCoords> queryRegionCoords(RegionCoords regionCoords) {
		return regionCoordsAdapt.queryRegionCoords(regionCoords);
	}

	@Override
	public List<RegionPolygon> queryByCityDayView(RegionPolygon regionPolygon) {
		// TODO Auto-generated method stub
		return regionCoordsAdapt.queryByCityDayView(regionPolygon);
	}
	

	/* (non-Javadoc)
	 * @see com.funo.regionCoords.mgmt.IRegionCoordsMgmt#queryByRegionDayView(com.funo.regionCoords.model.RegionPolygon)
	 */
	@Override
	public List<RegionPolygon> queryByRegionDayView(RegionPolygon regionPolygon) {
		// TODO Auto-generated method stub
		return regionCoordsAdapt.queryByRegionDayView(regionPolygon);
	}
	
	/* (non-Javadoc)
	 * @see com.funo.regionCoords.mgmt.IRegionCoordsMgmt#queryByRegionIdsForCoords(java.lang.String)
	 */
	@Override
	public List<RegionCoords> queryByRegionIdsForCoords(RegionCoords regionCoords) {
		// TODO Auto-generated method stub
		return regionCoordsAdapt.queryByRegionIdsForCoords(regionCoords);
	}

	@Override
	public List<RegionPolygon> queryByLuanRegionDayView(RegionPolygon regionPolygon) {
		// TODO Auto-generated method stub
		return regionCoordsAdapt.queryByLuanRegionDayView(regionPolygon);
	}
	
}