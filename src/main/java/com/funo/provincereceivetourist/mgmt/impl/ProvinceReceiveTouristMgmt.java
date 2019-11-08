package com.funo.provincereceivetourist.mgmt.impl;

import java.util.List;

import com.funo.base.mgmt.BaseMgmt;
import com.funo.provincereceivetourist.adapt.IProvinceReceiveTouristAdapt;
import com.funo.provincereceivetourist.mgmt.IProvinceReceiveTouristMgmt;
import com.funo.provincereceivetourist.model.ProvinceReceiveTourist;

public class ProvinceReceiveTouristMgmt extends BaseMgmt implements IProvinceReceiveTouristMgmt {

	private static final long serialVersionUID = 1L;
	private IProvinceReceiveTouristAdapt provinceReceiveTouristAdapt;
	
	public IProvinceReceiveTouristAdapt getProvinceReceiveTouristAdapt() {
		return provinceReceiveTouristAdapt;
	}
	public void setProvinceReceiveTouristAdapt(IProvinceReceiveTouristAdapt provinceReceiveTouristAdapt) {
		this.provinceReceiveTouristAdapt = provinceReceiveTouristAdapt;
	}

	public String getKey() {
		return provinceReceiveTouristAdapt.getKey();
	}

	public ProvinceReceiveTourist createProvinceReceiveTourist(ProvinceReceiveTourist provinceReceiveTourist) {
		provinceReceiveTouristAdapt.createProvinceReceiveTourist(provinceReceiveTourist);
		return provinceReceiveTourist;
	}

	public ProvinceReceiveTourist modifyProvinceReceiveTourist(ProvinceReceiveTourist provinceReceiveTourist) {
		provinceReceiveTouristAdapt.modifyProvinceReceiveTourist(provinceReceiveTourist);
		return provinceReceiveTourist;
	}

	public void deleteProvinceReceiveTourist(ProvinceReceiveTourist provinceReceiveTourist) {
		provinceReceiveTouristAdapt.deleteProvinceReceiveTourist(provinceReceiveTourist);
	}

	public void batchDeleteProvinceReceiveTourist(List<ProvinceReceiveTourist> provinceReceiveTouristList) {
		provinceReceiveTouristAdapt.batchDeleteProvinceReceiveTourist(provinceReceiveTouristList);
	}

	public ProvinceReceiveTourist getProvinceReceiveTouristById(String provinceReceiveTouristId) {
		return provinceReceiveTouristAdapt.getProvinceReceiveTouristById(provinceReceiveTouristId);
	}

	public List<ProvinceReceiveTourist> queryProvinceReceiveTourist(ProvinceReceiveTourist provinceReceiveTourist) {
		return provinceReceiveTouristAdapt.queryProvinceReceiveTourist(provinceReceiveTourist);
	}
	
	public List<ProvinceReceiveTourist> queryTouristCityMonth(ProvinceReceiveTourist provinceReceiveTourist) {
		return provinceReceiveTouristAdapt.queryTouristCityMonth(provinceReceiveTourist);
	}
	
	public List<ProvinceReceiveTourist> queryMonthTourist(ProvinceReceiveTourist provinceReceiveTourist) {
		return provinceReceiveTouristAdapt.queryMonthTourist(provinceReceiveTourist);
	}
	
	//地市年接待游客总数
	public List<ProvinceReceiveTourist> queryCityYearTourist(ProvinceReceiveTourist provinceReceiveTourist) {
		return provinceReceiveTouristAdapt.queryCityYearTourist(provinceReceiveTourist);
	}
	
	public List<ProvinceReceiveTourist> queryCityRegionYearTourist(ProvinceReceiveTourist provinceReceiveTourist) {
		return provinceReceiveTouristAdapt.queryCityRegionYearTourist(provinceReceiveTourist);
	}
	
	public List<ProvinceReceiveTourist> queryProvinceDayReceiveTourist(ProvinceReceiveTourist provinceReceiveTourist){
		return provinceReceiveTouristAdapt.queryProvinceDayReceiveTourist(provinceReceiveTourist);
	}
	
	public List<ProvinceReceiveTourist> queryCityIdFromCityRegions(ProvinceReceiveTourist provinceReceiveTourist){
		return provinceReceiveTouristAdapt.queryCityIdFromCityRegions(provinceReceiveTourist);
	}
	@Override
	public List<ProvinceReceiveTourist> queryCityRegionReceiverByYear(ProvinceReceiveTourist provinceReceiveTourist) {
		return provinceReceiveTouristAdapt.queryCityRegionReveiverTourist(provinceReceiveTourist);
	}
	@Override
	public List<ProvinceReceiveTourist> selectByProvinceYearRegionReceiver(
			ProvinceReceiveTourist provinceReceiveTourist) {
		return provinceReceiveTouristAdapt.selectByProvinceYearRegionReceiver(provinceReceiveTourist);
	}
	
}