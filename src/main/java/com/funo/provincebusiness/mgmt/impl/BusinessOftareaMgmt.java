package com.funo.provincebusiness.mgmt.impl;

import java.util.List;

import com.funo.base.mgmt.BaseMgmt;
import com.funo.provincebusiness.adapt.IBusinessOftareaAdapt;
import com.funo.provincebusiness.mgmt.IBusinessOftareaMgmt;
import com.funo.provincebusiness.model.BusinessOftarea;

public class BusinessOftareaMgmt extends BaseMgmt implements IBusinessOftareaMgmt {

	private static final long serialVersionUID = 1L;
	private IBusinessOftareaAdapt businessOftareaAdapt;
	
	public IBusinessOftareaAdapt getBusinessOftareaAdapt() {
		return businessOftareaAdapt;
	}
	public void setBusinessOftareaAdapt(IBusinessOftareaAdapt businessOftareaAdapt) {
		this.businessOftareaAdapt = businessOftareaAdapt;
	}

	public String getKey() {
		return businessOftareaAdapt.getKey();
	}

	public BusinessOftarea createBusinessOftarea(BusinessOftarea businessOftarea) {
		businessOftareaAdapt.createBusinessOftarea(businessOftarea);
		return businessOftarea;
	}

	public BusinessOftarea modifyBusinessOftarea(BusinessOftarea businessOftarea) {
		businessOftareaAdapt.modifyBusinessOftarea(businessOftarea);
		return businessOftarea;
	}

	public void deleteBusinessOftarea(BusinessOftarea businessOftarea) {
		businessOftareaAdapt.deleteBusinessOftarea(businessOftarea);
	}

	public void batchDeleteBusinessOftarea(List<BusinessOftarea> businessOftareaList) {
		businessOftareaAdapt.batchDeleteBusinessOftarea(businessOftareaList);
	}

	public BusinessOftarea getBusinessOftareaById(String businessOftareaId) {
		return businessOftareaAdapt.getBusinessOftareaById(businessOftareaId);
	}

	public List<BusinessOftarea> queryBusinessOftarea(BusinessOftarea businessOftarea) {
		return businessOftareaAdapt.queryBusinessOftarea(businessOftarea);
	}
	
}