package com.funo.provincebusiness.mgmt;

import java.util.List;

import com.funo.provincebusiness.model.BusinessGw;

public interface IBusinessGwMgmt {

	public String getKey();

	public BusinessGw createBusinessGw(BusinessGw businessGw);

	public BusinessGw modifyBusinessGw(BusinessGw businessGw);

	public void deleteBusinessGw(BusinessGw businessGw);

	public void batchDeleteBusinessGw(List<BusinessGw> businessGwList);

	public BusinessGw getBusinessGwById(String unid);

	public List<BusinessGw> queryBusinessGw(BusinessGw businessGw);

}