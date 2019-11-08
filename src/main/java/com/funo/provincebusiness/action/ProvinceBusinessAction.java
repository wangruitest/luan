package com.funo.provincebusiness.action;

import java.util.Date;
import java.util.List;
 
import com.funo.common.CommonAction;
import com.funo.common.ActionResult;
import com.funo.provincebusiness.mgmt.IProvinceBusinessMgmt;
import com.funo.provincebusiness.model.ProvinceBusiness;
import com.funo.system.model.SysOperator;

public class ProvinceBusinessAction extends CommonAction{
	private IProvinceBusinessMgmt provinceBusinessMgmt;

	public IProvinceBusinessMgmt getProvinceBusinessMgmt() {
		return provinceBusinessMgmt;
	}
	public void setProvinceBusinessMgmt(IProvinceBusinessMgmt provinceBusinessMgmt) {
		this.provinceBusinessMgmt = provinceBusinessMgmt;
	}
	

	/**
	 * 获取所有商户信息
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getAllProvinceBusiness(){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = provinceBusinessMgmt.queryProvinceBusiness(new ProvinceBusiness());
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
	public ActionResult getProvinceBusinessList(ProvinceBusiness provinceBusiness){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = provinceBusinessMgmt.queryProvinceBusiness(provinceBusiness);
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
	public ActionResult createProvinceBusiness(ProvinceBusiness provinceBusiness){
		ActionResult ar=new ActionResult();
		try {
			provinceBusiness.setCreatetime(new Date());
			provinceBusiness.setCreateuser(this.getSessionUser().getName());
			provinceBusiness=provinceBusinessMgmt.createProvinceBusiness(provinceBusiness);
			ar.setReturnObject(provinceBusiness);
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
	public ActionResult updateProvinceBusiness(ProvinceBusiness provinceBusiness){
		ActionResult ar=new ActionResult();
		try {
			provinceBusiness.setCreatetime(new Date());
			provinceBusiness.setCreateuser(this.getSessionUser().getName());
			provinceBusiness=provinceBusinessMgmt.modifyProvinceBusiness(provinceBusiness);
			ar.setReturnObject(provinceBusiness);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	/**
	 * 删除商户信息
	 */
	public ActionResult deleteProvinceBusiness(ProvinceBusiness provinceBusiness){
		ActionResult ar=new ActionResult();
		try {
			provinceBusinessMgmt.deleteProvinceBusiness(provinceBusiness);
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
	public ActionResult batchDeleteProvinceBusiness(List<ProvinceBusiness> provinceBusinessList){
		ActionResult ar=new ActionResult();
		try {
			for(int i=0;i<provinceBusinessList.size();i++){
				this.deleteProvinceBusiness(provinceBusinessList.get(i));
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