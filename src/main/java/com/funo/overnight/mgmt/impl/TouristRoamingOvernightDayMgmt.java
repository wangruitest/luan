package com.funo.overnight.mgmt.impl;

import java.util.List;

import com.funo.base.mgmt.BaseMgmt;
import com.funo.overnight.adapt.ITouristRoamingOvernightDayAdapt;
import com.funo.overnight.mgmt.ITouristRoamingOvernightDayMgmt;
import com.funo.overnight.model.TouristRoamingOvernightDay;

public class TouristRoamingOvernightDayMgmt extends BaseMgmt implements ITouristRoamingOvernightDayMgmt {

	private static final long serialVersionUID = 1L;
	private ITouristRoamingOvernightDayAdapt touristRoamingOvernightDayAdapt;
	
	public ITouristRoamingOvernightDayAdapt getTouristRoamingOvernightDayAdapt() {
		return touristRoamingOvernightDayAdapt;
	}
	public void setTouristRoamingOvernightDayAdapt(ITouristRoamingOvernightDayAdapt touristRoamingOvernightDayAdapt) {
		this.touristRoamingOvernightDayAdapt = touristRoamingOvernightDayAdapt;
	}

	public String getKey() {
		return touristRoamingOvernightDayAdapt.getKey();
	}

	public TouristRoamingOvernightDay createTouristRoamingOvernightDay(TouristRoamingOvernightDay touristRoamingOvernightDay) {
		touristRoamingOvernightDayAdapt.createTouristRoamingOvernightDay(touristRoamingOvernightDay);
		return touristRoamingOvernightDay;
	}

	public TouristRoamingOvernightDay modifyTouristRoamingOvernightDay(TouristRoamingOvernightDay touristRoamingOvernightDay) {
		touristRoamingOvernightDayAdapt.modifyTouristRoamingOvernightDay(touristRoamingOvernightDay);
		return touristRoamingOvernightDay;
	}

	public void deleteTouristRoamingOvernightDay(TouristRoamingOvernightDay touristRoamingOvernightDay) {
		touristRoamingOvernightDayAdapt.deleteTouristRoamingOvernightDay(touristRoamingOvernightDay);
	}

	public void batchDeleteTouristRoamingOvernightDay(List<TouristRoamingOvernightDay> touristRoamingOvernightDayList) {
		touristRoamingOvernightDayAdapt.batchDeleteTouristRoamingOvernightDay(touristRoamingOvernightDayList);
	}

	public TouristRoamingOvernightDay getTouristRoamingOvernightDayById(String touristRoamingOvernightDayId) {
		return touristRoamingOvernightDayAdapt.getTouristRoamingOvernightDayById(touristRoamingOvernightDayId);
	}

	public List<TouristRoamingOvernightDay> queryTouristRoamingOvernightDay(TouristRoamingOvernightDay touristRoamingOvernightDay) {
		return touristRoamingOvernightDayAdapt.queryTouristRoamingOvernightDay(touristRoamingOvernightDay);
	}
	
}