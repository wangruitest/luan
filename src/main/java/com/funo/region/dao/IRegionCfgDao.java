package com.funo.region.dao;

import java.util.List;

import com.funo.base.dao.CommonDao;
import com.funo.region.model.Areas;
import com.funo.region.model.Provinces;
import com.funo.region.model.RegionCfg;

public interface IRegionCfgDao extends CommonDao<RegionCfg> {

	public List<RegionCfg> queryBySeq();
	
	public RegionCfg updateByRegionLnglat(RegionCfg regionCfg);
	
	public List<RegionCfg> queryByUserOfCity(RegionCfg regionCfg);
	
	public RegionCfg getBySendareaId(String sendareaId);
	//根据城市CODES和商户CODES获取景区信息
	public List<RegionCfg> queryByUserOfCities(RegionCfg regionCfg);
	public List<RegionCfg> queryByUserOfCounty(RegionCfg regionCfg);
	public List<RegionCfg> queryByCountyid(RegionCfg regionCfg);
	//修改时验证景区id是否重复
	public List<RegionCfg> queryByUnidRegionIdUpdate(RegionCfg regionCfg);
	
	public List<Areas>  queryByCityid(String cityid);
	public List<Areas>  queryByCounty(String countyid);
	public List<Areas>  queryBycityName(String cityName);
	public List<Areas>  queryByOperator(RegionCfg qRegionCfg);
	public List<Provinces> queryByOtherOfProvince();
}