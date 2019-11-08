package com.funo.industry.mgmt.impl;

import java.util.List;

import com.funo.base.mgmt.BaseMgmt;
import com.funo.industry.adapt.IIndustryAdapt;
import com.funo.industry.mgmt.IIndustryMgmt;
import com.funo.industry.model.Industry;

public class IndustryMgmt extends BaseMgmt implements IIndustryMgmt {

	private static final long serialVersionUID = 1L;
	private IIndustryAdapt industryAdapt;
	
	public IIndustryAdapt getIndustryAdapt() {
		return industryAdapt;
	}
	public void setIndustryAdapt(IIndustryAdapt industryAdapt) {
		this.industryAdapt = industryAdapt;
	}

	public String getKey() {
		return industryAdapt.getKey();
	}

	public Industry createIndustry(Industry industry) {
		industryAdapt.createIndustry(industry);
		return industry;
	}

	public Industry modifyIndustry(Industry industry) {
		industryAdapt.modifyIndustry(industry);
		return industry;
	}

	public void deleteIndustry(Industry industry) {
		industryAdapt.deleteIndustry(industry);
	}

	public void batchDeleteIndustry(List<Industry> industryList) {
		industryAdapt.batchDeleteIndustry(industryList);
	}

	public Industry getIndustryById(String industryId) {
		return industryAdapt.getIndustryById(industryId);
	}

	public List<Industry> queryIndustry(Industry industry) {
		return industryAdapt.queryIndustry(industry);
	}
	public List<Industry> queryByInsertIsExist(Industry industry) {
		return industryAdapt.queryByInsertIsExist(industry);
	}
	public List<Industry> queryByUpdateIsExist(Industry industry) {
		return industryAdapt.queryByUpdateIsExist(industry);
	}
	
}