package com.funo.mobile.adapt.impl;

import java.util.List;

import com.funo.base.adapt.BaseAdapt;
import com.funo.mobile.adapt.IMobileStatAdapt;
import com.funo.mobile.dao.IMobileStatDao;
import com.funo.mobile.model.MobileStat;
import com.funo.mobile.model.MobileStatResult;

public class MobileStatAdapt extends BaseAdapt implements IMobileStatAdapt {

	private static final long serialVersionUID = 1L;
	private IMobileStatDao mobileStatDao;

	
	public IMobileStatDao getMobileStatDao() {
		return mobileStatDao;
	}


	public void setMobileStatDao(IMobileStatDao mobileStatDao) {
		this.mobileStatDao = mobileStatDao;
	}


	@Override
	public List<MobileStatResult> queryByTouristStat(MobileStat mobileStat) {
		return mobileStatDao.queryByTouristStat(mobileStat);
	}
	
	public List<MobileStatResult> queryByTouristStatDetail(MobileStat mobileStat){
		return mobileStatDao.queryByTouristStatDetail(mobileStat);
	}
	
	
	public List<MobileStatResult> queryByStatRealTime(MobileStat mobileStat){
		return mobileStatDao.queryByStatRealTime(mobileStat);
	}
	
	public List<MobileStatResult> queryByRegionRemainByDate(MobileStat mobileStat){
		return mobileStatDao.queryByRegionRemainByDate(mobileStat);
	}
	
	public List<MobileStatResult>  queryByTravelStayAvgTime(MobileStat mobileStat){
		return mobileStatDao.queryByTravelStayAvgTime(mobileStat);
	}
	
	public List<MobileStatResult> queryByRegionName(MobileStat mobileStat){
		return mobileStatDao.queryByRegionName(mobileStat);
	}
	
	public List<MobileStatResult> queryByReportStayDays(MobileStat mobileStat){
		return mobileStatDao.queryByReportStayDays(mobileStat);
	}
	
	public List<MobileStatResult> queryByAllregreceiveByMonth(MobileStat mobileStat){
		return mobileStatDao.queryByAllregreceiveByMonth(mobileStat);
	}
	
	public List<MobileStatResult> queryByAllregreceiveByDate(MobileStat mobileStat){
		return mobileStatDao.queryByAllregreceiveByDate(mobileStat);
	}
	
	public List<MobileStatResult> queryByRegionRealtimeSum(MobileStat mobileStat){
		return mobileStatDao.queryByRegionRealtimeSum(mobileStat);
	}
	
	public List<MobileStatResult> queryByRegionRealtimeSumAdd(MobileStat mobileStat){
		return mobileStatDao.queryByRegionRealtimeSumAdd(mobileStat);
	}
	
	public List<MobileStatResult> queryByReportOriginPlace(MobileStat mobileStat){
		return mobileStatDao.queryByReportOriginPlace(mobileStat);
	}
	
	public List<MobileStatResult> queryByReportRegionHot(MobileStat mobileStat){
		return mobileStatDao.queryByReportRegionHot(mobileStat);
	}
	
	public List<MobileStatResult> queryByReportOriginPlaceAll(MobileStat mobileStat){
		return mobileStatDao.queryByReportOriginPlaceAll(mobileStat);
	}
}