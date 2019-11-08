package com.funo.touristroamingovernightin.mgmt.impl;

import java.util.List;

import com.funo.base.mgmt.BaseMgmt;
import com.funo.region.model.Areas;
import com.funo.touristroaming.model.TouristRoaming;
import com.funo.touristroamingin.model.TouristRomaingIn2;
import com.funo.touristroamingovernightin.adapt.ITouristRoamingOvernightInAdapt;
import com.funo.touristroamingovernightin.mgmt.ITouristRoamingOvernightInMgmt;
import com.funo.touristroamingovernightin.model.TouristRoamingOvernightIn;

public class TouristRoamingOvernightInMgmt extends BaseMgmt implements ITouristRoamingOvernightInMgmt {

	private static final long serialVersionUID = 1L;
	private ITouristRoamingOvernightInAdapt touristRoamingOvernightInAdapt;
	
	public ITouristRoamingOvernightInAdapt getTouristRoamingOvernightInAdapt() {
		return touristRoamingOvernightInAdapt;
	}
	public void setTouristRoamingOvernightInAdapt(ITouristRoamingOvernightInAdapt touristRoamingOvernightInAdapt) {
		this.touristRoamingOvernightInAdapt = touristRoamingOvernightInAdapt;
	}

	public String getKey() {
		return touristRoamingOvernightInAdapt.getKey();
	}

	public TouristRoamingOvernightIn createTouristRoamingOvernightIn(TouristRoamingOvernightIn touristRoamingOvernightIn) {
		touristRoamingOvernightInAdapt.createTouristRoamingOvernightIn(touristRoamingOvernightIn);
		return touristRoamingOvernightIn;
	}

	public TouristRoamingOvernightIn modifyTouristRoamingOvernightIn(TouristRoamingOvernightIn touristRoamingOvernightIn) {
		touristRoamingOvernightInAdapt.modifyTouristRoamingOvernightIn(touristRoamingOvernightIn);
		return touristRoamingOvernightIn;
	}

	public void deleteTouristRoamingOvernightIn(TouristRoamingOvernightIn touristRoamingOvernightIn) {
		touristRoamingOvernightInAdapt.deleteTouristRoamingOvernightIn(touristRoamingOvernightIn);
	}

	public void batchDeleteTouristRoamingOvernightIn(List<TouristRoamingOvernightIn> touristRoamingOvernightInList) {
		touristRoamingOvernightInAdapt.batchDeleteTouristRoamingOvernightIn(touristRoamingOvernightInList);
	}

	public TouristRoamingOvernightIn getTouristRoamingOvernightInById(String touristRoamingOvernightInId) {
		return touristRoamingOvernightInAdapt.getTouristRoamingOvernightInById(touristRoamingOvernightInId);
	}

	public List<TouristRoamingOvernightIn> queryTouristRoamingOvernightIn(TouristRoamingOvernightIn touristRoamingOvernightIn) {
		return touristRoamingOvernightInAdapt.queryTouristRoamingOvernightIn(touristRoamingOvernightIn);
	}
	@Override
	public List<TouristRomaingIn2> queryTouristByCitysMonth(TouristRomaingIn2 touristRoamingIn) {
		return touristRoamingOvernightInAdapt.queryTouristByCitysMonth(touristRoamingIn);
	}
	@Override
	public List<Areas> queryByCityid(String cityid) {
		// TODO Auto-generated method stub
		return touristRoamingOvernightInAdapt.queryByCityid(cityid);
	}
	@Override
	public List<Areas> queryByCounty(String countyid) {
		// TODO Auto-generated method stub
		return touristRoamingOvernightInAdapt.queryByCounty(countyid);
	}
	
}