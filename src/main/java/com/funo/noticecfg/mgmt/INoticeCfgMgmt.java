package com.funo.noticecfg.mgmt;

import java.util.List;

import com.funo.noticecfg.model.NoticeCfg;
import com.funo.noticecfg.model.PageCount;


public interface INoticeCfgMgmt {

	public String getKey();

	public NoticeCfg createNoticeCfg(NoticeCfg noticeCfg);

	public NoticeCfg modifyNoticeCfg(NoticeCfg noticeCfg);

	public void deleteNoticeCfg(NoticeCfg noticeCfg);

	public void batchDeleteNoticeCfg(List<NoticeCfg> noticeCfgList);

	public NoticeCfg getNoticeCfgById(String unid);

	public List<NoticeCfg> queryNoticeCfg(NoticeCfg noticeCfg);

	public List<NoticeCfg> queryByAPP(NoticeCfg noticeCfg);
	
	public List<PageCount> queryByCount(NoticeCfg noticeCfg);
}