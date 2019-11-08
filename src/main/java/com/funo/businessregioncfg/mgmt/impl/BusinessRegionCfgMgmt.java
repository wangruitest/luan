package com.funo.businessregioncfg.mgmt.impl;

import java.util.Date;
import java.util.List;

import com.funo.base.mgmt.BaseMgmt;
import com.funo.businessregioncfg.adapt.IBusinessRegionCfgAdapt;
import com.funo.businessregioncfg.mgmt.IBusinessRegionCfgMgmt;
import com.funo.businessregioncfg.model.BusinessRegionCfg;

public class BusinessRegionCfgMgmt extends BaseMgmt implements IBusinessRegionCfgMgmt {

	private static final long serialVersionUID = 1L;
	private IBusinessRegionCfgAdapt businessRegionCfgAdapt;
	
	public IBusinessRegionCfgAdapt getBusinessRegionCfgAdapt() {
		return businessRegionCfgAdapt;
	}
	public void setBusinessRegionCfgAdapt(IBusinessRegionCfgAdapt businessRegionCfgAdapt) {
		this.businessRegionCfgAdapt = businessRegionCfgAdapt;
	}

	public String getKey() {
		return businessRegionCfgAdapt.getKey();
	}

	public BusinessRegionCfg createBusinessRegionCfg(BusinessRegionCfg businessRegionCfg) {
		businessRegionCfgAdapt.createBusinessRegionCfg(businessRegionCfg);
		return businessRegionCfg;
	}

	public BusinessRegionCfg modifyBusinessRegionCfg(BusinessRegionCfg businessRegionCfg) {
		businessRegionCfgAdapt.modifyBusinessRegionCfg(businessRegionCfg);
		return businessRegionCfg;
	}

	public void deleteBusinessRegionCfg(BusinessRegionCfg businessRegionCfg) {
		businessRegionCfgAdapt.deleteBusinessRegionCfg(businessRegionCfg);
	}

	public void batchDeleteBusinessRegionCfg(List<BusinessRegionCfg> businessRegionCfgList) {
		businessRegionCfgAdapt.batchDeleteBusinessRegionCfg(businessRegionCfgList);
	}

	public BusinessRegionCfg getBusinessRegionCfgById(String businessRegionCfgId) {
		return businessRegionCfgAdapt.getBusinessRegionCfgById(businessRegionCfgId);
	}

	public List<BusinessRegionCfg> queryBusinessRegionCfg(BusinessRegionCfg businessRegionCfg) {
		return businessRegionCfgAdapt.queryBusinessRegionCfg(businessRegionCfg);
	}
	
	public List<BusinessRegionCfg> queryBusinessRegionForCityCfg(BusinessRegionCfg businessRegionCfg) {
		return businessRegionCfgAdapt.queryBusinessRegionForCityCfg(businessRegionCfg);
	}
	
	public void createBusinessRegionCfgBatch(String businessids,String regions,String createuser) {
		String[] businessidsArray = businessids.split(",");
		String[] regionsArray = regions.split(",");
		BusinessRegionCfg businessRegionCfg = null;
		for (int i=0;i<businessidsArray.length;i++) {
			businessRegionCfg = new BusinessRegionCfg();
			businessRegionCfg.setBusinessid(Long.parseLong(businessidsArray[i]));
			businessRegionCfgAdapt.deleteBusinessRegionCfg(businessRegionCfg);
			if(regions.equals("")){
				
			}else{
				for (int j=0;j<regionsArray.length;j++) {
					businessRegionCfg = new BusinessRegionCfg();
					String cityid = regionsArray[j].substring(0, 6);
					String regionCfgid = regionsArray[j].substring(6);
					businessRegionCfg.setCreateDate(new Date());
					businessRegionCfg.setCreateUser(createuser);
					businessRegionCfg.setRegionCfgId(Long.parseLong(regionCfgid));
					businessRegionCfg.setBusinessid(Long.parseLong(businessidsArray[i]));
					businessRegionCfg.setCityid(cityid);
					businessRegionCfgAdapt.createBusinessRegionCfg(businessRegionCfg);
				}
			}
		}
	}
	
}