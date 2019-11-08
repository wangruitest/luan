package com.funo.weblogo.adapt.imp;

import java.util.List;

import com.funo.base.adapt.BaseAdapt;
import com.funo.weblogo.adapt.IWebLogoCfgAdapt;
import com.funo.weblogo.dao.IWebLogoCfgDao;
import com.funo.weblogo.model.WebLogoCfg;

public class WebLogoCfgAdapt extends BaseAdapt implements IWebLogoCfgAdapt {

	private static final long serialVersionUID = 1L;
	private IWebLogoCfgDao webLogoCfgDao;

	

	public IWebLogoCfgDao getWebLogoCfgDao() {
		return webLogoCfgDao;
	}



	public void setWebLogoCfgDao(IWebLogoCfgDao webLogoCfgDao) {
		this.webLogoCfgDao = webLogoCfgDao;
	}



	@Override
	public List<WebLogoCfg> queryLogoCfg() {
		return  webLogoCfgDao.queryByArgs(new WebLogoCfg());
	}

}