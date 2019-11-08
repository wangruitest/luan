package com.funo.business.mgmt.impl;

import java.util.Date;
import java.util.List;

import com.funo.base.mgmt.BaseMgmt;
import com.funo.base.vo.Result;
import com.funo.business.adapt.IBusinessAdapt;
import com.funo.business.mgmt.IBusinessMgmt;
import com.funo.business.model.Business;
import com.funo.business.model.BusinessQueryObj;
import com.funo.system.model.SysOperator;
import com.funo.userbusinesscfg.adapt.IUserBusinessCfgAdapt;
import com.funo.userbusinesscfg.model.UserBusinessCfg;

public class BusinessMgmt extends BaseMgmt implements IBusinessMgmt {

	private static final long serialVersionUID = 1L;
	private IBusinessAdapt businessAdapt;
	private IUserBusinessCfgAdapt userBusinessCfgAdapt;
		
	public IUserBusinessCfgAdapt getUserBusinessCfgAdapt() {
		return userBusinessCfgAdapt;
	}
	public void setUserBusinessCfgAdapt(IUserBusinessCfgAdapt userBusinessCfgAdapt) {
		this.userBusinessCfgAdapt = userBusinessCfgAdapt;
	}
	public IBusinessAdapt getBusinessAdapt() {
		return businessAdapt;
	}
	public void setBusinessAdapt(IBusinessAdapt businessAdapt) {
		this.businessAdapt = businessAdapt;
	}
	
//	public IBusinessSendareaAdapt getBusinessSendareaAdapt() {
//		return businessSendareaAdapt;
//	}
//	public void setBusinessSendareaAdapt(IBusinessSendareaAdapt businessSendareaAdapt) {
//		this.businessSendareaAdapt = businessSendareaAdapt;
//	}
//	
//
//	public IBusinessMasAdapt getBusinessMasAdapt() {
//		return businessMasAdapt;
//	}
//	public void setBusinessMasAdapt(IBusinessMasAdapt businessMasAdapt) {
//		this.businessMasAdapt = businessMasAdapt;
//	}
//	public IMasfzAdapt getMasfzAdapt() {
//		return masfzAdapt;
//	}
//	public void setMasfzAdapt(IMasfzAdapt masfzAdapt) {
//		this.masfzAdapt = masfzAdapt;
//	}
	public String getKey() {
		return businessAdapt.getKey();
	}
	
	public Business createBusiness(Business business,String loginUser) {
		//获取Business的SEQ
		Long id= 0l;
		List<Business> businessesList= businessAdapt.queryBySeq();
		if(null != businessesList) 
			id=((Business)businessesList.get(0)).getBusinessid();
		business.setBusinessid(id);
		//保存Business的数据
		businessAdapt.createBusiness(business);
		//保存用户商户关联关系
		if(null != business.getUserBusinessCfgList() && business.getUserBusinessCfgList().size()>0){
			for (int i = 0; i < business.getUserBusinessCfgList().size(); i++) {
				UserBusinessCfg userBusinessCfg = business.getUserBusinessCfgList().get(i);
				userBusinessCfg.setBusinessId(business.getBusinessid());
				userBusinessCfg.setCreateDate(new Date());
				userBusinessCfg.setCreateUser(loginUser);
				userBusinessCfgAdapt.createUserBusinessCfg(userBusinessCfg);
			}
		}
//		//保存关联常用区域SendareaCfg的数据
//		if(null != business.getBusinessSendareasList()&& business.getBusinessSendareasList().size()>0){
//			for(int i = 0;i<business.getBusinessSendareasList().size();i++){
//				BusinessSendarea businessSedndarea = new BusinessSendarea();
//				businessSedndarea.setBusinessid(business.getBusinessid());
//				businessSedndarea.setSendareaid(business.getBusinessSendareasList().get(i).getId());
//				businessSendareaAdapt.createBusinessSendarea(businessSedndarea);
//			}
//		}
//		//保存关联行业网关MAS的数据
//		if(null != business.getBusinessMasList() && business.getBusinessMasList().size()>0){
//			for (int i = 0; i < business.getBusinessMasList().size(); i++) {
//				BusinessMas businessMas = business.getBusinessMasList().get(i);
//				businessMas.setBusinessid(business.getBusinessid());
//				businessMasAdapt.createBusinessMas(businessMas);
//			}
//		}
		return business;
	}
	
	/**
	 * 商户接口调用创建商户
	 * */
	public Business createBusinessForWebS(Business business,SysOperator sysOperator) {
		UserBusinessCfg userBusinessCfg = new UserBusinessCfg();
		userBusinessCfg.setBusinessId(business.getBusinessid());
		userBusinessCfg.setUserId(sysOperator.getUnid());
		userBusinessCfg.setCreateDate(new Date());
		userBusinessCfg.setCreateUser("WebServices");
		userBusinessCfg.setOperatorname(business.getBusinessname());
		userBusinessCfgAdapt.createUserBusinessCfg(userBusinessCfg);
		
		businessAdapt.createBusiness(business);
		return business;
	}
	
