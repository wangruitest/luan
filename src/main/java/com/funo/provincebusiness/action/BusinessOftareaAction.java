package com.funo.provincebusiness.action;

import java.util.List;
 
import com.funo.common.CommonAction;
import com.funo.common.ActionResult;
import com.funo.provincebusiness.mgmt.IBusinessOftareaMgmt;
import com.funo.provincebusiness.model.BusinessOftarea;
import com.funo.system.model.SysOperator;

public class BusinessOftareaAction extends CommonAction{
	private IBusinessOftareaMgmt businessOftareaMgmt;

	public IBusinessOftareaMgmt getBusinessOftareaMgmt() {
		return businessOftareaMgmt;
	}
	public void setBusinessOftareaMgmt(IBusinessOftareaMgmt businessOftareaMgmt) {
		this.businessOftareaMgmt = businessOftareaMgmt;
	}
	

	/**
	 * 获取所有
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getAllBusinessOftarea(){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = businessOftareaMgmt.queryBusinessOftarea(new BusinessOftarea());
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
	 * 根据条件获取列表
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getBusinessOftareaList(BusinessOftarea businessOftarea){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = businessOftareaMgmt.queryBusinessOftarea(businessOftarea);
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
	 * 创建
	 */
	public ActionResult createBusinessOftarea(BusinessOftarea businessOftarea){
		ActionResult ar=new ActionResult();
		try {
			businessOftarea=businessOftareaMgmt.createBusinessOftarea(businessOftarea);
			ar.setReturnObject(businessOftarea);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	/**
	 * 修改
	 */
	public ActionResult updateBusinessOftarea(BusinessOftarea businessOftarea){
		ActionResult ar=new ActionResult();
		try {
			businessOftarea=businessOftareaMgmt.modifyBusinessOftarea(businessOftarea);
			ar.setReturnObject(businessOftarea);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	/**
	 * 删除
	 */
	public ActionResult deleteBusinessOftarea(BusinessOftarea businessOftarea){
		ActionResult ar=new ActionResult();
		try {
			businessOftareaMgmt.deleteBusinessOftarea(businessOftarea);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	
	/**
	 * 批量删除
	 */
	public ActionResult batchDeleteBusinessOftarea(List<BusinessOftarea> businessOftareaList){
		ActionResult ar=new ActionResult();
		try {
			for(int i=0;i<businessOftareaList.size();i++){
				this.deleteBusinessOftarea(businessOftareaList.get(i));
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