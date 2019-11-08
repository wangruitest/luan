package com.funo.noticecfg.dao;

import java.util.List;

import com.funo.base.dao.CommonDao;
import com.funo.noticecfg.model.NoticeCfg;
import com.funo.noticecfg.model.PageCount;

public interface INoticeCfgDao extends CommonDao<NoticeCfg> {

	public List<NoticeCfg> queryByAPP(NoticeCfg noticeCfg);
	
	public List<PageCount> queryByCount(NoticeCfg noticeCfg);
	
	
}