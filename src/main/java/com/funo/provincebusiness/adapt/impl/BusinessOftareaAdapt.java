package com.funo.provincebusiness.adapt.impl;

import java.util.List;

import com.funo.base.adapt.BaseAdapt;
import com.funo.provincebusiness.dao.IBusinessOftareaDao;
import com.funo.provincebusiness.adapt.IBusinessOftareaAdapt;
import com.funo.provincebusiness.model.BusinessOftarea;

public class BusinessOftareaAdapt extends BaseAdapt implements IBusinessOftareaAdapt {

	private static final long serialVersionUID = 1L;
	private IBusinessOftareaDao businessOftareaDao;
	
	public IBusinessOftareaDao getBusinessOftareaDao() {
		return businessOftareaDao;
	}

	public void setBusinessOftareaDao(IBusinessOftareaDao businessOftareaDao) {
		this.businessOftareaDao = businessOftareaDao;
	}

	public String getKey() {
		return businessOftareaDao.getKey();
	}

	public BusinessOftarea createBusinessOftarea(BusinessOftarea businessOftarea) {
		businessOftareaDao.create(businessOftarea);
		return businessOftarea;
	}

	public BusinessOftarea modifyBusinessOftarea(BusinessOftarea businessOftarea) {
		businessOftareaDao.update(businessOftarea);
		return businessOftarea;
	}

	public void deleteBusinessOftarea(BusinessOftarea businessOftarea) {
		businessOftareaDao.delete(businessOftarea);
	}

	public void batchDeleteBusinessOftarea(List<BusinessOftarea> businessOftareaList) {
		businessOftareaDao.batchCreate(businessOftareaList);
	}

	public BusinessOftarea getBusinessOftareaById(String businessOftareaId) {
		return businessOftareaDao.getById(businessOftareaId);
	}

	public List<BusinessOftarea> queryBusinessOftarea(BusinessOftarea businessOftarea) {
		return businessOftareaDao.queryByArgs(businessOftarea);
	}
	
}