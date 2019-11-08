package com.funo.businessregioncfg.dao;

import java.util.List;

import com.funo.base.dao.CommonDao;
import com.funo.businessregioncfg.model.BusinessRegionCfg;

public interface IBusinessRegionCfgDao extends CommonDao<BusinessRegionCfg> {
	
	public List<BusinessRegionCfg> queryByBusinessRegionForCity(BusinessRegionCfg businessRegionCfg);

}