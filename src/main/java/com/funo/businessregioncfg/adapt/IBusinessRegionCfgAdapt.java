package com.funo.businessregioncfg.adapt;

import java.util.List;

import com.funo.businessregioncfg.model.BusinessRegionCfg;


public interface IBusinessRegionCfgAdapt {

	public String getKey();

	public BusinessRegionCfg createBusinessRegionCfg(BusinessRegionCfg businessRegionCfg);

	public BusinessRegionCfg modifyBusinessRegionCfg(BusinessRegionCfg businessRegionCfg);

	public void deleteBusinessRegionCfg(BusinessRegionCfg businessRegionCfg);

	public void batchDeleteBusinessRegionCfg(List<BusinessRegionCfg> businessRegionCfgList);

	public BusinessRegionCfg getBusinessRegionCfgById(String unid);

	public List<BusinessRegionCfg> queryBusinessRegionCfg(BusinessRegionCfg businessRegionCfg);
	
	public List<BusinessRegionCfg> queryBusinessRegionForCityCfg(BusinessRegionCfg businessRegionCfg);

}