package com.funo.region.adapt.impl;

import java.util.List;

import com.funo.base.adapt.BaseAdapt;
import com.funo.region.dao.IRegionCfgDao;
import com.funo.region.adapt.IRegionCfgAdapt;
import com.funo.region.model.Areas;
import com.funo.region.model.Provinces;
import com.funo.region.model.RegionCfg;

public class RegionCfgAdapt extends BaseAdapt implements IRegionCfgAdapt {

	private static final long serialVersionUID = 1L;
	private IRegionCfgDao regionCfgDao;
	
	public IRegionCfgDao getRegionCfgDao() {
		return regionCfgDao;
	}

	public void setRegionCfgDao(IRegionCfgDao regionCfgDao) {
		this.regionCfgDao = regionCfgDao;
	}

	public String getKey() {
		return regionCfgDao.getKey();
	}

	public RegionCfg createRegionCfg(RegionCfg regionCfg) {
		regionCfgDao.create(regionCfg);
		return regionCfg;
	}

	public RegionCfg modifyRegionCfg(RegionCfg regionCfg) {
		regionCfgDao.update(regionCfg);
		return regionCfg;
	}

	public void deleteRegionCfg(RegionCfg regionCfg) {
		regionCfgDao.delete(regionCfg);
	}

	public void batchDeleteRegionCfg(List<RegionCfg> regionCfgList) {
		regionCfgDao.batchCreate(regionCfgList);
	}

	public RegionCfg getRegionCfgById(String regionCfgId) {
		return regionCfgDao.getById(regionCfgId);
	}
	
	public RegionCfg getBySendareaId(String sendareaId) {
		return regionCfgDao.getBySendareaId(sendareaId);
	}

	public List<RegionCfg> queryRegionCfg(RegionCfg regionCfg) {
		return regionCfgDao.queryByArgs(regionCfg);
	}
	public List<RegionCfg> queryBySeq(){
		return regionCfgDao.queryBySeq();
	}
	
	public RegionCfg uptRegionLnglat(RegionCfg regionCfg) {
		return regionCfgDao.updateByRegionLnglat(regionCfg);
	}
	
	//省平台获取登入平台用户景区权限
	public List<RegionCfg> queryRegionCfgOfcityUser(RegionCfg regionCfg) {
		return regionCfgDao.queryByUserOfCity(regionCfg);
	}
	
	public List<RegionCfg> queryRegionIdUpdate(RegionCfg regionCfg) {
		return regionCfgDao.queryByUnidRegionIdUpdate(regionCfg);
	}

	@Override
	public List<RegionCfg> queryByUserOfCities(RegionCfg regionCfg) {
		return regionCfgDao.queryByUserOfCities(regionCfg);
	}
	@Override
	public List<RegionCfg> queryByUserOfCounty(RegionCfg regionCfg) {
		// TODO Auto-generated method stub
		return regionCfgDao.queryByUserOfCounty(regionCfg);
	}

	@Override
	public List<Areas> queryByCityid(String cityid) {
		return regionCfgDao.queryByCityid(cityid);
	}

	@Override
	public List<Areas> queryBycityName(String cityName) {
		return regionCfgDao.queryBycityName(cityName);
	}

	@Override
	public List<RegionCfg> queryByCountyid(RegionCfg regionCfg) {
		return regionCfgDao.queryByCountyid(regionCfg);
	}

	@Override
	public List<Areas> queryByCounty(String countyid) {
		return regionCfgDao.queryByCounty(countyid);
	}

	@Override
	public List<Areas> queryByOperator(RegionCfg qRegionCfg) {
		return regionCfgDao.queryByOperator(qRegionCfg);
	}

	@Override
	public List<Provinces> queryByOtherOfProvince() {
		return regionCfgDao.queryByOtherOfProvince();
	}
}