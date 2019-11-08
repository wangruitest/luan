package com.funo.system.action;

import java.util.List;
 
import com.funo.common.CommonAction;
import com.funo.common.ActionResult;
import com.funo.system.mgmt.ISysOperatorMgmt;
import com.funo.system.model.SysOperator;
import com.funo.system.model.SysOperator;

public class SysOperatorAction extends CommonAction{
	private ISysOperatorMgmt sysOperatorMgmt;
	public static ISysOperatorMgmt sysOperatorMgmtStatic;

	public ISysOperatorMgmt getSysOperatorMgmt() {
		return sysOperatorMgmt;
	}
	public void setSysOperatorMgmt(ISysOperatorMgmt sysOperatorMgmt) {
		this.sysOperatorMgmt = sysOperatorMgmt;
		this.sysOperatorMgmtStatic = sysOperatorMgmt;
	}
	

	/**
	 * 获取所有
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getAllSysOperator(){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = sysOperatorMgmt.querySysOperator(new SysOperator());
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
	public ActionResult getSysOperatorList(SysOperator sysOperator){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			if(null==sysOperator){
				sysOperator=new SysOperator();
			}
			sysOperator.setLoginuserid(getSessionUser().getUnid());
			result = sysOperatorMgmt.querySysOperatorList(sysOperator);
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
	public ActionResult createSysOperator(SysOperator sysOperator){
		ActionResult ar=new ActionResult();
		try {
			sysOperator.setUnid(sysOperatorMgmt.getKey());
			sysOperator.setParentUnid(getSessionUser().getUnid());
			sysOperator=sysOperatorMgmt.createSysOperator(sysOperator);
			ar.setReturnObject(sysOperator);
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
	public ActionResult updateSysOperator(SysOperator sysOperator){
		ActionResult ar=new ActionResult();
		try {
			sysOperator=sysOperatorMgmt.modifySysOperator(sysOperator);
			ar.setReturnObject(sysOperator);
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
	public ActionResult deleteSysOperator(SysOperator sysOperator){
		ActionResult ar=new ActionResult();
		try {
			sysOperatorMgmt.deleteSysOperator(sysOperator);
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
	public ActionResult batchDeleteSysOperator(List<SysOperator> sysOperatorList){
		ActionResult ar=new ActionResult();
		try {
			for(int i=0;i<sysOperatorList.size();i++){
				this.deleteSysOperator(sysOperatorList.get(i));
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
	 * 添加时、确认登录用户名是否唯一
	 * **/
	@SuppressWarnings("rawtypes")
	public boolean isLoginNameExistence(SysOperator sysOperator){
		boolean boo = false;
		List rs = null;
		try{
			rs = sysOperatorMgmt.queryInsertIsLoginNameExist(sysOperator);
			if(rs.isEmpty()){
				boo = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return boo;
	}
	
	/**
	 * 修改时、确认登录用户名是否唯一
	 * **/
	@SuppressWarnings("rawtypes")
	public boolean isLoginNameExistenceForUpd(SysOperator sysOperator){
		boolean boo = false;
		List rs = null;
		try{
			rs = sysOperatorMgmt.queryUpdateIsLoginNameExist(sysOperator);
			if(rs.isEmpty()){
				boo = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return boo;
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