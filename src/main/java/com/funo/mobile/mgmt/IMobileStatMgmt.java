package com.funo.mobile.mgmt;

import java.util.List;

import com.funo.mobile.model.MobileStat;
import com.funo.mobile.model.MobileStatResult;



public interface IMobileStatMgmt {

	public List<MobileStatResult> queryByTouristStat(MobileStat mobileStat);
	
	public List<MobileStatResult> queryByTouristStatDetail(MobileStat mobileStat);
	
	public List<MobileStatResult> queryByStatRealTime(MobileStat mobileStat);
	
	public List<MobileStatResult> queryByRegionRemainByDate(MobileStat mobileStat);
	
	public List<MobileStatResult>  queryByTravelStayAvgTime(MobileStat mobileStat);
	
	public List<MobileStatResult> queryByRegionName(MobileStat mobileStat);
	
	public List<MobileStatResult> queryByReportStayDays(MobileStat mobileStat);
	
	public List<MobileStatResult> queryByAllregreceiveByMonth(MobileStat mobileStat);
	
	public List<MobileStatResult> queryByAllregreceiveByDate(MobileStat mobileStat);
	
	public List<MobileStatResult> queryByRegionRealtimeSum(MobileStat mobileStat);
	
	public List<MobileStatResult> queryByRegionRealtimeSumAdd(MobileStat mobileStat);
	
	public List<MobileStatResult> queryByReportOriginPlace(MobileStat mobileStat);
	
	public List<MobileStatResult> queryByReportOriginPlaceAll(MobileStat mobileStat);
	
	public List<MobileStatResult> queryByReportRegionHot(MobileStat mobileStat);
}