package com.funo.touristroamingovernightnodul.mgmt.impl;

import java.util.List;

import com.funo.base.mgmt.BaseMgmt;
import com.funo.region.model.Areas;
import com.funo.touristroamingovernightnodul.adapt.ITouristRoamingOvernightAdapt;
import com.funo.touristroamingovernightnodul.mgmt.ITouristRoamingOvernightMgmt;
import com.funo.touristroamingovernightnodul.model.TouristRoamingOvernight;
import com.funo.touristtoamingout.model.TouristRoamingOut2;

public class TouristRoamingOvernightMgmt extends BaseMgmt implements ITouristRoamingOvernightMgmt {

	private static final long serialVersionUID = 1L;
	private ITouristRoamingOvernightAdapt touristRoamingOvernightAdapt;
	
	public ITouristRoamingOvernightAdapt getTouristRoamingOvernightAdapt() {
		return touristRoamingOvernightAdapt;
	}
	public void setTouristRoamingOvernightAdapt(ITouristRoamingOvernightAdapt touristRoamingOvernightAdapt) {
		this.touristRoamingOvernightAdapt = touristRoamingOvernightAdapt;
	}

	public String getKey() {
		return touristRoamingOvernightAdapt.getKey();
	}

	public TouristRoamingOvernight createTouristRoamingOvernight(TouristRoamingOvernight touristRoamingOvernight) {
		touristRoamingOvernightAdapt.createTouristRoamingOvernight(touristRoamingOvernight);
		return touristRoamingOvernight;
	}

	public TouristRoamingOvernight modifyTouristRoamingOvernight(TouristRoamingOvernight touristRoamingOvernight) {
		touristRoamingOvernightAdapt.modifyTouristRoamingOvernight(touristRoamingOvernight);
		return touristRoamingOvernight;
	}

	public void deleteTouristRoamingOvernight(TouristRoamingOvernight touristRoamingOvernight) {
		touristRoamingOvernightAdapt.deleteTouristRoamingOvernight(touristRoamingOvernight);
	}

	public void batchDeleteTouristRoamingOvernight(List<TouristRoamingOvernight> touristRoamingOvernightList) {
		touristRoamingOvernightAdapt.batchDeleteTouristRoamingOvernight(touristRoamingOvernightList);
	}

	public TouristRoamingOvernight getTouristRoamingOvernightById(String touristRoamingOvernightId) {
		return touristRoamingOvernightAdapt.getTouristRoamingOvernightById(touristRoamingOvernightId);
	}

	public List<TouristRoamingOvernight> queryTouristRoamingOvernight(TouristRoamingOvernight touristRoamingOvernight) {
		return touristRoamingOvernightAdapt.queryTouristRoamingOvernight(touristRoamingOvernight);
	}
	@Override
	public List<TouristRoamingOut2> queryTouristRoamingOvernight2(TouristRoamingOut2 touristRoamingOut) {
		return touristRoamingOvernightAdapt.queryTouristRoamingOvernight2(touristRoamingOut);
	}
	@Override
	public List<Areas> queryByCityid(String cityid) {
		// TODO Auto-generated method stub
		return touristRoamingOvernightAdapt.queryByCityid(cityid);
	}
	@Override
	public List<Areas> queryByCounty(String countyid) {
		// TODO Auto-generated method stub
		return touristRoamingOvernightAdapt.queryByCounty(countyid);
	}
	
}