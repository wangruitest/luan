package com.funo.provincebusiness.mgmt.impl;

import java.util.List;

import com.funo.base.mgmt.BaseMgmt;
import com.funo.base.vo.Result;
import com.funo.provincebusiness.adapt.IBusinessGwAdapt;
import com.funo.provincebusiness.model.BusinessGw;
import com.funo.provincebusiness.adapt.IBusinessOftareaAdapt;
import com.funo.provincebusiness.model.BusinessOftarea;
//import com.funo.gwCfg.adapt.IGwCfgAdapt;
//import com.funo.gwCfg.model.GwCfg;
//import com.funo.oftenusedareacfg.model.OftenUsedAreaCfg;
import com.funo.provincebusiness.adapt.IProvinceBusinessAdapt;
import com.funo.provincebusiness.mgmt.IProvinceBusinessMgmt;
import com.funo.provincebusiness.model.ProvinceBusiness;
import com.funo.provincebusiness.model.ProvinceBusinessQueryObj;

public class ProvinceBusinessMgmt extends BaseMgmt implements IProvinceBusinessMgmt {

	private static final long serialVersionUID = 1L;
	private IProvinceBusinessAdapt provinceBusinessAdapt;
	private IBusinessGwAdapt businessGwAdapt;
//	private IGwCfgAdapt gwCfgAdapt;
	private IBusinessOftareaAdapt businessOftareaAdapt;
	
	public IProvinceBusinessAdapt getProvinceBusinessAdapt() {
		return provinceBusinessAdapt;
	}
	public void setProvinceBusinessAdapt(IProvinceBusinessAdapt provinceBusinessAdapt) {
		this.provinceBusinessAdapt = provinceBusinessAdapt;
	}

	public String getKey() {
		return provinceBusinessAdapt.getKey();
	}

	public void batchDeleteProvinceBusiness(List<ProvinceBusiness> provinceBusinessList) {
		provinceBusinessAdapt.batchDeleteProvinceBusiness(provinceBusinessList);
	}

	public ProvinceBusiness getProvinceBusinessById(String provinceBusinessId) {
		return provinceBusinessAdapt.getProvinceBusinessById(provinceBusinessId);
	}

	public List<ProvinceBusiness> queryProvinceBusiness(ProvinceBusiness provinceBusiness) {
		return provinceBusinessAdapt.queryProvinceBusiness(provinceBusiness);
	}
	public IBusinessGwAdapt getBusinessGwAdapt() {
		return businessGwAdapt;
	}
	public void setBusinessGwAdapt(IBusinessGwAdapt businessGwAdapt) {
		this.businessGwAdapt = businessGwAdapt;
	}
//	public IGwCfgAdapt getGwCfgAdapt() {
//		return gwCfgAdapt;
//	}
//	public void setGwCfgAdapt(IGwCfgAdapt gwCfgAdapt) {
//		this.gwCfgAdapt = gwCfgAdapt;
//	}
	public IBusinessOftareaAdapt getBusinessOftareaAdapt() {
		return businessOftareaAdapt;
	}
	public void setBusinessOftareaAdapt(IBusinessOftareaAdapt businessOftareaAdapt) {
		this.businessOftareaAdapt = businessOftareaAdapt;
	}
	
	public ProvinceBusiness createProvinceBusiness(ProvinceBusiness business) {
		//获取Business的SEQ
		Long id= 0l;
		List<ProvinceBusiness> businessesList= provinceBusinessAdapt.queryBySeq();
		if(null != businessesList) 
			id=((ProvinceBusiness)businessesList.get(0)).getBusinessid();
		business.setBusinessid(id);
		//保存Business的数据
		provinceBusinessAdapt.createProvinceBusiness(business);
//		//保存关联常用区域oftenUsedAreaCfg的数据
//		if(null != business.getOftenUsedAreaList()&& business.getOftenUsedAreaList().size()>0){
//			for(int i = 0;i<business.getOftenUsedAreaList().size();i++){
//				OftenUsedAreaCfg oftenUsedAreaCfg = business.getOftenUsedAreaList().get(i);
//				BusinessOftarea businessOftarea = new BusinessOftarea();
//				businessOftarea.setBusinessid(business.getBusinessid());
//				businessOftarea.setOftenUsedAreaId(oftenUsedAreaCfg.getOftenUsedAreaId());
//				businessOftareaAdapt.createBusinessOftarea(businessOftarea);
//			}
//		}
//		//保存关联行业网关GwCfg的数据
//		if(null != business.getGwCfgList() && business.getGwCfgList().size()>0){
//			for (int i = 0; i < business.getGwCfgList().size(); i++) {
//				GwCfg gwCfg = business.getGwCfgList().get(i);
//				BusinessGw businessgw = new BusinessGw();
//				businessgw.setBusinessid(business.getBusinessid());
//				businessgw.setGwId(gwCfg.getGwId());
//				businessgw.setCreateDate(business.getCreatetime());
//				businessgw.setCreateUser(business.getCreateuser());
//				businessGwAdapt.createBusinessGw(businessgw);
//			}
//		}
		return business;
	}

