package com.funo.basecommon.adapt.impl;

import java.util.List;
import java.util.Map;

import com.funo.base.adapt.BaseAdapt;
import com.funo.basecommon.dao.ICommonDao;
import com.funo.basecommon.adapt.ICommonAdapt;
import com.funo.basecommon.model.Common;

public class CommonAdapt extends BaseAdapt implements ICommonAdapt {

	private static final long serialVersionUID = 1L;
	private ICommonDao commonDao;
	
	public ICommonDao getCommonDao() {
		return commonDao;
	}

	public void setCommonDao(ICommonDao commonDao) {
		this.commonDao = commonDao;
	}

	public String getKey() {
		return commonDao.getKey();
	}

	public Common createCommon(Common common) {
		commonDao.create(common);
		return common;
	}

	public Common modifyCommon(Common common) {
		commonDao.update(common);
		return common;
	}

	public void deleteCommon(Common common) {
		commonDao.delete(common);
	}

	public void batchDeleteCommon(List<Common> commonList) {
		commonDao.batchCreate(commonList);
	}

	public Common getCommonById(String commonId) {
		return commonDao.getById(commonId);
	}

	public List<Common> queryCommon(Common common) {
		return commonDao.queryByArgs(common);
	}
	public Map<String,String> queryForMap(){
		return commonDao.queryForMap();
	}
	public void updateBySql(Common common){
		commonDao.updateBySql(common);
	}
	public void updateBy618Set(Common common){
		commonDao.updateBy618Set(common);
	}
}