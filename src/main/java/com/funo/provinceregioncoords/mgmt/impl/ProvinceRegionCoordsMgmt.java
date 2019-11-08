package com.funo.provinceregioncoords.mgmt.impl;

import java.util.List;

import com.funo.base.mgmt.BaseMgmt;
import com.funo.provinceregioncoords.adapt.IProvinceRegionCoordsAdapt;
import com.funo.provinceregioncoords.mgmt.IProvinceRegionCoordsMgmt;
import com.funo.provinceregioncoords.model.ProvinceRegionCoords;

public class ProvinceRegionCoordsMgmt extends BaseMgmt implements IProvinceRegionCoordsMgmt {

	private static final long serialVersionUID = 1L;
	private IProvinceRegionCoordsAdapt provinceRegionCoordsAdapt;
	
	public IProvinceRegionCoordsAdapt getProvinceRegionCoordsAdapt() {
		return provinceRegionCoordsAdapt;
	}
	public void setProvinceRegionCoordsAdapt(IProvinceRegionCoordsAdapt provinceRegionCoordsAdapt) {
		this.provinceRegionCoordsAdapt = provinceRegionCoordsAdapt;
	}

	public String getKey() {
		return provinceRegionCoordsAdapt.getKey();
	}

	public ProvinceRegionCoords createProvinceRegionCoords(ProvinceRegionCoords provinceRegionCoords) {
		provinceRegionCoordsAdapt.createProvinceRegionCoords(provinceRegionCoords);
		return provinceRegionCoords;
	}

	public ProvinceRegionCoords modifyProvinceRegionCoords(ProvinceRegionCoords provinceRegionCoords) {
		provinceRegionCoordsAdapt.modifyProvinceRegionCoords(provinceRegionCoords);
		return provinceRegionCoords;
	}

	public void deleteProvinceRegionCoords(ProvinceRegionCoords provinceRegionCoords) {
		provinceRegionCoordsAdapt.deleteProvinceRegionCoords(provinceRegionCoords);
	}

	public void batchDeleteProvinceRegionCoords(List<ProvinceRegionCoords> provinceRegionCoordsList) {
		provinceRegionCoordsAdapt.batchDeleteProvinceRegionCoords(provinceRegionCoordsList);
	}

	public ProvinceRegionCoords getProvinceRegionCoordsById(String provinceRegionCoordsId) {
		return provinceRegionCoordsAdapt.getProvinceRegionCoordsById(provinceRegionCoordsId);
	}

	public List<ProvinceRegionCoords> queryProvinceRegionCoords(ProvinceRegionCoords provinceRegionCoords) {
		return provinceRegionCoordsAdapt.queryProvinceRegionCoords(provinceRegionCoords);
	}
	
	
	public List<ProvinceRegionCoords> queryRegionsTags(ProvinceRegionCoords provinceRegionCoords) {
		return provinceRegionCoordsAdapt.queryRegionsTags(provinceRegionCoords);
	}
	
	public ProvinceRegionCoords uptRegionLnglat(ProvinceRegionCoords regionCfg) {
		return provinceRegionCoordsAdapt.uptRegionLnglat(regionCfg);
	}
	
	public void uptRegionCoordsList(ProvinceRegionCoords regionPolygon) {
		ProvinceRegionCoords rc = new ProvinceRegionCoords();
		rc.setRegionId(regionPolygon.getRegionId());
		provinceRegionCoordsAdapt.deleteProvinceRegionCoords(rc);
		for(ProvinceRegionCoords temprc : regionPolygon.getaRegionCoords()) {
			provinceRegionCoordsAdapt.createProvinceRegionCoords(temprc);
		}
	}
	
	public List<ProvinceRegionCoords> queryRegionCfgByCityCode(ProvinceRegionCoords provinceRegionCoords){
		return provinceRegionCoordsAdapt.queryRegionCfgByCityCode(provinceRegionCoords);
	}
	
}