	public ProvinceBusiness modifyProvinceBusiness(ProvinceBusiness business) {
		//删除BusinessOftarea表中的属于该条Business的数据
		BusinessOftarea delBusinessOftarea = new BusinessOftarea();
		delBusinessOftarea.setBusinessid(business.getBusinessid());
		businessOftareaAdapt.deleteBusinessOftarea(delBusinessOftarea);
		//删除BusinessGw表中属于该条Business的数据
		BusinessGw delBusinessGw = new BusinessGw();
		delBusinessGw.setBusinessid(business.getBusinessid());
		businessGwAdapt.deleteBusinessGw(delBusinessGw);
		//保存关联常用区域SendareaCfg的数据
//		if(null != business.getOftenUsedAreaList()&& business.getOftenUsedAreaList().size()>0){
//			for(int i = 0;i<business.getOftenUsedAreaList().size();i++){
//				OftenUsedAreaCfg oftenUsedAreaCfg = business.getOftenUsedAreaList().get(i);
//				BusinessOftarea businessOftarea = new BusinessOftarea();
//				businessOftarea.setBusinessid(business.getBusinessid());
//				businessOftarea.setOftenUsedAreaId(oftenUsedAreaCfg.getOftenUsedAreaId());
//				businessOftareaAdapt.createBusinessOftarea(businessOftarea);
//			}
//		}
//		//保存关联行业网关GwCfg的数据
//		if(null != business.getGwCfgList() && business.getGwCfgList().size()>0){
//			for (int i = 0; i < business.getGwCfgList().size(); i++) {
//				GwCfg geCfg = business.getGwCfgList().get(i);
//				BusinessGw businessGw = new BusinessGw();
//				businessGw.setBusinessid(business.getBusinessid());
//				businessGw.setGwId(geCfg.getGwId());
//				businessGw.setCreateDate(business.getCreatetime());
//				businessGw.setCreateUser(business.getCreateuser());
//				businessGwAdapt.createBusinessGw(businessGw);
//			}
//		}
		provinceBusinessAdapt.modifyProvinceBusiness(business);
		return business;
	}

	public void deleteProvinceBusiness(ProvinceBusiness business) {
		//删除关联的常用区域配置
		BusinessOftarea delBusinessOftarea = new BusinessOftarea();
		delBusinessOftarea.setBusinessid(business.getBusinessid());
		businessOftareaAdapt.deleteBusinessOftarea(delBusinessOftarea);
		//删除关联的行业网关配置
		BusinessGw delbBusinessGw = new BusinessGw();
		delbBusinessGw.setBusinessid(business.getBusinessid());
		businessGwAdapt.deleteBusinessGw(delbBusinessGw);
		
		
		provinceBusinessAdapt.deleteProvinceBusiness(business);
	}
	
	@Override
	public List<ProvinceBusiness> queryByInsertIsExist(ProvinceBusiness business) {
		return provinceBusinessAdapt.queryByInsertIsExist(business);
	}

	@Override
	public Result<ProvinceBusiness> pageQueryProvinceBusiness(ProvinceBusinessQueryObj businessobj) {
		return provinceBusinessAdapt.pageQueryProvinceBusiness(businessobj);
	}
	
	@Override
	public List<ProvinceBusiness> queryByUpdateIsExist(ProvinceBusiness business) {
		return provinceBusinessAdapt.queryByUpdateBusinessesIsExist(business);
	}
}