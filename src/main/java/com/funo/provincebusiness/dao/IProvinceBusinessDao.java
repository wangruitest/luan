package com.funo.provincebusiness.dao;

import java.util.List;

import com.funo.base.dao.CommonDao;
import com.funo.provincebusiness.model.ProvinceBusiness;

public interface IProvinceBusinessDao extends CommonDao<ProvinceBusiness> {
	
	public List<ProvinceBusiness> queryByInsertIsExist(ProvinceBusiness business);
	
	public List<ProvinceBusiness> queryByUpdateIsExist(ProvinceBusiness business);
	
	public List<ProvinceBusiness> queryBySeq();
}