	/**
	 * 商户接口调用修改商户
	 * */
	public Business updateBusinessForWebS(Business business,SysOperator sysOperator) {
		
		businessAdapt.modifyBusiness(business);
		return business;
	}

	public Business modifyBusiness(Business business,String loginUser) {
		//删除UserBusinessCfg表中的属于该条Business的数据
		UserBusinessCfg userBusinessCfg = new UserBusinessCfg();
		userBusinessCfg.setBusinessId(business.getBusinessid());
		userBusinessCfgAdapt.deleteUserBusinessCfg(userBusinessCfg);
//		//删除BusinessSendarea表中的属于该条Business的数据
//		BusinessSendarea delBusinessSendarea = new BusinessSendarea();
//		delBusinessSendarea.setBusinessid(business.getBusinessid());
//		businessSendareaAdapt.deleteBusinessSendarea(delBusinessSendarea);
//		//删除BusinessSendarea表中属于该条Business的数据
//		BusinessMas delBusinessMas = new BusinessMas();
//		delBusinessMas.setBusinessid(business.getBusinessid());
//		businessMasAdapt.deleteBusinessMas(delBusinessMas);
		//保存用户商户关联关系
		if(null != business.getUserBusinessCfgList() && business.getUserBusinessCfgList().size()>0){
			for (int i = 0; i < business.getUserBusinessCfgList().size(); i++) {
				UserBusinessCfg userBusinessCfgEdit = business.getUserBusinessCfgList().get(i);
				userBusinessCfgEdit.setBusinessId(business.getBusinessid());
				userBusinessCfgEdit.setCreateDate(new Date());
				userBusinessCfgEdit.setCreateUser(loginUser);
				userBusinessCfgAdapt.createUserBusinessCfg(userBusinessCfgEdit);
			}
		}
//		//保存关联常用区域SendareaCfg的数据
//		if(null != business.getBusinessSendareasList()&& business.getBusinessSendareasList().size()>0){
//			for(int i = 0;i<business.getBusinessSendareasList().size();i++){
//				BusinessSendarea businessSedndarea2 = new BusinessSendarea();
//				businessSedndarea2.setBusinessid(business.getBusinessid());
//				if(business.getBusinessSendareasList().get(i).getSendareaid()==null){
//					businessSedndarea2.setSendareaid(business.getBusinessSendareasList().get(i).getId());
//				}else{
//					businessSedndarea2.setSendareaid(business.getBusinessSendareasList().get(i).getSendareaid());
//				}				
//				businessSendareaAdapt.createBusinessSendarea(businessSedndarea2);
//			}
//		}
//		//保存关联行业网关MAS的数据
//		if(null != business.getBusinessMasList() && business.getBusinessMasList().size()>0){
//			for (int i = 0; i < business.getBusinessMasList().size(); i++) {
//				BusinessMas businessMas = business.getBusinessMasList().get(i);
//				businessMas.setBusinessid(business.getBusinessid());
//				businessMasAdapt.createBusinessMas(businessMas);
//			}
//		}
		businessAdapt.modifyBusiness(business);
		return business;
	}

	public void deleteBusiness(Business business) {
		//删除用户商户关联表信息配置
		UserBusinessCfg delUserBusinessCfg = new UserBusinessCfg();
		delUserBusinessCfg.setBusinessId(business.getBusinessid());
		userBusinessCfgAdapt.deleteUserBusinessCfg(delUserBusinessCfg);
//		//删除关联的常用区域配置
//		BusinessSendarea delBusinessSendarea = new BusinessSendarea();
//		delBusinessSendarea.setBusinessid(business.getBusinessid());
//		businessSendareaAdapt.deleteBusinessSendarea(delBusinessSendarea);
//		//删除关联的行业网关配置
//		BusinessMas delbBusinessMas = new BusinessMas();
//		delbBusinessMas.setBusinessid(business.getBusinessid());
//		businessMasAdapt.deleteBusinessMas(delbBusinessMas);
		
		
		businessAdapt.deleteBusiness(business);
	}

	public void batchDeleteBusiness(List<Business> businessList) {
		businessAdapt.batchDeleteBusiness(businessList);
	}

	public Business getBusinessById(String businessId) {
		return businessAdapt.getBusinessById(businessId);
	}

	public List<Business> queryBusiness(Business business) {
		return businessAdapt.queryBusiness(business);
	}
	
	@Override
	public List<Business> queryByInsertIsExist(Business business) {
		return businessAdapt.queryByInsertIsExist(business);
	}
	
	@Override
	public List<Business> queryByIsExistForWebService(Business business) {
		return businessAdapt.queryByIsExistForWebService(business);
	}

	@Override
	public Result<Business> pageQueryBusiness(BusinessQueryObj businessobj) {
		return businessAdapt.pageQueryBusiness(businessobj);
	}
	@Override
	public List<Business> queryByUpdateIsExist(Business business) {
	
		return businessAdapt.queryByUpdateBusinessesIsExist(business);
	}
	
	@Override
	public List<Business> queryBySeq() {
	
		return businessAdapt.queryBySeq();
	}
	
}