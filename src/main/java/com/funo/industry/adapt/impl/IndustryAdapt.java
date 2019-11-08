package com.funo.industry.adapt.impl;

import java.util.List;

import com.funo.base.adapt.BaseAdapt;
import com.funo.industry.dao.IIndustryDao;
import com.funo.industry.adapt.IIndustryAdapt;
import com.funo.industry.model.Industry;

public class IndustryAdapt extends BaseAdapt implements IIndustryAdapt {

	private static final long serialVersionUID = 1L;
	private IIndustryDao industryDao;
	
	public IIndustryDao getIndustryDao() {
		return industryDao;
	}

	public void setIndustryDao(IIndustryDao industryDao) {
		this.industryDao = industryDao;
	}

	public String getKey() {
		return industryDao.getKey();
	}

	public Industry createIndustry(Industry industry) {
		industryDao.create(industry);
		return industry;
	}

	public Industry modifyIndustry(Industry industry) {
		industryDao.update(industry);
		return industry;
	}

	public void deleteIndustry(Industry industry) {
		industryDao.delete(industry);
	}

	public void batchDeleteIndustry(List<Industry> industryList) {
		industryDao.batchCreate(industryList);
	}

	public Industry getIndustryById(String industryId) {
		return industryDao.getById(industryId);
	}

	public List<Industry> queryIndustry(Industry industry) {
		return industryDao.queryByArgs(industry);
	}

	public List<Industry> queryByInsertIsExist(Industry industry) {
		return industryDao.queryByInsertIsExist(industry);
	}

	public List<Industry> queryByUpdateIsExist(Industry industry) {
		return industryDao.queryByUpdateIsExist(industry);
	}
	
}