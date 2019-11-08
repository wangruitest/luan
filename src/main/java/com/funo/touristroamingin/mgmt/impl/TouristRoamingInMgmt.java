package com.funo.touristroamingin.mgmt.impl;

import java.util.List;

import com.funo.base.mgmt.BaseMgmt;
import com.funo.region.model.Areas;
import com.funo.touristroaming.model.TouristRoaming;
import com.funo.touristroamingin.adapt.ITouristRoamingInAdapt;
import com.funo.touristroamingin.mgmt.ITouristRoamingInMgmt;
import com.funo.touristroamingin.model.TouristRoamingIn;
import com.funo.touristroamingin.model.TouristRomaingIn2;

public class TouristRoamingInMgmt extends BaseMgmt implements ITouristRoamingInMgmt {

	private static final long serialVersionUID = 1L;
	private ITouristRoamingInAdapt touristRoamingInAdapt;
	
	public ITouristRoamingInAdapt getTouristRoamingInAdapt() {
		return touristRoamingInAdapt;
	}
	public void setTouristRoamingInAdapt(ITouristRoamingInAdapt touristRoamingInAdapt) {
		this.touristRoamingInAdapt = touristRoamingInAdapt;
	}
	/**
	public String getKey() {
		return touristRoamingInAdapt.getKey();
	}

	public TouristRoamingIn createTouristRoamingIn(TouristRoamingIn touristRoamingIn) {
		touristRoamingInAdapt.createTouristRoamingIn(touristRoamingIn);
		return touristRoamingIn;
	}

	public TouristRoamingIn modifyTouristRoamingIn(TouristRoamingIn touristRoamingIn) {
		touristRoamingInAdapt.modifyTouristRoamingIn(touristRoamingIn);
		return touristRoamingIn;
	}

	public void deleteTouristRoamingIn(TouristRoamingIn touristRoamingIn) {
		touristRoamingInAdapt.deleteTouristRoamingIn(touristRoamingIn);
	}

	public void batchDeleteTouristRoamingIn(List<TouristRoamingIn> touristRoamingInList) {
		touristRoamingInAdapt.batchDeleteTouristRoamingIn(touristRoamingInList);
	}

	public TouristRoamingIn getTouristRoamingInById(String touristRoamingInId) {
		return touristRoamingInAdapt.getTouristRoamingInById(touristRoamingInId);
	}
**/
	public List<TouristRoamingIn> queryTouristRoamingIn(TouristRoaming touristRoaming) {
		return touristRoamingInAdapt.queryTouristRoamingIn(touristRoaming);
	}
//	@Override
//	public List<TouristRomaingIn2> queryTouristMonth(TouristRomaingIn2 touristRoamingIn) {
//		return touristRoamingInAdapt.queryTouristMonth(touristRoamingIn);
//	}
	@Override
	public List<TouristRomaingIn2> queryTouristMonth(TouristRomaingIn2 touristRoamingIn) {
		return touristRoamingInAdapt.queryTouristMonth(touristRoamingIn);
	}
	@Override
	public List<Areas> queryByCityid(String cityid) {
		// TODO Auto-generated method stub
		return touristRoamingInAdapt.queryByCityid(cityid);
	}
	@Override
	public List<Areas> queryByCounty(String countyid) {
		// TODO Auto-generated method stub
		return touristRoamingInAdapt.queryByCounty(countyid);
	}
	
}