package com.funo.industry.dao;

import java.util.List;

import com.funo.base.dao.CommonDao;
import com.funo.industry.model.Industry;

public interface IIndustryDao extends CommonDao<Industry> {
	
	List<Industry> queryByInsertIsExist(Industry industry);
	
	List<Industry> queryByUpdateIsExist(Industry industry);

}