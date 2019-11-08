package com.funo.noticecfg.mgmt.impl;

import java.util.List;

import com.funo.base.mgmt.BaseMgmt;
import com.funo.noticecfg.adapt.INoticeCfgAdapt;
import com.funo.noticecfg.mgmt.INoticeCfgMgmt;
import com.funo.noticecfg.model.NoticeCfg;
import com.funo.noticecfg.model.PageCount;

public class NoticeCfgMgmt extends BaseMgmt implements INoticeCfgMgmt {

	private static final long serialVersionUID = 1L;
	private INoticeCfgAdapt noticeCfgAdapt;
	
	public INoticeCfgAdapt getNoticeCfgAdapt() {
		return noticeCfgAdapt;
	}
	public void setNoticeCfgAdapt(INoticeCfgAdapt noticeCfgAdapt) {
		this.noticeCfgAdapt = noticeCfgAdapt;
	}

	public String getKey() {
		return noticeCfgAdapt.getKey();
	}

	public NoticeCfg createNoticeCfg(NoticeCfg noticeCfg) {
		noticeCfgAdapt.createNoticeCfg(noticeCfg);
		return noticeCfg;
	}

	public NoticeCfg modifyNoticeCfg(NoticeCfg noticeCfg) {
		noticeCfgAdapt.modifyNoticeCfg(noticeCfg);
		return noticeCfg;
	}

	public void deleteNoticeCfg(NoticeCfg noticeCfg) {
		noticeCfgAdapt.deleteNoticeCfg(noticeCfg);
	}

	public void batchDeleteNoticeCfg(List<NoticeCfg> noticeCfgList) {
		noticeCfgAdapt.batchDeleteNoticeCfg(noticeCfgList);
	}

	public NoticeCfg getNoticeCfgById(String noticeCfgId) {
		return noticeCfgAdapt.getNoticeCfgById(noticeCfgId);
	}

	public List<NoticeCfg> queryNoticeCfg(NoticeCfg noticeCfg) {
		return noticeCfgAdapt.queryNoticeCfg(noticeCfg);
	}
	@Override
	public List<NoticeCfg> queryByAPP(NoticeCfg noticeCfg) {
		// TODO Auto-generated method stub
		return noticeCfgAdapt.queryByAPP(noticeCfg);
	}
	@Override
	public List<PageCount> queryByCount(NoticeCfg noticeCfg) {
		// TODO Auto-generated method stub
		return noticeCfgAdapt.queryByCount(noticeCfg);
	}
	
}