package com.funo.areacfg.mgmt;

import java.util.List;

import com.funo.areacfg.model.AreaCfg;


public interface IAreaCfgMgmt {

	public String getKey();

	public AreaCfg createAreaCfg(AreaCfg areaCfg);

	public AreaCfg modifyAreaCfg(AreaCfg areaCfg);

	public void deleteAreaCfg(AreaCfg areaCfg);

	public void batchDeleteAreaCfg(List<AreaCfg> areaCfgList);

	public AreaCfg getAreaCfgById(String unid);

	public List<AreaCfg> queryAreaCfg(AreaCfg areaCfg);

}