package com.funo.weblogo.action;

import java.util.List;

import com.funo.common.CommonAction;
import com.funo.common.ActionResult;

import com.funo.weblogo.mgmt.IWebLogoCfgMgmt;
import com.funo.system.model.SysOperator;

public class WebLogoCfgAction extends CommonAction {
	private IWebLogoCfgMgmt webLogoCfgMgmt;

	public IWebLogoCfgMgmt getWebLogoCfgMgmt() {
		return webLogoCfgMgmt;
	}

	public void setWebLogoCfgMgmt(IWebLogoCfgMgmt webLogoCfgMgmt) {
		this.webLogoCfgMgmt = webLogoCfgMgmt;
	}

	/**
	 * 获取所有
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getWebLogoCfg() {
		ActionResult ar = new ActionResult();
		List result = null;
		try {			
			result = webLogoCfgMgmt.queryLogoCfg();
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
	 * 通过Session获取用户信息
	 */
	public SysOperator getSessionUser() {
		SysOperator user = super.getSessionUser();
		if (user == null) {
			user = new SysOperator();
			user.setUnid("0");
			user.setName("超级管理员");
		}
		return user;
	}
}