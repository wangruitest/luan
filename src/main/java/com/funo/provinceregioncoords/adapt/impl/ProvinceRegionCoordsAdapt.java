package com.funo.provinceregioncoords.adapt.impl;

import java.util.List;

import com.funo.base.adapt.BaseAdapt;
import com.funo.provinceregioncoords.dao.IProvinceRegionCoordsDao;
import com.funo.provinceregioncoords.adapt.IProvinceRegionCoordsAdapt;
import com.funo.provinceregioncoords.model.ProvinceRegionCoords;

public class ProvinceRegionCoordsAdapt extends BaseAdapt implements IProvinceRegionCoordsAdapt {

	private static final long serialVersionUID = 1L;
	private IProvinceRegionCoordsDao provinceRegionCoordsDao;
	
	public IProvinceRegionCoordsDao getProvinceRegionCoordsDao() {
		return provinceRegionCoordsDao;
	}

	public void setProvinceRegionCoordsDao(IProvinceRegionCoordsDao provinceRegionCoordsDao) {
		this.provinceRegionCoordsDao = provinceRegionCoordsDao;
	}

	public String getKey() {
		return provinceRegionCoordsDao.getKey();
	}

	public ProvinceRegionCoords createProvinceRegionCoords(ProvinceRegionCoords provinceRegionCoords) {
		provinceRegionCoordsDao.create(provinceRegionCoords);
		return provinceRegionCoords;
	}

	public ProvinceRegionCoords modifyProvinceRegionCoords(ProvinceRegionCoords provinceRegionCoords) {
		provinceRegionCoordsDao.update(provinceRegionCoords);
		return provinceRegionCoords;
	}

	public void deleteProvinceRegionCoords(ProvinceRegionCoords provinceRegionCoords) {
		provinceRegionCoordsDao.delete(provinceRegionCoords);
	}

	public void batchDeleteProvinceRegionCoords(List<ProvinceRegionCoords> provinceRegionCoordsList) {
		provinceRegionCoordsDao.batchCreate(provinceRegionCoordsList);
	}

	public ProvinceRegionCoords getProvinceRegionCoordsById(String provinceRegionCoordsId) {
		return provinceRegionCoordsDao.getById(provinceRegionCoordsId);
	}

	public List<ProvinceRegionCoords> queryProvinceRegionCoords(ProvinceRegionCoords provinceRegionCoords) {
		return provinceRegionCoordsDao.queryByArgs(provinceRegionCoords);
	}
	
	//获取所有景区
	public List<ProvinceRegionCoords> queryRegionsTags(ProvinceRegionCoords provinceRegionCoords) {
		return provinceRegionCoordsDao.queryByRegionIdCityCode(provinceRegionCoords);
	}
	
	//重置景区中心坐标点
	public ProvinceRegionCoords uptRegionLnglat(ProvinceRegionCoords regionCfg) {
		return provinceRegionCoordsDao.updateByRegionLnglat(regionCfg);
	}
	
	//根据城市id获取景区
	public List<ProvinceRegionCoords> queryRegionCfgByCityCode(ProvinceRegionCoords provinceRegionCoords) {
		return provinceRegionCoordsDao.queryByRegionCfgByCityCode(provinceRegionCoords);
	}
	
}