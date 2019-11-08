package com.funo.business.adapt;

import java.util.List;

import com.funo.base.vo.Result;
import com.funo.business.model.Business;
import com.funo.business.model.BusinessQueryObj;


public interface IBusinessAdapt {

	public String getKey();

	public Business createBusiness(Business business);

	public Business modifyBusiness(Business business);

	public void deleteBusiness(Business business);

	public void batchDeleteBusiness(List<Business> businessList);

	public Business getBusinessById(String unid);

	public List<Business> queryBusiness(Business business);
	public List<Business> queryByInsertIsExist(Business business);
	public List<Business> queryByUpdateBusinessesIsExist(Business business);
	public List<Business> queryBySeq();
	public Result<Business> pageQueryBusiness(BusinessQueryObj businessobj);
	public List<Business> queryByIsExistForWebService(Business business);

}