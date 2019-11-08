package com.funo.touristtoamingout.mgmt.impl;

import java.util.List;

import com.funo.base.mgmt.BaseMgmt;
import com.funo.region.model.Areas;
import com.funo.touristtoamingout.adapt.ITouristRoamingOutAdapt;
import com.funo.touristtoamingout.mgmt.ITouristRoamingOutMgmt;
import com.funo.touristtoamingout.model.TouristRoamingOut;
import com.funo.touristtoamingout.model.TouristRoamingOut2;

public class TouristRoamingOutMgmt extends BaseMgmt implements ITouristRoamingOutMgmt {

	private static final long serialVersionUID = 1L;
	private ITouristRoamingOutAdapt touristRoamingOutAdapt;
	
	public ITouristRoamingOutAdapt getTouristRoamingOutAdapt() {
		return touristRoamingOutAdapt;
	}
	public void setTouristRoamingOutAdapt(ITouristRoamingOutAdapt touristRoamingOutAdapt) {
		this.touristRoamingOutAdapt = touristRoamingOutAdapt;
	}

	public String getKey() {
		return touristRoamingOutAdapt.getKey();
	}

//	public TouristRoamingOut createTouristRoamingOut(TouristRoamingOut touristRoamingOut) {
//		touristRoamingOutAdapt.createTouristRoamingOut(touristRoamingOut);
//		return touristRoamingOut;
//	}
//
//	public TouristRoamingOut modifyTouristRoamingOut(TouristRoamingOut touristRoamingOut) {
//		touristRoamingOutAdapt.modifyTouristRoamingOut(touristRoamingOut);
//		return touristRoamingOut;
//	}
//
//	public void deleteTouristRoamingOut(TouristRoamingOut touristRoamingOut) {
//		touristRoamingOutAdapt.deleteTouristRoamingOut(touristRoamingOut);
//	}
//
//	public void batchDeleteTouristRoamingOut(List<TouristRoamingOut> touristRoamingOutList) {
//		touristRoamingOutAdapt.batchDeleteTouristRoamingOut(touristRoamingOutList);
//	}
//
//	public TouristRoamingOut getTouristRoamingOutById(String touristRoamingOutId) {
//		return touristRoamingOutAdapt.getTouristRoamingOutById(touristRoamingOutId);
//	}
//
//	public List<TouristRoamingOut> queryTouristRoamingOut(TouristRoamingOut touristRoamingOut) {
//		return touristRoamingOutAdapt.queryTouristRoamingOut(touristRoamingOut);
//	}
	
	public List<TouristRoamingOut> queryTouristMonth(TouristRoamingOut touristRoamingOut) {
		return touristRoamingOutAdapt.queryTouristMonth(touristRoamingOut);
	}
	public List<TouristRoamingOut> queryTouristMonth2(TouristRoamingOut2 touristRoamingOut) {
		return touristRoamingOutAdapt.queryTouristMonth2(touristRoamingOut);
	}
	@Override
	public List<Areas> queryByCityid(String cityid) {
		// TODO Auto-generated method stub
		return touristRoamingOutAdapt.queryByCityid(cityid);
	}
	@Override
	public List<Areas> queryByCounty(String countyid) {
		// TODO Auto-generated method stub
		return touristRoamingOutAdapt.queryByCounty(countyid);
	}
	
}