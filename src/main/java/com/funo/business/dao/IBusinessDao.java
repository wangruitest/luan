package com.funo.business.dao;

import java.util.List;

import com.funo.base.dao.CommonDao;
import com.funo.business.model.Business;


public interface IBusinessDao extends CommonDao<Business> {
	
	public List<Business> queryByInsertIsExist(Business business);
	
	public List<Business> queryByUpdateIsExist(Business business);
	
	public List<Business> queryBySeq();
	
	public List<Business> queryBySelectForWebS(Business business);

}