package com.funo.noticecfg.adapt.impl;

import java.util.List;

import com.funo.base.adapt.BaseAdapt;
import com.funo.noticecfg.dao.INoticeCfgDao;
import com.funo.noticecfg.adapt.INoticeCfgAdapt;
import com.funo.noticecfg.model.NoticeCfg;
import com.funo.noticecfg.model.PageCount;

public class NoticeCfgAdapt extends BaseAdapt implements INoticeCfgAdapt {

	private static final long serialVersionUID = 1L;
	private INoticeCfgDao noticeCfgDao;
	
	public INoticeCfgDao getNoticeCfgDao() {
		return noticeCfgDao;
	}

	public void setNoticeCfgDao(INoticeCfgDao noticeCfgDao) {
		this.noticeCfgDao = noticeCfgDao;
	}

	public String getKey() {
		return noticeCfgDao.getKey();
	}

	public NoticeCfg createNoticeCfg(NoticeCfg noticeCfg) {
		noticeCfgDao.create(noticeCfg);
		return noticeCfg;
	}

	public NoticeCfg modifyNoticeCfg(NoticeCfg noticeCfg) {
		noticeCfgDao.update(noticeCfg);
		return noticeCfg;
	}

	public void deleteNoticeCfg(NoticeCfg noticeCfg) {
		noticeCfgDao.delete(noticeCfg);
	}

	public void batchDeleteNoticeCfg(List<NoticeCfg> noticeCfgList) {
		noticeCfgDao.batchCreate(noticeCfgList);
	}

	public NoticeCfg getNoticeCfgById(String noticeCfgId) {
		return noticeCfgDao.getById(noticeCfgId);
	}

	public List<NoticeCfg> queryNoticeCfg(NoticeCfg noticeCfg) {
		return noticeCfgDao.queryByArgs(noticeCfg);
	}

	@Override
	public List<NoticeCfg> queryByAPP(NoticeCfg noticeCfg) {
		// TODO Auto-generated method stub
		return noticeCfgDao.queryByAPP(noticeCfg);
	}

	@Override
	public List<PageCount> queryByCount(NoticeCfg noticeCfg) {
		// TODO Auto-generated method stub
		return noticeCfgDao.queryByCount(noticeCfg);
	}
	
}