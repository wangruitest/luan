package com.funo.provinceregioncfg.action;

import java.util.List;
 
import com.funo.common.CommonAction;
import com.funo.common.ActionResult;
import com.funo.provinceregioncfg.mgmt.IProvinceRegionCfgMgmt;
import com.funo.provinceregioncfg.model.ProvinceRegionCfg;
import com.funo.system.model.SysOperator;

public class ProvinceRegionCfgAction extends CommonAction{
	private IProvinceRegionCfgMgmt provinceRegionCfgMgmt;

	public IProvinceRegionCfgMgmt getProvinceRegionCfgMgmt() {
		return provinceRegionCfgMgmt;
	}
	public void setProvinceRegionCfgMgmt(IProvinceRegionCfgMgmt provinceRegionCfgMgmt) {
		this.provinceRegionCfgMgmt = provinceRegionCfgMgmt;
	}
	

	/**
	 * 获取所有
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getAllProvinceRegionCfg(){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = provinceRegionCfgMgmt.queryProvinceRegionCfg(new ProvinceRegionCfg());
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
	public ActionResult getProvinceRegionCfgList(ProvinceRegionCfg provinceRegionCfg){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = provinceRegionCfgMgmt.queryProvinceRegionCfg(provinceRegionCfg);
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
	public ActionResult createProvinceRegionCfg(ProvinceRegionCfg provinceRegionCfg){
		ActionResult ar=new ActionResult();
		try {
			provinceRegionCfg.setUnid(provinceRegionCfgMgmt.getKey());
			provinceRegionCfg=provinceRegionCfgMgmt.createProvinceRegionCfg(provinceRegionCfg);
			ar.setReturnObject(provinceRegionCfg);
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
	public ActionResult updateProvinceRegionCfg(ProvinceRegionCfg provinceRegionCfg){
		ActionResult ar=new ActionResult();
		try {
			provinceRegionCfg=provinceRegionCfgMgmt.modifyProvinceRegionCfg(provinceRegionCfg);
			ar.setReturnObject(provinceRegionCfg);
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
	public ActionResult deleteProvinceRegionCfg(ProvinceRegionCfg provinceRegionCfg){
		ActionResult ar=new ActionResult();
		try {
			provinceRegionCfgMgmt.deleteProvinceRegionCfg(provinceRegionCfg);
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
	public ActionResult batchDeleteProvinceRegionCfg(List<ProvinceRegionCfg> provinceRegionCfgList){
		ActionResult ar=new ActionResult();
		try {
			for(int i=0;i<provinceRegionCfgList.size();i++){
				this.deleteProvinceRegionCfg(provinceRegionCfgList.get(i));
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