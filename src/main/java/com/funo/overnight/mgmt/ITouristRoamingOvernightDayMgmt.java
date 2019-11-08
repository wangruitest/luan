package com.funo.overnight.mgmt;

import java.util.List;

import com.funo.overnight.model.TouristRoamingOvernightDay;


public interface ITouristRoamingOvernightDayMgmt {

	public String getKey();

	public TouristRoamingOvernightDay createTouristRoamingOvernightDay(TouristRoamingOvernightDay touristRoamingOvernightDay);

	public TouristRoamingOvernightDay modifyTouristRoamingOvernightDay(TouristRoamingOvernightDay touristRoamingOvernightDay);

	public void deleteTouristRoamingOvernightDay(TouristRoamingOvernightDay touristRoamingOvernightDay);

	public void batchDeleteTouristRoamingOvernightDay(List<TouristRoamingOvernightDay> touristRoamingOvernightDayList);

	public TouristRoamingOvernightDay getTouristRoamingOvernightDayById(String unid);

	public List<TouristRoamingOvernightDay> queryTouristRoamingOvernightDay(TouristRoamingOvernightDay touristRoamingOvernightDay);

}