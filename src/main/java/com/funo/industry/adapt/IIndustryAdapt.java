package com.funo.industry.adapt;

import java.util.List;

import com.funo.industry.model.Industry;


public interface IIndustryAdapt {

	public String getKey();

	public Industry createIndustry(Industry industry);

	public Industry modifyIndustry(Industry industry);

	public void deleteIndustry(Industry industry);

	public void batchDeleteIndustry(List<Industry> industryList);

	public Industry getIndustryById(String unid);

	public List<Industry> queryIndustry(Industry industry);
	
	public List<Industry> queryByInsertIsExist(Industry industry);
	
	public List<Industry> queryByUpdateIsExist(Industry industry);

}