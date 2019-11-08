package com.funo.business.mgmt;

import java.util.List;

import com.funo.base.vo.Result;
import com.funo.business.model.Business;
import com.funo.business.model.BusinessQueryObj;
import com.funo.system.model.SysOperator;



public interface IBusinessMgmt {

	public String getKey();

	public Business createBusiness(Business business,String loginUser);
	
	public Business createBusinessForWebS(Business business,SysOperator sysOperator);
	
	public Business updateBusinessForWebS(Business business,SysOperator sysOperator);

	public Business modifyBusiness(Business business,String loginUser);

	public void deleteBusiness(Business business);

	public void batchDeleteBusiness(List<Business> businessList);

	public Business getBusinessById(String unid);

	public List<Business> queryBusiness(Business business);
	
	public List<Business> queryByInsertIsExist(Business Business);
	
	public List<Business> queryByUpdateIsExist(Business Business);
	
	public Result<Business> pageQueryBusiness(BusinessQueryObj queryObj);
	
	public List<Business> queryBySeq();
	
	public List<Business> queryByIsExistForWebService(Business Business);
}