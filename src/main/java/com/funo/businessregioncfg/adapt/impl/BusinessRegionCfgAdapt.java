package com.funo.businessregioncfg.adapt.impl;

import java.util.List;

import com.funo.base.adapt.BaseAdapt;
import com.funo.businessregioncfg.dao.IBusinessRegionCfgDao;
import com.funo.businessregioncfg.adapt.IBusinessRegionCfgAdapt;
import com.funo.businessregioncfg.model.BusinessRegionCfg;

public class BusinessRegionCfgAdapt extends BaseAdapt implements IBusinessRegionCfgAdapt {

	private static final long serialVersionUID = 1L;
	private IBusinessRegionCfgDao businessRegionCfgDao;
	
	public IBusinessRegionCfgDao getBusinessRegionCfgDao() {
		return businessRegionCfgDao;
	}

	public void setBusinessRegionCfgDao(IBusinessRegionCfgDao businessRegionCfgDao) {
		this.businessRegionCfgDao = businessRegionCfgDao;
	}

	public String getKey() {
		return businessRegionCfgDao.getKey();
	}

	public BusinessRegionCfg createBusinessRegionCfg(BusinessRegionCfg businessRegionCfg) {
		businessRegionCfgDao.create(businessRegionCfg);
		return businessRegionCfg;
	}

	public BusinessRegionCfg modifyBusinessRegionCfg(BusinessRegionCfg businessRegionCfg) {
		businessRegionCfgDao.update(businessRegionCfg);
		return businessRegionCfg;
	}

	public void deleteBusinessRegionCfg(BusinessRegionCfg businessRegionCfg) {
		businessRegionCfgDao.delete(businessRegionCfg);
	}

	public void batchDeleteBusinessRegionCfg(List<BusinessRegionCfg> businessRegionCfgList) {
		businessRegionCfgDao.batchCreate(businessRegionCfgList);
	}

	public BusinessRegionCfg getBusinessRegionCfgById(String businessRegionCfgId) {
		return businessRegionCfgDao.getById(businessRegionCfgId);
	}

	public List<BusinessRegionCfg> queryBusinessRegionCfg(BusinessRegionCfg businessRegionCfg) {
		return businessRegionCfgDao.queryByArgs(businessRegionCfg);
	}
	
	public List<BusinessRegionCfg> queryBusinessRegionForCityCfg(BusinessRegionCfg businessRegionCfg) {
		return businessRegionCfgDao.queryByBusinessRegionForCity(businessRegionCfg);
	}
	
}