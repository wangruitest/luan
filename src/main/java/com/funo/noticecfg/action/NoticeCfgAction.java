package com.funo.noticecfg.action;

import java.util.Date;
import java.util.List;
 
import com.funo.common.CommonAction;
import com.funo.common.ActionResult;
import com.funo.noticecfg.mgmt.INoticeCfgMgmt;
import com.funo.noticecfg.model.NoticeCfg;
import com.funo.system.model.SysOperator;

public class NoticeCfgAction extends CommonAction{
	private INoticeCfgMgmt noticeCfgMgmt;

	public INoticeCfgMgmt getNoticeCfgMgmt() {
		return noticeCfgMgmt;
	}
	public void setNoticeCfgMgmt(INoticeCfgMgmt noticeCfgMgmt) {
		this.noticeCfgMgmt = noticeCfgMgmt;
	}
	

	/**
	 * 获取所有公告表
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getAllNoticeCfg(){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = noticeCfgMgmt.queryNoticeCfg(new NoticeCfg());
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
	 * 根据条件获取公告表列表
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getNoticeCfgList(NoticeCfg noticeCfg){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = noticeCfgMgmt.queryNoticeCfg(noticeCfg);
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
	 * 创建公告表
	 */
	public ActionResult createNoticeCfg(NoticeCfg noticeCfg){
		ActionResult ar=new ActionResult();
		try {
//			noticeCfg.setUnid(noticeCfgMgmt.getKey());
			SysOperator user=super.getSessionUser();
			Date da = new Date();
			noticeCfg.setNewsTime(da);
			noticeCfg.setUpdatetime(da);
			noticeCfg.setEdituser(user.getName());
			noticeCfg.setUserid(user.getUnid());
			noticeCfg=noticeCfgMgmt.createNoticeCfg(noticeCfg);
			ar.setReturnObject(noticeCfg);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	/**
	 * 修改公告表
	 */
	public ActionResult updateNoticeCfg(NoticeCfg noticeCfg){
		ActionResult ar=new ActionResult();
		try {
			SysOperator user=super.getSessionUser();
			Date da = new Date();
			noticeCfg.setUpdatetime(da);
			noticeCfg.setEdituser(user.getName());
			noticeCfg.setUserid(user.getUnid());
			noticeCfg=noticeCfgMgmt.modifyNoticeCfg(noticeCfg);
			ar.setReturnObject(noticeCfg);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	/**
	 * 删除公告表
	 */
	public ActionResult deleteNoticeCfg(NoticeCfg noticeCfg){
		ActionResult ar=new ActionResult();
		try {
			noticeCfgMgmt.deleteNoticeCfg(noticeCfg);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	
	/**
	 * 批量删除公告表
	 */
	public ActionResult batchDeleteNoticeCfg(List<NoticeCfg> noticeCfgList){
		ActionResult ar=new ActionResult();
		try {
			for(int i=0;i<noticeCfgList.size();i++){
				this.deleteNoticeCfg(noticeCfgList.get(i));
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