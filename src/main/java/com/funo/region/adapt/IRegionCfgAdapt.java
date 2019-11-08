package com.funo.region.adapt;

import java.util.List;

import com.funo.region.model.Areas;
import com.funo.region.model.Provinces;
import com.funo.region.model.RegionCfg;


public interface IRegionCfgAdapt {

	public String getKey();

	public RegionCfg createRegionCfg(RegionCfg regionCfg);

	public RegionCfg modifyRegionCfg(RegionCfg regionCfg);

	public void deleteRegionCfg(RegionCfg regionCfg);

	public void batchDeleteRegionCfg(List<RegionCfg> regionCfgList);

	public RegionCfg getRegionCfgById(String unid);
	
	public RegionCfg getBySendareaId(String sendareaId);

	public List<RegionCfg> queryRegionCfg(RegionCfg regionCfg);
	
	public List<RegionCfg> queryBySeq();
		
	public RegionCfg uptRegionLnglat(RegionCfg regionCfg);
	
	//省平台获取登入平台用户景区权限
	public List<RegionCfg> queryRegionCfgOfcityUser(RegionCfg regionCfg);
	
	public List<RegionCfg> queryByCountyid(RegionCfg regionCfg);
	public List<RegionCfg> queryByUserOfCities(RegionCfg regionCfg);
	public List<RegionCfg> queryByUserOfCounty(RegionCfg regionCfg);
	public List<RegionCfg> queryRegionIdUpdate(RegionCfg regionCfg);
	
	public List<Areas>  queryByCityid(String cityid);
	public List<Areas>  queryByCounty(String countyid);
	public List<Areas>  queryBycityName(String cityName);
	public List<Areas>  queryByOperator(RegionCfg qRegionCfg);
	public List<Provinces> queryByOtherOfProvince();
}