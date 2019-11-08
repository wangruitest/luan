package com.funo.provincereceivetourist.adapt.impl;

import java.util.List;

import com.funo.base.adapt.BaseAdapt;
import com.funo.provincereceivetourist.dao.IProvinceReceiveTouristDao;
import com.funo.provincereceivetourist.adapt.IProvinceReceiveTouristAdapt;
import com.funo.provincereceivetourist.model.ProvinceReceiveTourist;

public class ProvinceReceiveTouristAdapt extends BaseAdapt implements IProvinceReceiveTouristAdapt {

	private static final long serialVersionUID = 1L;
	private IProvinceReceiveTouristDao provinceReceiveTouristDao;
	
	public IProvinceReceiveTouristDao getProvinceReceiveTouristDao() {
		return provinceReceiveTouristDao;
	}

	public void setProvinceReceiveTouristDao(IProvinceReceiveTouristDao provinceReceiveTouristDao) {
		this.provinceReceiveTouristDao = provinceReceiveTouristDao;
	}

	public String getKey() {
		return provinceReceiveTouristDao.getKey();
	}

	public ProvinceReceiveTourist createProvinceReceiveTourist(ProvinceReceiveTourist provinceReceiveTourist) {
		provinceReceiveTouristDao.create(provinceReceiveTourist);
		return provinceReceiveTourist;
	}

	public ProvinceReceiveTourist modifyProvinceReceiveTourist(ProvinceReceiveTourist provinceReceiveTourist) {
		provinceReceiveTouristDao.update(provinceReceiveTourist);
		return provinceReceiveTourist;
	}

	public void deleteProvinceReceiveTourist(ProvinceReceiveTourist provinceReceiveTourist) {
		provinceReceiveTouristDao.delete(provinceReceiveTourist);
	}

	public void batchDeleteProvinceReceiveTourist(List<ProvinceReceiveTourist> provinceReceiveTouristList) {
		provinceReceiveTouristDao.batchCreate(provinceReceiveTouristList);
	}

	public ProvinceReceiveTourist getProvinceReceiveTouristById(String provinceReceiveTouristId) {
		return provinceReceiveTouristDao.getById(provinceReceiveTouristId);
	}

	public List<ProvinceReceiveTourist> queryProvinceReceiveTourist(ProvinceReceiveTourist provinceReceiveTourist) {
		return provinceReceiveTouristDao.queryByArgs(provinceReceiveTourist);
	}
	
	public List<ProvinceReceiveTourist> queryTouristCityMonth(ProvinceReceiveTourist provinceReceiveTourist) {
		return provinceReceiveTouristDao.queryByCityMonth(provinceReceiveTourist);
	}
	
	public List<ProvinceReceiveTourist> queryMonthTourist(ProvinceReceiveTourist provinceReceiveTourist) {
		return provinceReceiveTouristDao.queryByMonthTourist(provinceReceiveTourist);
	}
	
	public List<ProvinceReceiveTourist> queryCityYearTourist(ProvinceReceiveTourist provinceReceiveTourist) {
		return provinceReceiveTouristDao.queryByCityYearTourist(provinceReceiveTourist);
	}
	
	public List<ProvinceReceiveTourist> queryCityRegionYearTourist(ProvinceReceiveTourist provinceReceiveTourist) {
		return provinceReceiveTouristDao.queryByCityRegionYearTourist(provinceReceiveTourist);
	}
	
	public List<ProvinceReceiveTourist> queryProvinceDayReceiveTourist(ProvinceReceiveTourist provinceReceiveTourist) {
		return provinceReceiveTouristDao.queryByProvinceDayReceiveTourist(provinceReceiveTourist);
	}
	
	public List<ProvinceReceiveTourist> queryCityIdFromCityRegions(ProvinceReceiveTourist provinceReceiveTourist) {
		return provinceReceiveTouristDao.queryByCityIdFromCityRegions(provinceReceiveTourist);
	}

	@Override
	public List<ProvinceReceiveTourist> queryCityRegionReveiverTourist(ProvinceReceiveTourist provinceReceiveTourist) {
		return  provinceReceiveTouristDao.selectByCityYearRegionReceiver(provinceReceiveTourist);
	}

	@Override
	public List<ProvinceReceiveTourist> selectByProvinceYearRegionReceiver(
			ProvinceReceiveTourist provinceReceiveTourist) {		
		return provinceReceiveTouristDao.selectByProvinceYearRegionReceiver(provinceReceiveTourist);
	}

	
}