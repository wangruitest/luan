package com.funo.provincebusiness.adapt.impl;

import java.util.List;

import com.funo.base.adapt.BaseAdapt;
import com.funo.provincebusiness.dao.IBusinessGwDao;
import com.funo.provincebusiness.adapt.IBusinessGwAdapt;
import com.funo.provincebusiness.model.BusinessGw;

public class BusinessGwAdapt extends BaseAdapt implements IBusinessGwAdapt {

	private static final long serialVersionUID = 1L;
	private IBusinessGwDao businessGwDao;
	
	public IBusinessGwDao getBusinessGwDao() {
		return businessGwDao;
	}

	public void setBusinessGwDao(IBusinessGwDao businessGwDao) {
		this.businessGwDao = businessGwDao;
	}

	public String getKey() {
		return businessGwDao.getKey();
	}

	public BusinessGw createBusinessGw(BusinessGw businessGw) {
		businessGwDao.create(businessGw);
		return businessGw;
	}

	public BusinessGw modifyBusinessGw(BusinessGw businessGw) {
		businessGwDao.update(businessGw);
		return businessGw;
	}

	public void deleteBusinessGw(BusinessGw businessGw) {
		businessGwDao.delete(businessGw);
	}

	public void batchDeleteBusinessGw(List<BusinessGw> businessGwList) {
		businessGwDao.batchCreate(businessGwList);
	}

	public BusinessGw getBusinessGwById(String businessGwId) {
		return businessGwDao.getById(businessGwId);
	}

	public List<BusinessGw> queryBusinessGw(BusinessGw businessGw) {
		return businessGwDao.queryByArgs(businessGw);
	}
	
}