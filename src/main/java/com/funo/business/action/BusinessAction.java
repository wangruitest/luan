package com.funo.business.action;

import java.util.Date;
import java.util.List;

import com.funo.business.mgmt.IBusinessMgmt;
import com.funo.business.model.Business;
import com.funo.common.ActionResult;
import com.funo.common.CommonAction;
import com.funo.region.model.RegionCfg;
import com.funo.system.model.SysOperator;
import com.funo.system.model.SysRole;
import com.funo.utils.Constants;
//import com.funo.workorder.mgmt.IWorkorderMgmt;
//import com.funo.workorder.model.Workorder;

public class BusinessAction extends CommonAction{
	private IBusinessMgmt businessMgmt;
//	private IWorkorderMgmt workorderMgmt;
	public static IBusinessMgmt businessMgmtStatic;
	public IBusinessMgmt getBusinessMgmt() {
		return businessMgmt;
	}
	public void setBusinessMgmt(IBusinessMgmt businessMgmt) {
		this.businessMgmt = businessMgmt;
//		this.businessMgmtStatic=businessMgmt;
	}
//	public IWorkorderMgmt getWorkorderMgmt() {
//		return workorderMgmt;
//	}
//	public void setWorkorderMgmt(IWorkorderMgmt workorderMgmt) {
//		this.workorderMgmt = workorderMgmt;
//	}
	/**
	 * 获取所有商户信息
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getAllBusiness(){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = businessMgmt.queryBusiness(new Business());
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
	 * 根据条件获取商户信息列表
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getBusinessList(Business business){
		ActionResult ar=new ActionResult();
		List result=null;
		boolean isAdmin = false;
		List<SysRole> roles = super.getSessionUser().getRoles();
		for (SysRole role:roles) {
			if (Constants.ADMIN_ROLE_ID.equals(role.getUnid()) || Constants.YUNWEI_ROLE_ID.equals(role.getUnid())){
				isAdmin =true;
				break;
			}
		}
		if (!isAdmin) business.setCreateuser(this.getSessionUser().getName());
		try {
			result = businessMgmt.queryBusiness(business);
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
	 * 创建商户信息
	 */
	public ActionResult createBusiness(Business business){
		ActionResult ar=new ActionResult();
		String loginUser = this.getSessionUser().getName();
		SysOperator user=this.getSessionUser();
		String cityCode = (String)user.getOtherParams().get(Constants.CUR_CHOOSE_CITY);
		try {
			if(!business.getBusinesscode().equals("")){
				if (!validateDulAddBusinesscode(business)){
					ar.setResultCode(-2);
					return ar;
				}
			}
			
			business.setCreatetime(new Date());
			business.setCreateuser(this.getSessionUser().getName());
			business.setEdittime(new Date());
			business.setEdituser(this.getSessionUser().getName());
			business=businessMgmt.createBusiness(business,loginUser);
//			setUserExParams(Constants.TEMP_DB_TYPE, Constants.DB_TYPE_CSMS);
//			setUserExParams(Constants.TEMP_ORG_CODE, Constants.DS_CODE_ALL);
//			Business business590 = business;
//			business590.setCityCode(Long.valueOf(cityCode));
//			business590=businessMgmt.createBusiness(business,loginUser);
			ar.setReturnObject(business);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	/**
	 * 修改商户信息
	 */
	public ActionResult updateBusiness(Business business){
		ActionResult ar=new ActionResult();
		String loginUser = this.getSessionUser().getName();
		try {
			if(!business.getBusinesscode().equals("")){
				if (!validateDulUpdateBusinesscode(business)){
					ar.setResultCode(-2);
					return ar;
				}
			}
			
			
			business.setEdittime(new Date());
			business.setEdituser(this.getSessionUser().getName());
			business=businessMgmt.modifyBusiness(business,loginUser);
			ar.setReturnObject(business);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	/**
	 * 判断是否能删除商户信息
	 */
	public String deleteForIsExist(List<Business> businessList){
		String boo = "true";
//		List rs = null;
//		if(null != businessList && businessList.size()>0){
//			for(int i=0;i<businessList.size();i++){
//				Workorder wo = new Workorder();
//				wo.setBusinessid(businessList.get(i).getBusinessid());
//				try{
//					rs = workorderMgmt.queryWorkorder(wo);
//					if(!rs.isEmpty()){
//						boo = "false"+"-"+businessList.get(i).getBusinessname();
//						return boo;
//					}
//				} catch (Exception e) {
//					e.printStackTrace();
//				}
//			}
//		}
		return boo;
	}
	/**
	 * 删除商户信息
	 */
	public ActionResult deleteBusiness(Business business){
		ActionResult ar=new ActionResult();
		try {
			businessMgmt.deleteBusiness(business);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	
	/**
	 * 批量删除商户信息
	 */
	public ActionResult batchDeleteBusiness(List<Business> businessList){
		ActionResult ar=new ActionResult();
		try {
			for(int i=0;i<businessList.size();i++){
				this.deleteBusiness(businessList.get(i));
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
	 * 添加时验证商户集团编号是否重复
	 */
	public boolean validateDulAddBusinesscode(Business business){
		Business businesssearch = new Business();
		businesssearch.setBusinesscode(business.getBusinesscode());
		List<Business> businessList = businessMgmt.queryByInsertIsExist(businesssearch);
		if (businessList!=null&&businessList.size()>0){
			return false;
		}
		return true;
	}
	
	/**
	 * 修改时验证商户集团编号是否重复
	 */
	public boolean validateDulUpdateBusinesscode(Business business){
		Business businesssearch = new Business();
		businesssearch.setBusinesscode(business.getBusinesscode());
		businesssearch.setBusinessid(business.getBusinessid());
		List<Business> businessList = businessMgmt.queryByUpdateIsExist(businesssearch);
		if (businessList!=null&&businessList.size()>0){
			return false;
		}
		return true;
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
}