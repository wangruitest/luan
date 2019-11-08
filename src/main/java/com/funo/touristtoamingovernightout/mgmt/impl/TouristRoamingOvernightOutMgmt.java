package com.funo.touristtoamingovernightout.mgmt.impl;

import java.util.List;

import com.funo.base.mgmt.BaseMgmt;
import com.funo.region.model.Areas;
import com.funo.touristtoamingout.model.TouristRoamingOut2;
import com.funo.touristtoamingovernightout.adapt.ITouristRoamingOvernightOutAdapt;
import com.funo.touristtoamingovernightout.mgmt.ITouristRoamingOvernightOutMgmt;
import com.funo.touristtoamingovernightout.model.TouristRoamingOvernightOut;

public class TouristRoamingOvernightOutMgmt extends BaseMgmt implements ITouristRoamingOvernightOutMgmt {

	private static final long serialVersionUID = 1L;
	private ITouristRoamingOvernightOutAdapt touristRoamingOvernightOutAdapt;
	
	public ITouristRoamingOvernightOutAdapt getTouristRoamingOvernightOutAdapt() {
		return touristRoamingOvernightOutAdapt;
	}
	public void setTouristRoamingOvernightOutAdapt(ITouristRoamingOvernightOutAdapt touristRoamingOvernightOutAdapt) {
		this.touristRoamingOvernightOutAdapt = touristRoamingOvernightOutAdapt;
	}

	public String getKey() {
		return touristRoamingOvernightOutAdapt.getKey();
	}

	public TouristRoamingOvernightOut createTouristRoamingOvernightOut(TouristRoamingOvernightOut touristRoamingOvernightOut) {
		touristRoamingOvernightOutAdapt.createTouristRoamingOvernightOut(touristRoamingOvernightOut);
		return touristRoamingOvernightOut;
	}

	public TouristRoamingOvernightOut modifyTouristRoamingOvernightOut(TouristRoamingOvernightOut touristRoamingOvernightOut) {
		touristRoamingOvernightOutAdapt.modifyTouristRoamingOvernightOut(touristRoamingOvernightOut);
		return touristRoamingOvernightOut;
	}

//	public void deleteTouristRoamingOvernightOut(TouristRoamingOvernightOut touristRoamingOvernightOut) {
//		touristRoamingOvernightOutAdapt.deleteTouristRoamingOvernightOut(touristRoamingOvernightOut);
//	}
//
//	public void batchDeleteTouristRoamingOvernightOut(List<TouristRoamingOvernightOut> touristRoamingOvernightOutList) {
//		touristRoamingOvernightOutAdapt.batchDeleteTouristRoamingOvernightOut(touristRoamingOvernightOutList);
//	}
//
//	public TouristRoamingOvernightOut getTouristRoamingOvernightOutById(String touristRoamingOvernightOutId) {
//		return touristRoamingOvernightOutAdapt.getTouristRoamingOvernightOutById(touristRoamingOvernightOutId);
//	}

	public List<TouristRoamingOvernightOut> queryTouristRoamingOvernightProvincesOut(TouristRoamingOvernightOut touristRoamingOvernightOut) {
		return touristRoamingOvernightOutAdapt.queryTouristRoamingOvernightProvincesOut(touristRoamingOvernightOut);
	}
	@Override
	public List<TouristRoamingOut2> queryTouristRoamingOvernightProvincesOut2(TouristRoamingOut2 touristRoamingOut) {
		return touristRoamingOvernightOutAdapt.queryTouristRoamingOvernightProvincesOut2(touristRoamingOut);
	}
	@Override
	public List<Areas> queryByCityid(String cityid) {
		// TODO Auto-generated method stub
		return touristRoamingOvernightOutAdapt.queryByCityid(cityid);
	}
	@Override
	public List<Areas> queryByCounty(String countyid) {
		// TODO Auto-generated method stub
		return touristRoamingOvernightOutAdapt.queryByCounty(countyid);
	}
	
}