package com.funo.provinceregioncoords.adapt;

import java.util.List;

import com.funo.provinceregioncoords.model.ProvinceRegionCoords;


public interface IProvinceRegionCoordsAdapt {

	public String getKey();

	public ProvinceRegionCoords createProvinceRegionCoords(ProvinceRegionCoords provinceRegionCoords);

	public ProvinceRegionCoords modifyProvinceRegionCoords(ProvinceRegionCoords provinceRegionCoords);

	public void deleteProvinceRegionCoords(ProvinceRegionCoords provinceRegionCoords);

	public void batchDeleteProvinceRegionCoords(List<ProvinceRegionCoords> provinceRegionCoordsList);

	public ProvinceRegionCoords getProvinceRegionCoordsById(String unid);

	public List<ProvinceRegionCoords> queryProvinceRegionCoords(ProvinceRegionCoords provinceRegionCoords);
	
	public List<ProvinceRegionCoords> queryRegionsTags(ProvinceRegionCoords provinceRegionCoords);
	
	public ProvinceRegionCoords uptRegionLnglat(ProvinceRegionCoords regionCfg);
	
	public List<ProvinceRegionCoords> queryRegionCfgByCityCode(ProvinceRegionCoords provinceRegionCoords);

}