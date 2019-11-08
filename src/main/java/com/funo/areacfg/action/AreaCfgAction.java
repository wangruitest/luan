package com.funo.areacfg.action;

import java.util.List;
 
import com.funo.common.CommonAction;
import com.funo.common.ActionResult;
import com.funo.areacfg.mgmt.IAreaCfgMgmt;
import com.funo.areacfg.model.AreaCfg;
import com.funo.system.model.SysOperator;

public class AreaCfgAction extends CommonAction{
	private IAreaCfgMgmt areaCfgMgmt;

	public IAreaCfgMgmt getAreaCfgMgmt() {
		return areaCfgMgmt;
	}
	public void setAreaCfgMgmt(IAreaCfgMgmt areaCfgMgmt) {
		this.areaCfgMgmt = areaCfgMgmt;
	}
	

	/**
	 * 获取所有????
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getAllAreaCfg(){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = areaCfgMgmt.queryAreaCfg(new AreaCfg());
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
	 * 根据条件获取????列表
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getAreaCfgList(AreaCfg areaCfg){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = areaCfgMgmt.queryAreaCfg(areaCfg);
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
	 * 创建????
	 */
	public ActionResult createAreaCfg(AreaCfg areaCfg){
		ActionResult ar=new ActionResult();
		try {
			areaCfg=areaCfgMgmt.createAreaCfg(areaCfg);
			ar.setReturnObject(areaCfg);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	/**
	 * 修改????
	 */
	public ActionResult updateAreaCfg(AreaCfg areaCfg){
		ActionResult ar=new ActionResult();
		try {
			areaCfg=areaCfgMgmt.modifyAreaCfg(areaCfg);
			ar.setReturnObject(areaCfg);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	/**
	 * 删除????
	 */
	public ActionResult deleteAreaCfg(AreaCfg areaCfg){
		ActionResult ar=new ActionResult();
		try {
			areaCfgMgmt.deleteAreaCfg(areaCfg);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	
	/**
	 * 批量删除????
	 */
	public ActionResult batchDeleteAreaCfg(List<AreaCfg> areaCfgList){
		ActionResult ar=new ActionResult();
		try {
			for(int i=0;i<areaCfgList.size();i++){
				this.deleteAreaCfg(areaCfgList.get(i));
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