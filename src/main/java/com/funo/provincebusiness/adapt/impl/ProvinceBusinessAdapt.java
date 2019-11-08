package com.funo.provincebusiness.adapt.impl;

import java.util.List;

import com.funo.base.adapt.BaseAdapt;
import com.funo.base.vo.Result;
import com.funo.provincebusiness.dao.IProvinceBusinessDao;
import com.funo.provincebusiness.adapt.IProvinceBusinessAdapt;
import com.funo.provincebusiness.model.ProvinceBusiness;
import com.funo.provincebusiness.model.ProvinceBusinessQueryObj;

public class ProvinceBusinessAdapt extends BaseAdapt implements IProvinceBusinessAdapt {

	private static final long serialVersionUID = 1L;
	private IProvinceBusinessDao provinceBusinessDao;
	
	public IProvinceBusinessDao getProvinceBusinessDao() {
		return provinceBusinessDao;
	}

	public void setProvinceBusinessDao(IProvinceBusinessDao provinceBusinessDao) {
		this.provinceBusinessDao = provinceBusinessDao;
	}

	public String getKey() {
		return provinceBusinessDao.getKey();
	}

	public ProvinceBusiness createProvinceBusiness(ProvinceBusiness provinceBusiness) {
		provinceBusinessDao.create(provinceBusiness);
		return provinceBusiness;
	}

	public ProvinceBusiness modifyProvinceBusiness(ProvinceBusiness provinceBusiness) {
		provinceBusinessDao.update(provinceBusiness);
		return provinceBusiness;
	}

	public void deleteProvinceBusiness(ProvinceBusiness provinceBusiness) {
		provinceBusinessDao.delete(provinceBusiness);
	}

	public void batchDeleteProvinceBusiness(List<ProvinceBusiness> provinceBusinessList) {
		provinceBusinessDao.batchCreate(provinceBusinessList);
	}

	public ProvinceBusiness getProvinceBusinessById(String provinceBusinessId) {
		return provinceBusinessDao.getById(provinceBusinessId);
	}

	public List<ProvinceBusiness> queryProvinceBusiness(ProvinceBusiness provinceBusiness) {
		return provinceBusinessDao.queryByArgs(provinceBusiness);
	}

	@Override
	public List<ProvinceBusiness> queryBySeq() {
		
		return provinceBusinessDao.queryBySeq();
	}

	@Override
	public List<ProvinceBusiness> queryByInsertIsExist(ProvinceBusiness business) {
		// TODO Auto-generated method stub
		return provinceBusinessDao.queryByInsertIsExist(business);
	}

	@Override
	public List<ProvinceBusiness> queryByUpdateBusinessesIsExist(
			ProvinceBusiness business) {
		// TODO Auto-generated method stub
		return provinceBusinessDao.queryByUpdateIsExist(business);
	}

	@Override
	public Result<ProvinceBusiness> pageQueryProvinceBusiness(
			ProvinceBusinessQueryObj businessobj) {
		// TODO Auto-generated method stub
		return provinceBusinessDao.pageCountByArgs(businessobj);
	}
	
}