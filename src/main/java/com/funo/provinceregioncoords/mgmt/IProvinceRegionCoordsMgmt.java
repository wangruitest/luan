package com.funo.provinceregioncoords.mgmt;

import java.util.List;

import com.funo.provinceregioncoords.model.ProvinceRegionCoords;


public interface IProvinceRegionCoordsMgmt {

	public String getKey();

	public ProvinceRegionCoords createProvinceRegionCoords(ProvinceRegionCoords provinceRegionCoords);

	public ProvinceRegionCoords modifyProvinceRegionCoords(ProvinceRegionCoords provinceRegionCoords);

	public void deleteProvinceRegionCoords(ProvinceRegionCoords provinceRegionCoords);

	public void batchDeleteProvinceRegionCoords(List<ProvinceRegionCoords> provinceRegionCoordsList);

	public ProvinceRegionCoords getProvinceRegionCoordsById(String unid);

	public List<ProvinceRegionCoords> queryProvinceRegionCoords(ProvinceRegionCoords provinceRegionCoords);
	
	//获取所有景区
	public List<ProvinceRegionCoords> queryRegionsTags(ProvinceRegionCoords provinceRegionCoords);
	
	//重置景区中心坐标点
	public ProvinceRegionCoords uptRegionLnglat(ProvinceRegionCoords regionCfg);
	
	public void uptRegionCoordsList(ProvinceRegionCoords provinceRegionCoords);
	
	public List<ProvinceRegionCoords> queryRegionCfgByCityCode(ProvinceRegionCoords provinceRegionCoords);

}