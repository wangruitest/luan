package com.funo.userbusinesscfg.action;

import java.util.List;
 
import com.funo.common.CommonAction;
import com.funo.common.ActionResult;
import com.funo.userbusinesscfg.mgmt.IUserBusinessCfgMgmt;
import com.funo.userbusinesscfg.model.UserBusinessCfg;
import com.funo.system.model.SysOperator;

public class UserBusinessCfgAction extends CommonAction{
	private IUserBusinessCfgMgmt userBusinessCfgMgmt;

	public IUserBusinessCfgMgmt getUserBusinessCfgMgmt() {
		return userBusinessCfgMgmt;
	}
	public void setUserBusinessCfgMgmt(IUserBusinessCfgMgmt userBusinessCfgMgmt) {
		this.userBusinessCfgMgmt = userBusinessCfgMgmt;
	}
	

	/**
	 * 获取所有
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getAllUserBusinessCfg(){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = userBusinessCfgMgmt.queryUserBusinessCfg(new UserBusinessCfg());
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
	public ActionResult getUserBusinessCfgList(UserBusinessCfg userBusinessCfg){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = userBusinessCfgMgmt.queryUserBusinessCfg(userBusinessCfg);
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
	public ActionResult createUserBusinessCfg(UserBusinessCfg userBusinessCfg){
		ActionResult ar=new ActionResult();
		try {
//			userBusinessCfg.setUnid(userBusinessCfgMgmt.getKey());
			userBusinessCfg=userBusinessCfgMgmt.createUserBusinessCfg(userBusinessCfg);
			ar.setReturnObject(userBusinessCfg);
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
	public ActionResult updateUserBusinessCfg(UserBusinessCfg userBusinessCfg){
		ActionResult ar=new ActionResult();
		try {
			userBusinessCfg=userBusinessCfgMgmt.modifyUserBusinessCfg(userBusinessCfg);
			ar.setReturnObject(userBusinessCfg);
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
	public ActionResult deleteUserBusinessCfg(UserBusinessCfg userBusinessCfg){
		ActionResult ar=new ActionResult();
		try {
			userBusinessCfgMgmt.deleteUserBusinessCfg(userBusinessCfg);
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
	public ActionResult batchDeleteUserBusinessCfg(List<UserBusinessCfg> userBusinessCfgList){
		ActionResult ar=new ActionResult();
		try {
			for(int i=0;i<userBusinessCfgList.size();i++){
				this.deleteUserBusinessCfg(userBusinessCfgList.get(i));
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