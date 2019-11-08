package com.funo.provinceregioncfg.adapt.impl;

import java.util.List;

import com.funo.base.adapt.BaseAdapt;
import com.funo.provinceregioncfg.dao.IProvinceRegionCfgDao;
import com.funo.provinceregioncfg.adapt.IProvinceRegionCfgAdapt;
import com.funo.provinceregioncfg.model.ProvinceRegionCfg;

public class ProvinceRegionCfgAdapt extends BaseAdapt implements IProvinceRegionCfgAdapt {

	private static final long serialVersionUID = 1L;
	private IProvinceRegionCfgDao provinceRegionCfgDao;
	
	public IProvinceRegionCfgDao getProvinceRegionCfgDao() {
		return provinceRegionCfgDao;
	}

	public void setProvinceRegionCfgDao(IProvinceRegionCfgDao provinceRegionCfgDao) {
		this.provinceRegionCfgDao = provinceRegionCfgDao;
	}

	public String getKey() {
		return provinceRegionCfgDao.getKey();
	}

	public ProvinceRegionCfg createProvinceRegionCfg(ProvinceRegionCfg provinceRegionCfg) {
		provinceRegionCfgDao.create(provinceRegionCfg);
		return provinceRegionCfg;
	}

	public ProvinceRegionCfg modifyProvinceRegionCfg(ProvinceRegionCfg provinceRegionCfg) {
		provinceRegionCfgDao.update(provinceRegionCfg);
		return provinceRegionCfg;
	}

	public void deleteProvinceRegionCfg(ProvinceRegionCfg provinceRegionCfg) {
		provinceRegionCfgDao.delete(provinceRegionCfg);
	}

	public void batchDeleteProvinceRegionCfg(List<ProvinceRegionCfg> provinceRegionCfgList) {
		provinceRegionCfgDao.batchCreate(provinceRegionCfgList);
	}

	public ProvinceRegionCfg getProvinceRegionCfgById(String provinceRegionCfgId) {
		return provinceRegionCfgDao.getById(provinceRegionCfgId);
	}

	public List<ProvinceRegionCfg> queryProvinceRegionCfg(ProvinceRegionCfg provinceRegionCfg) {
		return provinceRegionCfgDao.queryByArgs(provinceRegionCfg);
	}
	
}