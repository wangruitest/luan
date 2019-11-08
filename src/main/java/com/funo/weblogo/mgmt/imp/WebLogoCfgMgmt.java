package com.funo.weblogo.mgmt.imp;

import java.util.List;

import com.funo.base.mgmt.BaseMgmt;
import com.funo.weblogo.adapt.IWebLogoCfgAdapt;
import com.funo.weblogo.mgmt.IWebLogoCfgMgmt;
import com.funo.weblogo.model.WebLogoCfg;

public class WebLogoCfgMgmt extends BaseMgmt implements IWebLogoCfgMgmt {

	private static final long serialVersionUID = 1L;
	private IWebLogoCfgAdapt webLogoCfgAdapt;

	public IWebLogoCfgAdapt getWebLogoCfgAdapt() {
		return webLogoCfgAdapt;
	}

	public void setWebLogoCfgAdapt(IWebLogoCfgAdapt webLogoCfgAdapt) {
		this.webLogoCfgAdapt = webLogoCfgAdapt;
	}

	@Override
	public List<WebLogoCfg> queryLogoCfg() {
		return webLogoCfgAdapt.queryLogoCfg();
	}

}