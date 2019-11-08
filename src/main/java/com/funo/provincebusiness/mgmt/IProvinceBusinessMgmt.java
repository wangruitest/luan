package com.funo.provincebusiness.mgmt;

import java.util.List;

import com.funo.base.vo.Result;
import com.funo.provincebusiness.model.ProvinceBusiness;
import com.funo.provincebusiness.model.ProvinceBusinessQueryObj;


public interface IProvinceBusinessMgmt {

	public String getKey();

	public ProvinceBusiness createProvinceBusiness(ProvinceBusiness provinceBusiness);

	public ProvinceBusiness modifyProvinceBusiness(ProvinceBusiness provinceBusiness);

	public void deleteProvinceBusiness(ProvinceBusiness provinceBusiness);

	public void batchDeleteProvinceBusiness(List<ProvinceBusiness> provinceBusinessList);

	public ProvinceBusiness getProvinceBusinessById(String unid);

	public List<ProvinceBusiness> queryProvinceBusiness(ProvinceBusiness provinceBusiness);

	public List<ProvinceBusiness> queryByInsertIsExist(ProvinceBusiness business);

	public Result<ProvinceBusiness> pageQueryProvinceBusiness(ProvinceBusinessQueryObj businessobj);

	public List<ProvinceBusiness> queryByUpdateIsExist(ProvinceBusiness business);

}