package com.funo.provincebusiness.mgmt.impl;

import java.util.List;

import com.funo.base.mgmt.BaseMgmt;
import com.funo.provincebusiness.adapt.IBusinessGwAdapt;
import com.funo.provincebusiness.mgmt.IBusinessGwMgmt;
import com.funo.provincebusiness.model.BusinessGw;

public class BusinessGwMgmt extends BaseMgmt implements IBusinessGwMgmt {

	private static final long serialVersionUID = 1L;
	private IBusinessGwAdapt businessGwAdapt;
	
	public IBusinessGwAdapt getBusinessGwAdapt() {
		return businessGwAdapt;
	}
	public void setBusinessGwAdapt(IBusinessGwAdapt businessGwAdapt) {
		this.businessGwAdapt = businessGwAdapt;
	}

	public String getKey() {
		return businessGwAdapt.getKey();
	}

	public BusinessGw createBusinessGw(BusinessGw businessGw) {
		businessGwAdapt.createBusinessGw(businessGw);
		return businessGw;
	}

	public BusinessGw modifyBusinessGw(BusinessGw businessGw) {
		businessGwAdapt.modifyBusinessGw(businessGw);
		return businessGw;
	}

	public void deleteBusinessGw(BusinessGw businessGw) {
		businessGwAdapt.deleteBusinessGw(businessGw);
	}

	public void batchDeleteBusinessGw(List<BusinessGw> businessGwList) {
		businessGwAdapt.batchDeleteBusinessGw(businessGwList);
	}

	public BusinessGw getBusinessGwById(String businessGwId) {
		return businessGwAdapt.getBusinessGwById(businessGwId);
	}

	public List<BusinessGw> queryBusinessGw(BusinessGw businessGw) {
		return businessGwAdapt.queryBusinessGw(businessGw);
	}
	
}