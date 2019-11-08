package com.funo.mobile.mgmt;

import java.util.List;

import com.funo.mobile.model.Mobile;
import com.funo.mobile.model.MobileAlarm;
import com.funo.mobile.model.Region;
import com.funo.mobile.model.ReportOne;
import com.funo.mobile.model.ReportThree;
import com.funo.mobile.model.ReportTwo;
import com.funo.mobile.model.Software;
import com.funo.noticecfg.model.PageCount;


public interface IMobileMgmt {

	public String getKey();

	public Mobile createMobile(Mobile mobile);

	public Mobile modifyMobile(Mobile mobile);

	public void deleteMobile(Mobile mobile);

	public void batchDeleteMobile(List<Mobile> mobileList);

	public Mobile getMobileById(String unid);

	public List<Mobile> queryMobile(Mobile mobile);
	
	public List<Region> queryByRegions(Region region);

	public List<Software> queryBySoftware();
	
	public List<ReportOne> queryByReportOneTah(ReportOne reportOne);
	
	public List<ReportTwo> queryByReportTwo(ReportTwo reportTwo);
	
	
	public List<ReportThree> queryByReportThree(ReportThree reportThree);
	
	public List<ReportThree> queryByReportFour(ReportThree reportThree);
	
	public List<ReportOne> queryByReportFire(ReportOne reportOne);
	
	public List<MobileAlarm> queryByAlarm(MobileAlarm mobileAlarm);
	
	public List<PageCount> queryByCount(MobileAlarm mobileAlarm);
	
}