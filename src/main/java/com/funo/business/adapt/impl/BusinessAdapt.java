package com.funo.business.adapt.impl;

import java.util.List;

import com.funo.base.adapt.BaseAdapt;
import com.funo.base.vo.Result;
import com.funo.business.dao.IBusinessDao;
import com.funo.business.adapt.IBusinessAdapt;
import com.funo.business.model.Business;
import com.funo.business.model.BusinessQueryObj;

public class BusinessAdapt extends BaseAdapt implements IBusinessAdapt {

	private static final long serialVersionUID = 1L;
	private IBusinessDao businessDao;
	
	public IBusinessDao getBusinessDao() {
		return businessDao;
	}

	public void setBusinessDao(IBusinessDao businessDao) {
		this.businessDao = businessDao;
	}

	public String getKey() {
		return businessDao.getKey();
	}

	public Business createBusiness(Business business) {
		businessDao.create(business);
		return business;
	}

	public Business modifyBusiness(Business business) {
		businessDao.update(business);
		return business;
	}

	public void deleteBusiness(Business business) {
		businessDao.delete(business);
	}

	public void batchDeleteBusiness(List<Business> businessList) {
		businessDao.batchCreate(businessList);
	}

	public Business getBusinessById(String businessId) {
		return businessDao.getById(businessId);
	}

	public List<Business> queryBusiness(Business business) {
		return businessDao.queryByArgs(business);
	}

	@Override
	public List<Business> queryByInsertIsExist(Business business) {
	
		return businessDao.queryByInsertIsExist(business);
	}

	@Override
	public List<Business> queryByUpdateBusinessesIsExist(Business business) {
		
		return businessDao.queryByUpdateIsExist(business);
	}
	
	@Override
	public List<Business> queryByIsExistForWebService(Business business) {
		
		return businessDao.queryBySelectForWebS(business);
	}

	@Override
	public List<Business> queryBySeq() {
		
		return businessDao.queryBySeq();
	}

	@Override
	public Result<Business> pageQueryBusiness(BusinessQueryObj businessobj) {
	
		return businessDao.pageCountByArgs(businessobj);
	}
	
}