package com.funo.mobile.mgmt.impl;

import java.util.List;

import com.funo.base.mgmt.BaseMgmt;
import com.funo.mobile.adapt.IMobileStatAdapt;
import com.funo.mobile.mgmt.IMobileStatMgmt;
import com.funo.mobile.model.MobileStat;
import com.funo.mobile.model.MobileStatResult;

public class MobileStatMgmt extends BaseMgmt implements IMobileStatMgmt {

	private static final long serialVersionUID = 1L;
	private IMobileStatAdapt mobileStatAdapt;
	
	public IMobileStatAdapt getMobileStatAdapt() {
		return mobileStatAdapt;
	}
	public void setMobileStatAdapt(IMobileStatAdapt mobileStatAdapt) {
		this.mobileStatAdapt = mobileStatAdapt;
	}
	@Override
	public List<MobileStatResult> queryByTouristStat(MobileStat mobileStat) {
		return mobileStatAdapt.queryByTouristStat(mobileStat);
	}
	

	public List<MobileStatResult> queryByTouristStatDetail(MobileStat mobileStat){
		return mobileStatAdapt.queryByTouristStatDetail(mobileStat);
	}
	
	public List<MobileStatResult> queryByStatRealTime(MobileStat mobileStat){
		return mobileStatAdapt.queryByStatRealTime(mobileStat);
	}
	
	public List<MobileStatResult> queryByRegionRemainByDate(MobileStat mobileStat){
		return mobileStatAdapt.queryByRegionRemainByDate(mobileStat);
	}
	
	public List<MobileStatResult>  queryByTravelStayAvgTime(MobileStat mobileStat){
		return mobileStatAdapt.queryByTravelStayAvgTime(mobileStat);
	}
	
	public List<MobileStatResult> queryByRegionName(MobileStat mobileStat){
		return mobileStatAdapt.queryByRegionName(mobileStat);
	}
	
	public List<MobileStatResult> queryByReportStayDays(MobileStat mobileStat){
		return mobileStatAdapt.queryByReportStayDays(mobileStat);
	}
	
	public List<MobileStatResult> queryByAllregreceiveByMonth(MobileStat mobileStat){
		return mobileStatAdapt.queryByAllregreceiveByMonth(mobileStat);
	}
	
	public List<MobileStatResult> queryByAllregreceiveByDate(MobileStat mobileStat){
		return mobileStatAdapt.queryByAllregreceiveByDate(mobileStat);
	}
	
	public List<MobileStatResult> queryByRegionRealtimeSum(MobileStat mobileStat){
		return mobileStatAdapt.queryByRegionRealtimeSum(mobileStat);
	}
	
	public List<MobileStatResult> queryByRegionRealtimeSumAdd(MobileStat mobileStat){
		return mobileStatAdapt.queryByRegionRealtimeSumAdd(mobileStat);
	}
	
	public List<MobileStatResult> queryByReportOriginPlace(MobileStat mobileStat){
		return mobileStatAdapt.queryByReportOriginPlace(mobileStat);
	}
	
	public List<MobileStatResult> queryByReportOriginPlaceAll(MobileStat mobileStat){
		return mobileStatAdapt.queryByReportOriginPlaceAll(mobileStat);
	}
	
	public List<MobileStatResult> queryByReportRegionHot(MobileStat mobileStat){
		return mobileStatAdapt.queryByReportRegionHot(mobileStat);
	}
}