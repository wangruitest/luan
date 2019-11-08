package com.funo.provincebusiness.action;

import java.util.List;
 
import com.funo.common.CommonAction;
import com.funo.common.ActionResult;
import com.funo.provincebusiness.mgmt.IBusinessGwMgmt;
import com.funo.provincebusiness.model.BusinessGw;
import com.funo.system.model.SysOperator;

public class BusinessGwAction extends CommonAction{
	private IBusinessGwMgmt businessGwMgmt;

	public IBusinessGwMgmt getBusinessGwMgmt() {
		return businessGwMgmt;
	}
	public void setBusinessGwMgmt(IBusinessGwMgmt businessGwMgmt) {
		this.businessGwMgmt = businessGwMgmt;
	}
	

	/**
	 * 获取所有商户与行业网关关联表
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getAllBusinessGw(){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = businessGwMgmt.queryBusinessGw(new BusinessGw());
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
	 * 根据条件获取商户与行业网关关联表列表
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getBusinessGwList(BusinessGw businessGw){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = businessGwMgmt.queryBusinessGw(businessGw);
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
	 * 创建商户与行业网关关联表
	 */
	public ActionResult createBusinessGw(BusinessGw businessGw){
		ActionResult ar=new ActionResult();
		try {
			businessGw=businessGwMgmt.createBusinessGw(businessGw);
			ar.setReturnObject(businessGw);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	/**
	 * 修改商户与行业网关关联表
	 */
	public ActionResult updateBusinessGw(BusinessGw businessGw){
		ActionResult ar=new ActionResult();
		try {
			businessGw=businessGwMgmt.modifyBusinessGw(businessGw);
			ar.setReturnObject(businessGw);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	/**
	 * 删除商户与行业网关关联表
	 */
	public ActionResult deleteBusinessGw(BusinessGw businessGw){
		ActionResult ar=new ActionResult();
		try {
			businessGwMgmt.deleteBusinessGw(businessGw);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	
	/**
	 * 批量删除商户与行业网关关联表
	 */
	public ActionResult batchDeleteBusinessGw(List<BusinessGw> businessGwList){
		ActionResult ar=new ActionResult();
		try {
			for(int i=0;i<businessGwList.size();i++){
				this.deleteBusinessGw(businessGwList.get(i));
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