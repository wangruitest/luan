package com.funo.roleregioncfg.mgmt;

import java.util.List;

import com.funo.roleregioncfg.model.RoleRegionCfg;


public interface IRoleRegionCfgMgmt {

	public String getKey();

	public RoleRegionCfg createRoleRegionCfg(RoleRegionCfg roleRegionCfg);

	public RoleRegionCfg modifyRoleRegionCfg(RoleRegionCfg roleRegionCfg);

	public void deleteRoleRegionCfg(RoleRegionCfg roleRegionCfg);

	public void batchDeleteRoleRegionCfg(List<RoleRegionCfg> roleRegionCfgList);

	public RoleRegionCfg getRoleRegionCfgById(String unid);

	public List<RoleRegionCfg> queryRoleRegionCfg(RoleRegionCfg roleRegionCfg);
	public void createRoleRegionCfgBatch(String roles,String regions,String createuser);
	
	public List<RoleRegionCfg> queryRoleRegionCityCfg(RoleRegionCfg roleRegionCfg);
}