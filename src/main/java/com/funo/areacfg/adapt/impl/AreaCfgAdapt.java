package com.funo.areacfg.adapt.impl;

import java.util.List;

import com.funo.base.adapt.BaseAdapt;
import com.funo.areacfg.dao.IAreaCfgDao;
import com.funo.areacfg.adapt.IAreaCfgAdapt;
import com.funo.areacfg.model.AreaCfg;

public class AreaCfgAdapt extends BaseAdapt implements IAreaCfgAdapt {

	private static final long serialVersionUID = 1L;
	private IAreaCfgDao areaCfgDao;
	
	public IAreaCfgDao getAreaCfgDao() {
		return areaCfgDao;
	}

	public void setAreaCfgDao(IAreaCfgDao areaCfgDao) {
		this.areaCfgDao = areaCfgDao;
	}

	public String getKey() {
		return areaCfgDao.getKey();
	}

	public AreaCfg createAreaCfg(AreaCfg areaCfg) {
		areaCfgDao.create(areaCfg);
		return areaCfg;
	}

	public AreaCfg modifyAreaCfg(AreaCfg areaCfg) {
		areaCfgDao.update(areaCfg);
		return areaCfg;
	}

	public void deleteAreaCfg(AreaCfg areaCfg) {
		areaCfgDao.delete(areaCfg);
	}

	public void batchDeleteAreaCfg(List<AreaCfg> areaCfgList) {
		areaCfgDao.batchCreate(areaCfgList);
	}

	public AreaCfg getAreaCfgById(String areaCfgId) {
		return areaCfgDao.getById(areaCfgId);
	}

	public List<AreaCfg> queryAreaCfg(AreaCfg areaCfg) {
		return areaCfgDao.queryByArgs(areaCfg);
	}
	
}