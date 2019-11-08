package com.funo.businessregioncfg.mgmt;

import java.util.List;

import com.funo.businessregioncfg.model.BusinessRegionCfg;


public interface IBusinessRegionCfgMgmt {

	public String getKey();

	public BusinessRegionCfg createBusinessRegionCfg(BusinessRegionCfg businessRegionCfg);

	public BusinessRegionCfg modifyBusinessRegionCfg(BusinessRegionCfg businessRegionCfg);

	public void deleteBusinessRegionCfg(BusinessRegionCfg businessRegionCfg);

	public void batchDeleteBusinessRegionCfg(List<BusinessRegionCfg> businessRegionCfgList);

	public BusinessRegionCfg getBusinessRegionCfgById(String unid);

	public List<BusinessRegionCfg> queryBusinessRegionCfg(BusinessRegionCfg businessRegionCfg);
	
	public void createBusinessRegionCfgBatch(String businessids,String regions,String createuser);
	
	public List<BusinessRegionCfg> queryBusinessRegionForCityCfg(BusinessRegionCfg businessRegionCfg);

}