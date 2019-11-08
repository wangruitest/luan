package com.funo.region.mgmt.impl;

import java.util.List;

import com.funo.base.mgmt.BaseMgmt;
import com.funo.region.adapt.IRegionCfgAdapt;
import com.funo.region.mgmt.IRegionCfgMgmt;
import com.funo.region.model.Areas;
import com.funo.region.model.Provinces;
import com.funo.region.model.RegionCfg;

public class RegionCfgMgmt extends BaseMgmt implements IRegionCfgMgmt {

	private static final long serialVersionUID = 1L;
	private IRegionCfgAdapt regionCfgAdapt;
	
	public IRegionCfgAdapt getRegionCfgAdapt() {
		return regionCfgAdapt;
	}
	public void setRegionCfgAdapt(IRegionCfgAdapt regionCfgAdapt) {
		this.regionCfgAdapt = regionCfgAdapt;
	}

	public String getKey() {
		return regionCfgAdapt.getKey();
	}

	public RegionCfg createRegionCfg(RegionCfg regionCfg) {
		regionCfgAdapt.createRegionCfg(regionCfg);
//		RegionCellCfg regionCellCfg=null;
//		for (CellCfg cellcfg:regionCfg.getCellCfgList()) {
//			regionCellCfg = new RegionCellCfg();
//			regionCellCfg.setRegionId(regionCfg.getId());
//			regionCellCfg.setCell(Long.parseLong(cellcfg.getCell().toString()));
//			regionCellCfg.setCelltype(Long.parseLong(cellcfg.getCelltype().toString()));
//			regionCellCfgAdapt.createRegionCellCfg(regionCellCfg);
//		}
		return regionCfg;
	}

	public RegionCfg modifyRegionCfg(RegionCfg regionCfg) {
		regionCfgAdapt.modifyRegionCfg(regionCfg);
//		RegionCellCfg regionCellCfg= new RegionCellCfg();
//		regionCellCfg.setRegionId(regionCfg.getId());
//		regionCellCfgAdapt.deleteRegionCellCfg(regionCellCfg);
//		for (CellCfg cellcfg:regionCfg.getCellCfgList()) {
//			regionCellCfg = new RegionCellCfg();
//			regionCellCfg.setRegionId(regionCfg.getId());
//			regionCellCfg.setCell(Long.parseLong(cellcfg.getCell().toString()));
//			regionCellCfg.setCelltype(Long.parseLong(cellcfg.getCelltype().toString()));
//			regionCellCfgAdapt.createRegionCellCfg(regionCellCfg);
//		}
		
		return regionCfg;
	}
	
	public RegionCfg uptRegionLnglat(RegionCfg regionCfg) {
		return regionCfgAdapt.uptRegionLnglat(regionCfg);
	}

	public void deleteRegionCfg(RegionCfg regionCfg) {
		regionCfgAdapt.deleteRegionCfg(regionCfg);
	}

	public void batchDeleteRegionCfg(List<RegionCfg> regionCfgList) {
		regionCfgAdapt.batchDeleteRegionCfg(regionCfgList);
	}

	public RegionCfg getRegionCfgById(String regionCfgId) {
		return regionCfgAdapt.getRegionCfgById(regionCfgId);
	}
	
	public RegionCfg getBySendareaId(String sendareaId) {
		return regionCfgAdapt.getBySendareaId(sendareaId);
	}

	public List<RegionCfg> queryRegionCfg(RegionCfg regionCfg) {
		return regionCfgAdapt.queryRegionCfg(regionCfg);
	}
	public List<RegionCfg> queryBySeq(){
		return regionCfgAdapt.queryBySeq();
	}
	
	//省平台获取登录用户景区权限范围
	public List<RegionCfg> queryRegionCfgOfcityUser(RegionCfg regionCfg) {
		return regionCfgAdapt.queryRegionCfgOfcityUser(regionCfg);
	}
	@Override
	public List<RegionCfg> queryByUserOfCities(RegionCfg regionCfg) {
		return regionCfgAdapt.queryByUserOfCities(regionCfg);
	}
	@Override
	public List<RegionCfg> queryByUserOfCounty(RegionCfg regionCfg) {
		return regionCfgAdapt.queryByUserOfCounty(regionCfg);
	}
	public List<RegionCfg> queryRegionIdUpdate(RegionCfg regionCfg) {
		return regionCfgAdapt.queryRegionIdUpdate(regionCfg);
	}
	@Override
	public List<Areas> queryByCityid(String cityid) {
		return regionCfgAdapt.queryByCityid(cityid);
	}
	@Override
	public List<Areas> queryBycityName(String cityName) {
		return regionCfgAdapt.queryBycityName(cityName);
	}
	@Override
	public List<RegionCfg> queryByCountyid(RegionCfg regionCfg) {
		return regionCfgAdapt.queryByCountyid(regionCfg);
	}
	@Override
	public List<Areas> queryByCounty(String countyid) {
		return regionCfgAdapt.queryByCounty(countyid);
	}
	@Override
	public List<Areas> queryByOperator(RegionCfg qRegionCfg) {
		return regionCfgAdapt.queryByOperator(qRegionCfg);
	}
	@Override
	public List<Provinces> queryByOtherOfProvince() {
		return regionCfgAdapt.queryByOtherOfProvince();
	}
}