package com.funo.businessregioncfg.action;

import java.util.List;
 
import com.funo.common.CommonAction;
import com.funo.common.ActionResult;
import com.funo.businessregioncfg.mgmt.IBusinessRegionCfgMgmt;
import com.funo.businessregioncfg.model.BusinessRegionCfg;
import com.funo.system.model.SysOperator;
import com.funo.utils.Constants;

public class BusinessRegionCfgAction extends CommonAction{
	private IBusinessRegionCfgMgmt businessRegionCfgMgmt;

	public IBusinessRegionCfgMgmt getBusinessRegionCfgMgmt() {
		return businessRegionCfgMgmt;
	}
	public void setBusinessRegionCfgMgmt(IBusinessRegionCfgMgmt businessRegionCfgMgmt) {
		this.businessRegionCfgMgmt = businessRegionCfgMgmt;
	}
	

	/**
	 * 获取所有商户景区关联表
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getAllBusinessRegionCfg(){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = businessRegionCfgMgmt.queryBusinessRegionCfg(new BusinessRegionCfg());
			ar.setReturnList(result);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	
	private boolean setUserExParams(String key,String value){
		boolean result=true;
		try{
			SysOperator user=this.getSessionUser();
			user.getOtherParams().put(key, value);
		}catch(Exception e){
			result=false;
			e.printStackTrace();
		}
		return result;
	}
	/**
	 * 根据条件获取商户景区关联表列表
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getBusinessRegionCfgList(BusinessRegionCfg businessRegionCfg){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
//			setUserExParams(Constants.TEMP_DB_TYPE, Constants.DB_TYPE_CSMS);
//			setUserExParams(Constants.TEMP_ORG_CODE, "590");
			result = businessRegionCfgMgmt.queryBusinessRegionCfg(businessRegionCfg);
			ar.setReturnList(result);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
		
	
	/**
	 * 创建商户景区关联表
	 */
	public ActionResult createBusinessRegionCfg(BusinessRegionCfg businessRegionCfg){
		ActionResult ar=new ActionResult();
		try {
			businessRegionCfg=businessRegionCfgMgmt.createBusinessRegionCfg(businessRegionCfg);
			ar.setReturnObject(businessRegionCfg);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	
	/**
	 * 批量创建
	 */
	public ActionResult createBusinessRegionCfgBatch(String businessid,String regions){
		ActionResult ar=new ActionResult();
		try {
//			setUserExParams(Constants.TEMP_DB_TYPE, Constants.DB_TYPE_CSMS);
//			setUserExParams(Constants.TEMP_ORG_CODE, "590");
			businessRegionCfgMgmt.createBusinessRegionCfgBatch(businessid,regions,this.getSessionUser().getName());
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	/**
	 * 修改商户景区关联表
	 */
	public ActionResult updateBusinessRegionCfg(BusinessRegionCfg businessRegionCfg){
		ActionResult ar=new ActionResult();
		try {
			businessRegionCfg=businessRegionCfgMgmt.modifyBusinessRegionCfg(businessRegionCfg);
			ar.setReturnObject(businessRegionCfg);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	/**
	 * 删除商户景区关联表
	 */
	public ActionResult deleteBusinessRegionCfg(BusinessRegionCfg businessRegionCfg){
		ActionResult ar=new ActionResult();
		try {
			businessRegionCfgMgmt.deleteBusinessRegionCfg(businessRegionCfg);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	
	/**
	 * 批量删除商户景区关联表
	 */
	public ActionResult batchDeleteBusinessRegionCfg(List<BusinessRegionCfg> businessRegionCfgList){
		ActionResult ar=new ActionResult();
		try {
			for(int i=0;i<businessRegionCfgList.size();i++){
				this.deleteBusinessRegionCfg(businessRegionCfgList.get(i));
			}
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	
	/**
	 * 通过Session获取用户信息
	 */
	public SysOperator getSessionUser(){
		SysOperator user=super.getSessionUser();
		if(user==null){
			user=new SysOperator();
			user.setUnid("0");
			user.setName("超级管理员");
		}
		return user;
	}
}