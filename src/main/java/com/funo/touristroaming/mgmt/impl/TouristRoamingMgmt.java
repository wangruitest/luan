package com.funo.touristroaming.mgmt.impl;

import java.util.List;

import com.funo.base.mgmt.BaseMgmt;
import com.funo.touristroaming.adapt.ITouristRoamingAdapt;
import com.funo.touristroaming.mgmt.ITouristRoamingMgmt;
import com.funo.touristroaming.model.ShitaiRoaming;
import com.funo.touristroaming.model.TouristRoaming;

public class TouristRoamingMgmt extends BaseMgmt implements ITouristRoamingMgmt {

	private static final long serialVersionUID = 1L;
	private ITouristRoamingAdapt touristRoamingAdapt;
	
	public ITouristRoamingAdapt getTouristRoamingAdapt() {
		return touristRoamingAdapt;
	}
	public void setTouristRoamingAdapt(ITouristRoamingAdapt touristRoamingAdapt) {
		this.touristRoamingAdapt = touristRoamingAdapt;
	}

	public String getKey() {
		return touristRoamingAdapt.getKey();
	}

	public TouristRoaming createTouristRoaming(TouristRoaming touristRoaming) {
		touristRoamingAdapt.createTouristRoaming(touristRoaming);
		return touristRoaming;
	}

	public TouristRoaming modifyTouristRoaming(TouristRoaming touristRoaming) {
		touristRoamingAdapt.modifyTouristRoaming(touristRoaming);
		return touristRoaming;
	}

	public void deleteTouristRoaming(TouristRoaming touristRoaming) {
		touristRoamingAdapt.deleteTouristRoaming(touristRoaming);
	}

	public void batchDeleteTouristRoaming(List<TouristRoaming> touristRoamingList) {
		touristRoamingAdapt.batchDeleteTouristRoaming(touristRoamingList);
	}

	public TouristRoaming getTouristRoamingById(String touristRoamingId) {
		return touristRoamingAdapt.getTouristRoamingById(touristRoamingId);
	}

	public List<TouristRoaming> queryTouristRoaming(TouristRoaming touristRoaming) {
		return touristRoamingAdapt.queryTouristRoaming(touristRoaming);
	}
	
	public List<TouristRoaming> queryAllCityTouristRoaming(TouristRoaming touristRoaming) {
		return touristRoamingAdapt.queryAllCityTouristRoaming(touristRoaming);
	}
	@Override
	public List<TouristRoaming> queryByAllCounty(TouristRoaming touristRoaming) {
		return touristRoamingAdapt.queryByAllCounty(touristRoaming);
	}
	@Override
	public List<ShitaiRoaming> queryByShitai(ShitaiRoaming shitaiRoaming) {
		return touristRoamingAdapt.queryByShitai(shitaiRoaming);
	}
	
}